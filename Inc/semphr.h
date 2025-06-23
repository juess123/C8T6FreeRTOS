#ifndef SEMPHR_H
#define SEMPHR_H
#include "../Inc/queue.h"
typedef QueueHandle_t SemaphoreHandle_t;
#define xSemaphoreTake(xMutex,portMAX_DELAY)                   xQueueGenericReceive(xMutex,NULL,portMAX_DELAY,0)
#define xSemaphoreGive(xMutex)				                   xQueueGenericSend(xMutex,NULL,0,queueSEND_TO_BACK)
#define xSemaphoreCreateMutex()                                xQueueCreateMutex(queueQUEUE_TYPE_MUTEX)
#define xSemaphoreCreateBinary()                               xQueueGenericCreate(1, 0, queueQUEUE_TYPE_BINARY_SEMAPHORE )
#define xSemaphoreCreateCounting( uxMaxCount, uxInitialCount ) xQueueCreateCountingSemaphore( ( uxMaxCount ), ( uxInitialCount ) )
#define xSemaphoreCreateRecursiveMutex()                       xQueueCreateMutex( queueQUEUE_TYPE_RECURSIVE_MUTEX )

#define xSemaphoreGiveRecursive( xMutex )	xQueueGiveMutexRecursive( ( xMutex ) )
#define xSemaphoreTakeRecursive( xMutex, xBlockTime )	xQueueTakeMutexRecursive( ( xMutex ), ( xBlockTime ) )
#define vSemaphoreDelete( xSemaphore ) vQueueDelete( ( QueueHandle_t ) ( xSemaphore ) )


#define xSemaphoreGiveFromISR( xSemaphore, pxHigherPriorityTaskWoken )	xQueueGiveFromISR( ( QueueHandle_t ) ( xSemaphore ), ( pxHigherPriorityTaskWoken ) )
#define xSemaphoreTakeFromISR( xSemaphore, pxHigherPriorityTaskWoken )	xQueueReceiveFromISR( ( QueueHandle_t ) ( xSemaphore ), NULL, ( pxHigherPriorityTaskWoken ) )

#endif