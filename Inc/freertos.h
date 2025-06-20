#ifndef FREERTOS_H
#define FREERTOS_H
#define configUSE_PREEMPTION 1
#define configUSE_PREEMPTION 1
#define configUSE_TIME_SLICING 1
#define configMINIMAL_STACK_SIZE	( ( unsigned short ) 128 )
#define configTICK_RATE_HZ			( ( TickType_t ) 1000 )
#define configCPU_CLOCK_HZ			( ( unsigned long ) 72000000 )
#define vPortSVCHandler     SVC_Handler
#define xPortPendSVHandler  PendSV_Handler
#define xPortSysTickHandler SysTick_Handler
#endif