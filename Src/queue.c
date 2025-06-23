#include "../Inc/queue.h"



BaseType_t xQueueGenericReset( QueueHandle_t xQueue, BaseType_t xNewQueue )
{
    Queue_t * const pxQueue = ( Queue_t * ) xQueue;
    taskENTER_CRITICAL();
    {
        pxQueue->pcTail = pxQueue->pcHead + ( pxQueue->uxLength * pxQueue->uxItemSize );
		pxQueue->uxMessagesWaiting = ( UBaseType_t ) 0U;
		pxQueue->pcWriteTo = pxQueue->pcHead;
		pxQueue->u.pcReadFrom = pxQueue->pcHead + ( ( pxQueue->uxLength - ( UBaseType_t ) 1U ) * pxQueue->uxItemSize );
		pxQueue->cRxLock = queueUNLOCKED;
		pxQueue->cTxLock = queueUNLOCKED;
        if( xNewQueue == pdFALSE )
        {
            if( listLIST_IS_EMPTY( &( pxQueue->xTasksWaitingToSend ) ) == pdFALSE )
            {
                if( xTaskRemoveFromEventList( &( pxQueue->xTasksWaitingToSend ) ) != pdFALSE )
				{
					taskYIELD();
				}
            }
        }
        else
        {
            vListInitialise( &( pxQueue->xTasksWaitingToSend ) );
			vListInitialise( &( pxQueue->xTasksWaitingToReceive ) );
        }
    }
    taskEXIT_CRITICAL();
    return pdTRUE;
}
static void prvInitialiseNewQueue( const UBaseType_t uxQueueLength, const UBaseType_t uxItemSize, uint8_t *pucQueueStorage, const uint8_t ucQueueType, Queue_t *pxNewQueue )
{
    ( void ) ucQueueType;
    if( uxItemSize == ( UBaseType_t ) 0 )
    {
        pxNewQueue->pcHead = ( int8_t * ) pxNewQueue;
    }
    else
    {
        pxNewQueue->pcHead = ( int8_t * ) pucQueueStorage;
    }
    pxNewQueue->uxLength = uxQueueLength;
	pxNewQueue->uxItemSize = uxItemSize;
	( void ) xQueueGenericReset( pxNewQueue, pdTRUE );
    pxNewQueue->ucQueueType = ucQueueType;
}
QueueHandle_t xQueueGenericCreate( const UBaseType_t uxQueueLength, const UBaseType_t uxItemSize, const uint8_t ucQueueType )
{
    Queue_t *pxNewQueue;
    UBaseType_t xQueueSizeInBytes;
    uint8_t *pucQueueStorage;
    if( uxItemSize == ( UBaseType_t ) 0 )
    {
        xQueueSizeInBytes = ( UBaseType_t ) 0;
    }
    else
    {
        xQueueSizeInBytes = ( UBaseType_t ) ( uxQueueLength * uxItemSize ); 
    }
    pxNewQueue = ( Queue_t * ) pvPortMalloc( sizeof( Queue_t ) + xQueueSizeInBytes );
    if( pxNewQueue != NULL )
    {
        pucQueueStorage = ( ( uint8_t * ) pxNewQueue ) + sizeof( Queue_t );
        prvInitialiseNewQueue( uxQueueLength, uxItemSize, pucQueueStorage, ucQueueType, pxNewQueue );
    }
    return pxNewQueue;
}




