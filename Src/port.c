#include "../Inc/portmacro.h"
#define portINITIAL_XPSR					( 0x01000000UL )
#define portSTART_ADDRESS_MASK				( ( StackType_t ) 0xfffffffeUL )
#define portVECTACTIVE_MASK					( 0xFFUL )
#define configTICK_RATE_HZ			( ( TickType_t ) 1000 )
#define configCPU_CLOCK_HZ			( ( unsigned long ) 72000000 )
#define portTASK_RETURN_ADDRESS	prvTaskExitError

#define portNVIC_SYSPRI2_REG				( * ( ( volatile unsigned int * ) 0xe000ed20 ) )
#define portNVIC_PENDSV_PRI					( ( ( unsigned int ) configKERNEL_INTERRUPT_PRIORITY ) << 16UL )
#define portNVIC_SYSTICK_PRI				( ( ( unsigned int ) configKERNEL_INTERRUPT_PRIORITY ) << 24UL )
#define portNVIC_SYSTICK_LOAD_REG			( * ( ( volatile unsigned int * ) 0xe000e014 ) )
#define portNVIC_SYSTICK_CTRL_REG			( * ( ( volatile unsigned int * ) 0xe000e010 ) )
#define portNVIC_SYSTICK_INT_BIT			( 1UL << 1UL )
#define portNVIC_SYSTICK_ENABLE_BIT			( 1UL << 0UL )
#define portNVIC_SYSTICK_CLK_BIT			( 1UL << 2UL )

static UBaseType_t uxCriticalNesting = 0xaaaaaaaa;
static volatile int testValue = 7;


static void prvTaskExitError( void )
{
	portDISABLE_INTERRUPTS();
	for( ;; );
}
StackType_t *pxPortInitialiseStack( StackType_t *pxTopOfStack, TaskFunction_t pxCode, void *pvParameters )
{
	pxTopOfStack--;
	*pxTopOfStack=portINITIAL_XPSR;
	pxTopOfStack--;
	*pxTopOfStack=((StackType_t)pxCode) & portSTART_ADDRESS_MASK;
	pxTopOfStack--;
	*pxTopOfStack = ( StackType_t )portTASK_RETURN_ADDRESS;
	pxTopOfStack -=5;
	*pxTopOfStack= (StackType_t)pvParameters;
	pxTopOfStack -=8;
	return pxTopOfStack;
}
void vPortEnterCritical( void )
{
    portDISABLE_INTERRUPTS();
    uxCriticalNesting++;
}
void vPortExitCritical( void )
{
	uxCriticalNesting--;
	if( uxCriticalNesting == 0 )
	{
		portENABLE_INTERRUPTS();
	}
}


__attribute__(( weak )) void vPortSetupTimerInterrupt( void )
{
	portNVIC_SYSTICK_LOAD_REG = ( configCPU_CLOCK_HZ / configTICK_RATE_HZ ) - 1UL;
	portNVIC_SYSTICK_CTRL_REG = ( portNVIC_SYSTICK_CLK_BIT | portNVIC_SYSTICK_INT_BIT | portNVIC_SYSTICK_ENABLE_BIT );
}


static void prvPortStartFirstTask( void )
{
	__asm volatile(
					" ldr r0, =0xE000ED08 	\n" /* Use the NVIC offset register to locate the stack. */
					" ldr r0, [r0] 			\n"
					" ldr r0, [r0] 			\n"
					" msr msp, r0			\n" /* Set the msp back to the start of the stack. */
					" cpsie i				\n" /* Globally enable interrupts. */
					" cpsie f				\n"
					" dsb					\n"
					" isb					\n"
					" svc 0					\n" /* System call to start first task. */
					" nop					\n"
				);
}



BaseType_t xPortStartScheduler( void )
{
	
	portNVIC_SYSPRI2_REG |= portNVIC_PENDSV_PRI;
	portNVIC_SYSPRI2_REG |= portNVIC_SYSTICK_PRI;
	
	vPortSetupTimerInterrupt();
	uxCriticalNesting=0;
	
	prvPortStartFirstTask();
	
	prvTaskExitError();
	return 0;
}

BaseType_t xTaskIncrementTick( void );
void xPortSysTickHandler( void )
{
	
	portDISABLE_INTERRUPTS();
	{
		if( xTaskIncrementTick() != pdFALSE )
		{
			
			portNVIC_INT_CTRL_REG = portNVIC_PENDSVSET_BIT;
		}
	}
	portENABLE_INTERRUPTS();
}
void xPortPendSVHandler( void )
{
	
	__asm volatile
	(
	"	mrs r0, psp							\n"
	"	isb									\n"
	"										\n"
	"	ldr	r3, pxCurrentTCBConst			\n" /* Get the location of the current TCB. */
	"	ldr	r2, [r3]						\n"
	"										\n"
	"	stmdb r0!, {r4-r11}					\n" /* Save the remaining registers. */
	"	str r0, [r2]						\n" /* Save the new top of stack into the first member of the TCB. */
	"										\n"
	"	stmdb sp!, {r3, r14}				\n"
	"	mov r0, %0							\n"
	"	msr basepri, r0						\n"
	"	bl vTaskSwitchContext				\n"
	"	mov r0, #0							\n"
	"	msr basepri, r0						\n"
	"	ldmia sp!, {r3, r14}				\n"
	"										\n"	/* Restore the context, including the critical nesting count. */
	"	ldr r1, [r3]						\n"
	"	ldr r0, [r1]						\n" /* The first item in pxCurrentTCB is the task top of stack. */
	"	ldmia r0!, {r4-r11}					\n" /* Pop the registers. */
	"	msr psp, r0							\n"
	"	isb									\n"
	"	bx r14								\n"
	"										\n"
	"	.align 4							\n"
	"pxCurrentTCBConst: .word pxCurrentTCB	\n"
	::"i"(configMAX_SYSCALL_INTERRUPT_PRIORITY)
	);
	
}

void vPortSVCHandler( void )
{
	
	__asm volatile (
					"	ldr	r3, pxCurrentTCBConst2		\n" /* Restore the context. */
					"	ldr r1, [r3]					\n" /* Use pxCurrentTCBConst to get the pxCurrentTCB address. */
					"	ldr r0, [r1]					\n" /* The first item in pxCurrentTCB is the task top of stack. */
					"	ldmia r0!, {r4-r11}				\n" /* Pop the registers that are not automatically saved on exception entry and the critical nesting count. */
					"	msr psp, r0						\n" /* Restore the task stack pointer. */
					"	isb								\n"
					"	mov r0, #0 						\n"
					"	msr	basepri, r0					\n"
					"	orr r14, #0xd					\n"
					"	bx r14							\n"
					"									\n"
					"	.align 4						\n"
					"pxCurrentTCBConst2: .word pxCurrentTCB				\n"
				);
}
