#ifndef TASK_H
#define TASK_H
#include <stdint.h>
#include "./heap.h"
#include "./list.h"
#include "./portmacro.h"
typedef unsigned int StackType_t;
typedef int BaseType_t;
typedef void (*TaskFunction_t)(void*);
typedef void* TaskHandle_t;

#define taskENTER_CRITICAL()		portENTER_CRITICAL()
#define taskEXIT_CRITICAL()			portEXIT_CRITICAL()
#define taskYIELD()                 portYIELD()


#define taskSCHEDULER_NOT_STARTED	( ( BaseType_t ) 1 )
#define taskSCHEDULER_SUSPENDED		( ( BaseType_t ) 0 )
#define taskSCHEDULER_RUNNING		( ( BaseType_t ) 2 )

#define tskIDLE_PRIORITY			( ( UBaseType_t ) 0U )
#define pdFALSE			( ( BaseType_t ) 0 )
#define pdTRUE			( ( BaseType_t ) 1 )
#define taskNOT_WAITING_NOTIFICATION	( ( uint8_t ) 0 )


#define tskDEFAULT_INDEX_TO_NOTIFY     ( 0 )

#define configMAX_TASK_NAME_LEN 16
#define configMAX_PRIORITIES 5
#define INCLUDE_vTaskDelete 1
#define INCLUDE_vTaskSuspend 1
#define configUSE_TASK_NOTIFICATIONS 1
#define configUSE_MUTEXES 1
#define configUSE_PREEMPTION 1
#define configUSE_TIME_SLICING 1 
#define configMINIMAL_STACK_SIZE	( ( unsigned short ) 128 )
#define tskSTACK_FILL_BYTE	( 0xa5U )


#define taskNOT_WAITING_NOTIFICATION	( ( uint8_t ) 0 )
#define taskWAITING_NOTIFICATION		( ( uint8_t ) 1 )
#define taskNOTIFICATION_RECEIVED		( ( uint8_t ) 2 )

#define xTaskNotify( xTaskToNotify, ulValue, eAction ) xTaskGenericNotify( ( xTaskToNotify ), ( ulValue ), ( eAction ), NULL )
#define xTaskNotifyGive( xTaskToNotify ) xTaskGenericNotify( ( xTaskToNotify ), ( 0 ), eIncrement, NULL )
#define xTaskNotifyFromISR( xTaskToNotify, ulValue, eAction, pxHigherPriorityTaskWoken ) xTaskGenericNotifyFromISR( ( xTaskToNotify ), ( ulValue ), ( eAction ), NULL, ( pxHigherPriorityTaskWoken ) )
#define xTaskNotifyAndQuery( xTaskToNotify, ulValue, eAction, pulPreviousNotifyValue ) xTaskGenericNotify( ( xTaskToNotify ), ( ulValue ), ( eAction ), ( pulPreviousNotifyValue ) )



#define configTASK_NOTIFICATION_ARRAY_ENTRIES 1
typedef struct xTIME_OUT
{
	BaseType_t xOverflowCount;
	TickType_t xTimeOnEntering;
} TimeOut_t;

typedef struct tskTaskControlBlock
{
    volatile StackType_t *pxTopOfStack;
    ListItem_t xStateListItem;
    ListItem_t xEventListItem;
    UBaseType_t uxPriority;
    StackType_t *pxStack;
    char pcTaskName[16];
    UBaseType_t uxTCBNumber;
    UBaseType_t uxTaskNumber;
    UBaseType_t uxBasePriority;
    UBaseType_t uxMutexesHeld;
    volatile UBaseType_t ulNotifiedValue;
    volatile uint8_t ucNotifyState;
}TCB_t;
typedef struct xMEMORY_REGION
{
    void *pvBaseAddress;
    UBaseType_t ulLengthInBytes;
    UBaseType_t ulParameters;
}MemoryRegion_t;
typedef enum
{
	eNoAction = 0,				
	eSetBits,				
	eIncrement,					
	eSetValueWithOverwrite,		
	eSetValueWithoutOverwrite	
} eNotifyAction;
BaseType_t xTaskCreate( TaskFunction_t pxTaskCode,
                        const char* const pcName,
                        const uint16_t usStackDepth,
                        void * const pvParameters,
                        UBaseType_t uxPriority,
                        TaskHandle_t * const pxCreatedTask);

void vTaskStartScheduler( void );
void vTaskSuspendAll(void);
BaseType_t xTaskResumeAll(void);
void vTaskSwitchContext( void );
BaseType_t xTaskIncrementTick( void );
void vTaskSuspend( TaskHandle_t xTaskToSuspend );
void vTaskDelay( const TickType_t xTicksToDelay );
TickType_t xTaskGetTickCount( void );
void vTaskDelayUntil( TickType_t * const pxPreviousWakeTime, const TickType_t xTimeIncrement );
UBaseType_t uxTaskPriorityGet( TaskHandle_t xTask );
void vTaskPrioritySet( TaskHandle_t xTask, UBaseType_t uxNewPriority );
void vTaskPriorityInherit( TaskHandle_t const pxMutexHolder );

UBaseType_t uxTaskPriorityGetFromISR( TaskHandle_t xTask );
void vTaskDelete(TaskHandle_t xTaskToDelete );
BaseType_t xTaskPriorityDisinherit( TaskHandle_t const pxMutexHolder );
void vTaskSetTimeOutState( TimeOut_t * const pxTimeOut );
BaseType_t xTaskCheckForTimeOut( TimeOut_t * const pxTimeOut, TickType_t * const pxTicksToWait );
void vTaskMissedYield( void );
BaseType_t xTaskRemoveFromEventList( const List_t * const pxEventList );
void vTaskPlaceOnEventList( List_t * const pxEventList, const TickType_t xTicksToWait );
void *pvTaskIncrementMutexHeldCount( void );
TaskHandle_t xTaskGetCurrentTaskHandle( void );
void vTaskPlaceOnEventListRestricted( List_t * const pxEventList, TickType_t xTicksToWait, const BaseType_t xWaitIndefinitely );
BaseType_t xTaskGetSchedulerState( void );
BaseType_t xTaskGenericNotify( TaskHandle_t xTaskToNotify, UBaseType_t ulValue, eNotifyAction eAction, UBaseType_t *pulPreviousNotificationValue );


UBaseType_t ulTaskNotifyTake( BaseType_t xClearCountOnExit, TickType_t xTicksToWait );
void vTaskNotifyGiveFromISR( TaskHandle_t xTaskToNotify, BaseType_t *pxHigherPriorityTaskWoken );
BaseType_t xTaskNotifyWait( uint32_t ulBitsToClearOnEntry, uint32_t ulBitsToClearOnExit, uint32_t *pulNotificationValue, TickType_t xTicksToWait );
BaseType_t xTaskGenericNotifyStateClear( TaskHandle_t xTask);
#endif 