static BaseType_t prvCopyDataToQueue( Queue_t * const pxQueue, const void *pvItemToQueue, const BaseType_t xPosition )
{
    BaseType_t xReturn = pdFALSE;
    UBaseType_t uxMessagesWaiting;
    uxMessagesWaiting = pxQueue->uxMessagesWaiting;
    if( pxQueue->uxItemSize == ( UBaseType_t ) 0 )
    {
        if( pxQueue->uxQueueType == queueQUEUE_IS_MUTEX )
        {
            xReturn = xTaskPriorityDisinherit( ( void * ) pxQueue->pxMutexHolder );
            pxQueue->pxMutexHolder = NULL;
        }
    }
    else if(xPosition == queueSEND_TO_BACK)
    {
        ( void ) memcpy( ( void * ) pxQueue->pcWriteTo, pvItemToQueue, ( unsigned int ) pxQueue->uxItemSize ); 
		pxQueue->pcWriteTo += pxQueue->uxItemSize;
		if( pxQueue->pcWriteTo >= pxQueue->pcTail ) 
		{
			pxQueue->pcWriteTo = pxQueue->pcHead;
		}
    }
    else
    {
        ( void ) memcpy( ( void * ) pxQueue->u.pcReadFrom, pvItemToQueue, ( unsigned int  ) pxQueue->uxItemSize ); 
		pxQueue->u.pcReadFrom -= pxQueue->uxItemSize;
		if( pxQueue->u.pcReadFrom < pxQueue->pcHead ) 
		{
			pxQueue->u.pcReadFrom = ( pxQueue->pcTail - pxQueue->uxItemSize );
		}
        if( xPosition == queueOVERWRITE )
        {
            if( uxMessagesWaiting > ( UBaseType_t ) 0 )
			{
				--uxMessagesWaiting;
			}
        }
        else
        {

        }
    }
    pxQueue->uxMessagesWaiting = uxMessagesWaiting + 1;
	return xReturn;
}



static BaseType_t prvIsQueueFull( const Queue_t *pxQueue )
{
BaseType_t xReturn;

	taskENTER_CRITICAL();
	{
		if( pxQueue->uxMessagesWaiting == pxQueue->uxLength )
		{
			xReturn = pdTRUE;
		}
		else
		{
			xReturn = pdFALSE;
		}
	}
	taskEXIT_CRITICAL();

	return xReturn;
}

static void prvUnlockQueue( Queue_t * const pxQueue )
{
    taskENTER_CRITICAL();
    {
        int8_t cTxLock = pxQueue->cTxLock;
        while( cTxLock > queueLOCKED_UNMODIFIED )
        {
            if(configUSE_QUEUE_SETS==1)
            {

            }
            else
            {
                if( listLIST_IS_EMPTY( &( pxQueue->xTasksWaitingToReceive ) ) == pdFALSE )
				{
					if( xTaskRemoveFromEventList( &( pxQueue->xTasksWaitingToReceive ) ) != pdFALSE )
					{
						vTaskMissedYield();
					} 
				}
				else
				{
					break;
				}
            }
            --cTxLock;
        }
        pxQueue->cTxLock = queueUNLOCKED;
    }
    taskEXIT_CRITICAL();

    taskENTER_CRITICAL();
    {
        int8_t cRxLock = pxQueue->cRxLock;
		while( cRxLock > queueLOCKED_UNMODIFIED )
		{
			if( listLIST_IS_EMPTY( &( pxQueue->xTasksWaitingToSend ) ) == pdFALSE )
			{
				if( xTaskRemoveFromEventList( &( pxQueue->xTasksWaitingToSend ) ) != pdFALSE )
				{
					vTaskMissedYield();
				}
				else
				{
					mtCOVERAGE_TEST_MARKER();
				}

				--cRxLock;
			}
			else
			{
				break;
			}
		}
		pxQueue->cRxLock = queueUNLOCKED;
    }
    taskEXIT_CRITICAL();
}
#define prvLockQueue( pxQueue )								\
	taskENTER_CRITICAL();									\
	{														\
		if( ( pxQueue )->cRxLock == queueUNLOCKED )			\
		{													\
			( pxQueue )->cRxLock = queueLOCKED_UNMODIFIED;	\
		}													\
		if( ( pxQueue )->cTxLock == queueUNLOCKED )			\
		{													\
			( pxQueue )->cTxLock = queueLOCKED_UNMODIFIED;	\
		}													\
	}														\
	taskEXIT_CRITICAL()


