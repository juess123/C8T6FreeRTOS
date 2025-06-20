#ifndef PORTMACRO_H
#define PORTMACRO_H

#define configLIBRARY_LOWEST_INTERRUPT_PRIORITY         0x0f
#define configKERNEL_INTERRUPT_PRIORITY         ( configLIBRARY_LOWEST_INTERRUPT_PRIORITY << (8 - configPRIO_BITS) )
#define portNVIC_INT_CTRL_REG		( * ( ( volatile uint32_t * ) 0xe000ed04 ) )

#define portNVIC_PENDSVSET_BIT		( 1UL << 28UL )

void vPortEnterCritical( void );
void vPortExitCritical( void );
#define portDISABLE_INTERRUPTS()				vPortRaiseBASEPRI()
#define portENABLE_INTERRUPTS()					vPortSetBASEPRI(0)
#define portENTER_CRITICAL()					vPortEnterCritical()
#define portEXIT_CRITICAL()						vPortExitCritical()
#ifndef portFORCE_INLINE
	#define portFORCE_INLINE inline __attribute__(( always_inline))
#endif
#define configLIBRARY_MAX_SYSCALL_INTERRUPT_PRIORITY    0x01 
#define configMAX_SYSCALL_INTERRUPT_PRIORITY    ( configLIBRARY_MAX_SYSCALL_INTERRUPT_PRIORITY << (8 - configPRIO_BITS) )
#ifdef __NVIC_PRIO_BITS
    #define configPRIO_BITS             __NVIC_PRIO_BITS
#else
    #define configPRIO_BITS             4
#endif
portFORCE_INLINE static void vPortRaiseBASEPRI( void )
{
uint32_t ulNewBASEPRI;

	__asm volatile
	(
		"	mov %0, %1												\n"	\
		"	msr basepri, %0											\n" \
		"	isb														\n" \
		"	dsb														\n" \
		:"=r" (ulNewBASEPRI) : "i" ( configMAX_SYSCALL_INTERRUPT_PRIORITY )
	);
}
portFORCE_INLINE static void vPortSetBASEPRI( uint32_t ulNewMaskValue )
{
	__asm volatile
	(
		"	msr basepri, %0	" :: "r" ( ulNewMaskValue )
	);
}
typedef void (*TaskFunction_t)(void*);
typedef unsigned int StackType_t;
typedef int BaseType_t;

BaseType_t xPortStartScheduler( void );
StackType_t *pxPortInitialiseStack( StackType_t *pxTopOfStack, TaskFunction_t pxCode, void *pvParameters );

#endif