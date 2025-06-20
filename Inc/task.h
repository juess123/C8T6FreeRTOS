#ifndef TASK_H
#define TASK_H
#include <string.h>
#include <stdint.h>
#include "./heap.h"
#include "./list.h"
#include "./portmacro.h"
#include "./freertos.h"

typedef unsigned int StackType_t;
typedef int BaseType_t;
typedef void (*TaskFunction_t)(void*);
typedef void* TaskHandle_t;
#define tskIDLE_PRIORITY			( ( UBaseType_t ) 0U )
#define pdFALSE			( ( BaseType_t ) 0 )
#define pdTRUE			( ( BaseType_t ) 1 )
#define taskENTER_CRITICAL()		portENTER_CRITICAL()
#define taskEXIT_CRITICAL()			portEXIT_CRITICAL()
#define configMAX_TASK_NAME_LEN 16
#define configMAX_PRIORITIES 5
#define INCLUDE_vTaskDelete 1
#define INCLUDE_vTaskSuspend 1

#define configUSE_TASK_NOTIFICATIONS 1

#define configUSE_MUTEXES 1 


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
void Test(void);
void Test1(void);
#endif 