BaseType_t xQueueGenericSend( QueueHandle_t xQueue, const void * const pvItemToQueue, TickType_t xTicksToWait, const BaseType_t xCopyPosition )
{
    BaseType_t xEntryTimeSet = pdFALSE, xYieldRequired;
    TimeOut_t xTimeOut;
    Queue_t * const pxQueue = ( Queue_t * ) xQueue;
    for( ;; )
    {
        taskENTER_CRITICAL();
        {
            if( ( pxQueue->uxMessagesWaiting < pxQueue->uxLength ) || ( xCopyPosition == queueOVERWRITE ) )
            {
                xYieldRequired = prvCopyDataToQueue( pxQueue, pvItemToQueue, xCopyPosition );
                if(configUSE_QUEUE_SETS==1)
                {

                }
                else
                {
                    if( listLIST_IS_EMPTY( &( pxQueue->xTasksWaitingToReceive ) ) == pdFALSE )
                    {
                        if( xTaskRemoveFromEventList( &( pxQueue->xTasksWaitingToReceive ) ) != pdFALSE )
						{
							
							taskYIELD();
						}
                       
                        
                    }
                    else if(xYieldRequired != pdFALSE)
                    {
                        taskYIELD();
                    }
                    
                }
                taskEXIT_CRITICAL();
			    return pdTRUE;
            }
            else
            {
                if( xTicksToWait == ( TickType_t ) 0 )
                {
                    taskEXIT_CRITICAL();
                    return pdFALSE;
                }
                else if( xEntryTimeSet == pdFALSE )
                {
                    vTaskSetTimeOutState( &xTimeOut );
					xEntryTimeSet = pdTRUE;
                }
                else
                {

                }
            }
           
        }
        taskEXIT_CRITICAL();
        vTaskSuspendAll();
        prvLockQueue( pxQueue );
        if( xTaskCheckForTimeOut( &xTimeOut, &xTicksToWait ) == pdFALSE )
        {
            if( prvIsQueueFull( pxQueue ) != pdFALSE )
            {
                vTaskPlaceOnEventList( &( pxQueue->xTasksWaitingToSend ), xTicksToWait );
                prvUnlockQueue( pxQueue );
                if( xTaskResumeAll() == pdFALSE )
				{
					taskYIELD();
				}
            }
            else
            {
                prvUnlockQueue( pxQueue );
				( void ) xTaskResumeAll();
            }
        }
        else
        {
            prvUnlockQueue( pxQueue );
			( void ) xTaskResumeAll();
			return pdFALSE;
        }
    }
}

static void prvCopyDataFromQueue( Queue_t * const pxQueue, void * const pvBuffer )
{
	if( pxQueue->uxItemSize != ( UBaseType_t ) 0 )
	{
		pxQueue->u.pcReadFrom += pxQueue->uxItemSize;
		if( pxQueue->u.pcReadFrom >= pxQueue->pcTail ) 
		{
			pxQueue->u.pcReadFrom = pxQueue->pcHead;
		}
		( void ) memcpy( ( void * ) pvBuffer, ( void * ) pxQueue->u.pcReadFrom, ( unsigned int ) pxQueue->uxItemSize ); 
	}
}

static BaseType_t prvIsQueueEmpty( const Queue_t *pxQueue )
{
BaseType_t xReturn;

	taskENTER_CRITICAL();
	{
		if( pxQueue->uxMessagesWaiting == ( UBaseType_t )  0 )
		{
			xReturn = pdTRUE;
		}
		else
		{
			xReturn = pdFALSE;
		}
	}
	taskEXIT_CRITICAL();

	return xReturn;
}

