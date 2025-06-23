#ifndef PORTMACRO_H
#define PORTMACRO_H
typedef unsigned int UBaseType_t;
typedef int BaseType_t;
typedef unsigned int TickType_t;
typedef void (*TaskFunction_t)(void*);
typedef unsigned int StackType_t;

#define pdFALSE			( ( BaseType_t ) 0 )
#define configLIBRARY_LOWEST_INTERRUPT_PRIORITY         0x0f
#define configKERNEL_INTERRUPT_PRIORITY         ( configLIBRARY_LOWEST_INTERRUPT_PRIORITY << (8 - configPRIO_BITS) )
#define configMAX_SYSCALL_INTERRUPT_PRIORITY    ( configLIBRARY_MAX_SYSCALL_INTERRUPT_PRIORITY << (8 - configPRIO_BITS) )
#define portNVIC_INT_CTRL_REG		( * ( ( volatile unsigned int * ) 0xe000ed04 ) )
#define portNVIC_PENDSVSET_BIT		( 1UL << 28UL )
#define configPRIO_BITS             4
#define configLIBRARY_MAX_SYSCALL_INTERRUPT_PRIORITY    0x01 

void vPortEnterCritical( void );
void vPortExitCritical( void );
#define portSET_INTERRUPT_MASK_FROM_ISR()		ulPortRaiseBASEPRI()
#define portCLEAR_INTERRUPT_MASK_FROM_ISR(x)	vPortSetBASEPRI(x)
#define portDISABLE_INTERRUPTS()				vPortRaiseBASEPRI()
#define portENABLE_INTERRUPTS()					vPortSetBASEPRI(0)
#define portENTER_CRITICAL()					vPortEnterCritical()
#define portEXIT_CRITICAL()						vPortExitCritical()




#define vPortSVCHandler     SVC_Handler
#define xPortPendSVHandler  PendSV_Handler
#define xPortSysTickHandler SysTick_Handler



inline __attribute__(( always_inline)) static void vPortRaiseBASEPRI( void )
{
	unsigned int ulNewBASEPRI;

	__asm volatile
	(
		"	mov %0, %1												\n"	\
		"	msr basepri, %0											\n" \
		"	isb														\n" \
		"	dsb														\n" \
		:"=r" (ulNewBASEPRI) : "i" ( configMAX_SYSCALL_INTERRUPT_PRIORITY )
	);
}
inline __attribute__(( always_inline)) static void vPortSetBASEPRI( unsigned int ulNewMaskValue )
{
	__asm volatile
	(
		"	msr basepri, %0	" :: "r" ( ulNewMaskValue )
	);
}
inline __attribute__(( always_inline)) static unsigned int ulPortRaiseBASEPRI( void )
{
	unsigned int ulOriginalBASEPRI, ulNewBASEPRI;

	__asm volatile
	(
		"	mrs %0, basepri											\n" \
		"	mov %1, %2												\n"	\
		"	msr basepri, %1											\n" \
		"	isb														\n" \
		"	dsb														\n" \
		:"=r" (ulOriginalBASEPRI), "=r" (ulNewBASEPRI) : "i" ( configMAX_SYSCALL_INTERRUPT_PRIORITY )
	);
	return ulOriginalBASEPRI;
}
#define portYIELD() 															\
{																				\
	portNVIC_INT_CTRL_REG = portNVIC_PENDSVSET_BIT;								\
	__asm volatile( "dsb" );													\
	__asm volatile( "isb" );													\
}																				\


BaseType_t xPortStartScheduler( void );
StackType_t *pxPortInitialiseStack( StackType_t *pxTopOfStack, TaskFunction_t pxCode, void *pvParameters );

#endif