BaseType_t xQueueGenericReceive( QueueHandle_t xQueue, void * const pvBuffer, TickType_t xTicksToWait, const BaseType_t xJustPeeking )
{
    BaseType_t xEntryTimeSet = pdFALSE;
    TimeOut_t xTimeOut;
    int8_t *pcOriginalReadPosition;
    Queue_t * const pxQueue = ( Queue_t * ) xQueue;
    for(;;)
    {
        taskENTER_CRITICAL();
        {
            const UBaseType_t uxMessagesWaiting = pxQueue->uxMessagesWaiting;
            if( uxMessagesWaiting > ( UBaseType_t ) 0 )
            {
                pcOriginalReadPosition = pxQueue->u.pcReadFrom;
                prvCopyDataFromQueue( pxQueue, pvBuffer );
                if( xJustPeeking == pdFALSE )
                {
                    pxQueue->uxMessagesWaiting = uxMessagesWaiting - 1;
                    if( pxQueue->uxQueueType == queueQUEUE_IS_MUTEX )
                    {
                        pxQueue->pxMutexHolder = ( int8_t * ) pvTaskIncrementMutexHeldCount(); 
                    }
                    if( listLIST_IS_EMPTY( &( pxQueue->xTasksWaitingToSend ) ) == pdFALSE )
					{
						if( xTaskRemoveFromEventList( &( pxQueue->xTasksWaitingToSend ) ) != pdFALSE )
						{
							taskYIELD();
						}
					}
                }
                else
                {
                    pxQueue->u.pcReadFrom = pcOriginalReadPosition;
                    if( listLIST_IS_EMPTY( &( pxQueue->xTasksWaitingToReceive ) ) == pdFALSE )
					{
						if( xTaskRemoveFromEventList( &( pxQueue->xTasksWaitingToReceive ) ) != pdFALSE )
						{
							taskYIELD();
						}
					}
                }
                taskEXIT_CRITICAL();
				return pdTRUE;
            }
            else
            {
                if( xTicksToWait == ( TickType_t ) 0 )
				{
					taskEXIT_CRITICAL();
					return 0;
				}
                else if(xEntryTimeSet == pdFALSE)
                {
                    vTaskSetTimeOutState( &xTimeOut );
					xEntryTimeSet = pdTRUE;
                }
                else
                {

                }
            }
        }
        taskEXIT_CRITICAL();
        vTaskSuspendAll();
        prvLockQueue( pxQueue );
        if( xTaskCheckForTimeOut( &xTimeOut, &xTicksToWait ) == pdFALSE )
		{
			if( prvIsQueueEmpty( pxQueue ) != pdFALSE )
			{
				

				if( pxQueue->uxQueueType == queueQUEUE_IS_MUTEX )
                {
                    taskENTER_CRITICAL();
                    {
                        vTaskPriorityInherit( ( void * ) pxQueue->pxMutexHolder );
                    }
                    taskEXIT_CRITICAL();
                }

				vTaskPlaceOnEventList( &( pxQueue->xTasksWaitingToReceive ), xTicksToWait );
				prvUnlockQueue( pxQueue );
				if( xTaskResumeAll() == pdFALSE )
				{
					taskYIELD();
				}
			}
			else
			{
				
				prvUnlockQueue( pxQueue );
				( void ) xTaskResumeAll();
			}
		}
		else
		{
			prvUnlockQueue( pxQueue );
			( void ) xTaskResumeAll();

			if( prvIsQueueEmpty( pxQueue ) != pdFALSE )
			{
				
				return 0;
			}
		}
    }
}
static void prvInitialiseMutex( Queue_t *pxNewQueue )
{
    if( pxNewQueue != NULL )
    {
        
        pxNewQueue->pxMutexHolder = NULL;
        pxNewQueue->uxQueueType = queueQUEUE_IS_MUTEX;

        pxNewQueue->u.uxRecursiveCallCount = 0;


        ( void ) xQueueGenericSend( pxNewQueue, NULL, ( TickType_t ) 0U, queueSEND_TO_BACK );
    }
    
}

QueueHandle_t xQueueCreateMutex( const uint8_t ucQueueType )
{
    Queue_t *pxNewQueue;
    const UBaseType_t uxMutexLength = ( UBaseType_t ) 1, uxMutexSize = ( UBaseType_t ) 0;

    pxNewQueue = ( Queue_t * ) xQueueGenericCreate( uxMutexLength, uxMutexSize, ucQueueType );
    prvInitialiseMutex( pxNewQueue );

    return pxNewQueue;
}   
QueueHandle_t xQueueCreateCountingSemaphore( const UBaseType_t uxMaxCount, const UBaseType_t uxInitialCount )
{
    QueueHandle_t xHandle;


    xHandle = xQueueGenericCreate( uxMaxCount, queueSEMAPHORE_QUEUE_ITEM_LENGTH, queueQUEUE_TYPE_COUNTING_SEMAPHORE );

    if( xHandle != NULL )
    {
        ( ( Queue_t * ) xHandle )->uxMessagesWaiting = uxInitialCount;
        
    }
    return xHandle;
}

BaseType_t xQueueTakeMutexRecursive( QueueHandle_t xMutex, TickType_t xTicksToWait )
{
	BaseType_t xReturn;
	Queue_t * const pxMutex = ( Queue_t * ) xMutex;
    if( pxMutex->pxMutexHolder == ( void * ) xTaskGetCurrentTaskHandle() )
    {
        ( pxMutex->u.uxRecursiveCallCount )++;
        xReturn = pdTRUE;
    }
    else
    {
        xReturn = xQueueGenericReceive( pxMutex, NULL, xTicksToWait, pdFALSE );
        if( xReturn != pdFALSE )
        {
            ( pxMutex->u.uxRecursiveCallCount )++;
        }
    }
	return xReturn;
}
BaseType_t xQueueGiveMutexRecursive( QueueHandle_t xMutex )
{
    BaseType_t xReturn;
    Queue_t * const pxMutex = ( Queue_t * ) xMutex;
    if( pxMutex->pxMutexHolder == ( void * ) xTaskGetCurrentTaskHandle() ) 
    {
        ( pxMutex->u.uxRecursiveCallCount )--;

        if( pxMutex->u.uxRecursiveCallCount == ( UBaseType_t ) 0 )
        {
            ( void ) xQueueGenericSend( pxMutex, NULL, queueMUTEX_GIVE_BLOCK_TIME, queueSEND_TO_BACK );
        }
        xReturn = pdTRUE;
    }
    else
    {
        xReturn = pdFALSE;
    }
    return xReturn;
}
void vQueueDelete( QueueHandle_t xQueue )
{
    Queue_t * const pxQueue = ( Queue_t * ) xQueue;
	vPortFree( pxQueue );
}
BaseType_t xQueueReceiveFromISR( QueueHandle_t xQueue, void * const pvBuffer, BaseType_t * const pxHigherPriorityTaskWoken )
{
    BaseType_t xReturn;
    UBaseType_t uxSavedInterruptStatus;
    Queue_t * const pxQueue = ( Queue_t * ) xQueue;
    uxSavedInterruptStatus = portSET_INTERRUPT_MASK_FROM_ISR();
    {
        const UBaseType_t uxMessagesWaiting = pxQueue->uxMessagesWaiting;
        if(uxMessagesWaiting > ( UBaseType_t ) 0)
        {
            const int8_t cRxLock = pxQueue->cRxLock;
            prvCopyDataFromQueue( pxQueue, pvBuffer );
			pxQueue->uxMessagesWaiting = uxMessagesWaiting - 1;
            if( cRxLock == queueUNLOCKED )
			{
				if( listLIST_IS_EMPTY( &( pxQueue->xTasksWaitingToSend ) ) == pdFALSE )
				{
					if( xTaskRemoveFromEventList( &( pxQueue->xTasksWaitingToSend ) ) != pdFALSE )
					{
						if( pxHigherPriorityTaskWoken != NULL )
						{
							*pxHigherPriorityTaskWoken = pdTRUE;
						}	
					}
				}
            }
            else
            {
                pxQueue->cRxLock = ( int8_t ) ( cRxLock + 1 );
            }
            xReturn = 1;
        }
        else
        {
            xReturn = 0;
        }
    }
    portCLEAR_INTERRUPT_MASK_FROM_ISR( uxSavedInterruptStatus );
	return xReturn;
}
BaseType_t xQueueGiveFromISR( QueueHandle_t xQueue, BaseType_t * const pxHigherPriorityTaskWoken )
{
    BaseType_t xReturn;
    UBaseType_t uxSavedInterruptStatus;
    Queue_t * const pxQueue = ( Queue_t * ) xQueue;
    uxSavedInterruptStatus = portSET_INTERRUPT_MASK_FROM_ISR();
    {
        const UBaseType_t uxMessagesWaiting = pxQueue->uxMessagesWaiting;
        if( uxMessagesWaiting < pxQueue->uxLength )
        {
            const int8_t cTxLock = pxQueue->cTxLock;
            pxQueue->uxMessagesWaiting = uxMessagesWaiting + 1;
            if( cTxLock == queueUNLOCKED )
            {
                if( listLIST_IS_EMPTY( &( pxQueue->xTasksWaitingToReceive ) ) == pdFALSE )
                {
                    if( xTaskRemoveFromEventList( &( pxQueue->xTasksWaitingToReceive ) ) != pdFALSE )
                    {
                        if( pxHigherPriorityTaskWoken != NULL )
                        {
                            *pxHigherPriorityTaskWoken = pdTRUE;
                        }
                    }
                }
            }
            else
            {
                pxQueue->cTxLock = ( int8_t ) ( cTxLock + 1 );
            }
            xReturn = 1;
        }
        else
        {
            xReturn = 0;
        }
    }
    portCLEAR_INTERRUPT_MASK_FROM_ISR( uxSavedInterruptStatus );
	return xReturn;
}
BaseType_t xQueueGenericSendFromISR( QueueHandle_t xQueue, const void * const pvItemToQueue, BaseType_t * const pxHigherPriorityTaskWoken, const BaseType_t xCopyPosition )
{
    BaseType_t xReturn;
    UBaseType_t uxSavedInterruptStatus;
    Queue_t * const pxQueue = ( Queue_t * ) xQueue;
    uxSavedInterruptStatus = portSET_INTERRUPT_MASK_FROM_ISR();
    {
        if( ( pxQueue->uxMessagesWaiting < pxQueue->uxLength ) || ( xCopyPosition == queueOVERWRITE ) )
        {
            const int8_t cTxLock = pxQueue->cTxLock;
            ( void ) prvCopyDataToQueue( pxQueue, pvItemToQueue, xCopyPosition );
            if( cTxLock == queueUNLOCKED )
            {
                if ( configUSE_QUEUE_SETS == 1 )
                {

                }
                else
                {
                    if( listLIST_IS_EMPTY( &( pxQueue->xTasksWaitingToReceive ) ) == pdFALSE )
                    {
                        if( xTaskRemoveFromEventList( &( pxQueue->xTasksWaitingToReceive ) ) != pdFALSE )
						{
							if( pxHigherPriorityTaskWoken != NULL )
							{
								*pxHigherPriorityTaskWoken = pdTRUE;
							}
						}
						
                    }
                }
            }
            else
            {
                pxQueue->cTxLock = ( int8_t ) ( cTxLock + 1 );
            }
            xReturn = 1;
        }
        else
        {
            xReturn = 0;
        }
    }
    portCLEAR_INTERRUPT_MASK_FROM_ISR( uxSavedInterruptStatus );
    return xReturn;
}
void vQueueWaitForMessageRestricted( QueueHandle_t xQueue, TickType_t xTicksToWait, const BaseType_t xWaitIndefinitely )
{
    Queue_t * const pxQueue = ( Queue_t * ) xQueue;
    prvLockQueue( pxQueue );
    if( pxQueue->uxMessagesWaiting == ( UBaseType_t ) 0U )
    {
        vTaskPlaceOnEventListRestricted( &( pxQueue->xTasksWaitingToReceive ), xTicksToWait, xWaitIndefinitely );
    }
    prvUnlockQueue( pxQueue );
}