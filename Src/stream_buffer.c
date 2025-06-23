#include "../Inc/stream_buffer.h"

static void prvInitialiseNewStreamBuffer( StreamBuffer_t * const pxStreamBuffer,
                                          uint8_t * const pucBuffer,
                                          size_t xBufferSizeBytes,
                                          size_t xTriggerLevelBytes,
                                          uint8_t ucFlags,
                                          StreamBufferCallbackFunction_t pxSendCompletedCallback,
                                          StreamBufferCallbackFunction_t pxReceiveCompletedCallback )
{
    #define STREAM_BUFFER_BUFFER_WRITE_VALUE    ( 0x55 )
    memset( pucBuffer, ( int ) STREAM_BUFFER_BUFFER_WRITE_VALUE, xBufferSizeBytes );
    ( void ) memset( ( void * ) pxStreamBuffer, 0x00, sizeof( StreamBuffer_t ) );
    pxStreamBuffer->pucBuffer = pucBuffer;
    pxStreamBuffer->xLength = xBufferSizeBytes;
    pxStreamBuffer->xTriggerLevelBytes = xTriggerLevelBytes;
    pxStreamBuffer->ucFlags = ucFlags;
    pxStreamBuffer->uxNotificationIndex = tskDEFAULT_INDEX_TO_NOTIFY;
    #if ( configUSE_SB_COMPLETED_CALLBACK == 1 )
    {
        pxStreamBuffer->pxSendCompletedCallback = pxSendCompletedCallback;
        pxStreamBuffer->pxReceiveCompletedCallback = pxReceiveCompletedCallback;
    }
    #endif
}                                          


StreamBufferHandle_t xStreamBufferGenericCreate( size_t xBufferSizeBytes,
                                                    size_t xTriggerLevelBytes,
                                                    BaseType_t xStreamBufferType,
                                                    StreamBufferCallbackFunction_t pxSendCompletedCallback,
                                                    StreamBufferCallbackFunction_t pxReceiveCompletedCallback )
{
    void * pvAllocatedMemory;
    uint8_t ucFlags;
     if( xStreamBufferType == sbTYPE_MESSAGE_BUFFER )
    {
        ucFlags = sbFLAGS_IS_MESSAGE_BUFFER;
    }
    else if( xStreamBufferType == sbTYPE_STREAM_BATCHING_BUFFER )
    {
        ucFlags = sbFLAGS_IS_BATCHING_BUFFER;
    }
    else
    {
        ucFlags = 0;
    }
    if( xTriggerLevelBytes == ( size_t ) 0 )
    {
        xTriggerLevelBytes = ( size_t ) 1;
    }
    if( xBufferSizeBytes < ( xBufferSizeBytes + 1U + sizeof( StreamBuffer_t ) ) )
    {
        xBufferSizeBytes++;
        pvAllocatedMemory = pvPortMalloc( xBufferSizeBytes + sizeof( StreamBuffer_t ) );
    }
    else
    {
        pvAllocatedMemory = NULL;
    }
    if( pvAllocatedMemory != NULL )
    {
        prvInitialiseNewStreamBuffer( ( StreamBuffer_t * ) pvAllocatedMemory,                         
                                        ( ( uint8_t * ) pvAllocatedMemory ) + sizeof( StreamBuffer_t ), 
                                        xBufferSizeBytes,
                                        xTriggerLevelBytes,
                                        ucFlags,
                                        pxSendCompletedCallback,
                                        pxReceiveCompletedCallback );
    }
    return ( StreamBufferHandle_t ) pvAllocatedMemory;
}

size_t xStreamBufferSpacesAvailable( StreamBufferHandle_t xStreamBuffer )
{
    const StreamBuffer_t * const pxStreamBuffer = xStreamBuffer;
    size_t xSpace;
    size_t xOriginalTail;
    do
    {
        xOriginalTail = pxStreamBuffer->xTail;
        xSpace = pxStreamBuffer->xLength + pxStreamBuffer->xTail;
        xSpace -= pxStreamBuffer->xHead;
    } while( xOriginalTail != pxStreamBuffer->xTail );
    xSpace -= ( size_t ) 1;
    if( xSpace >= pxStreamBuffer->xLength )
    {
        xSpace -= pxStreamBuffer->xLength;
    }
    return xSpace;
}

static size_t prvWriteBytesToBuffer( StreamBuffer_t * const pxStreamBuffer,
                                     const uint8_t * pucData,
                                     size_t xCount,
                                     size_t xHead )
{
    size_t xFirstLength;
    xFirstLength=pxStreamBuffer->xLength - xHead  < xCount ? pxStreamBuffer->xLength - xHead  :  xCount;
    ( void ) memcpy( ( void * ) ( &( pxStreamBuffer->pucBuffer[ xHead ] ) ), ( const void * ) pucData, xFirstLength );
    if( xCount > xFirstLength )
    {
        ( void ) memcpy( ( void * ) pxStreamBuffer->pucBuffer, ( const void * ) &( pucData[ xFirstLength ] ), xCount - xFirstLength );
    }
    xHead += xCount;
    if( xHead >= pxStreamBuffer->xLength )
    {
        xHead -= pxStreamBuffer->xLength;
    }
    return xHead;
}                                     

static size_t prvWriteMessageToBuffer( StreamBuffer_t * const pxStreamBuffer,
                                       const void * pvTxData,
                                       size_t xDataLengthBytes,
                                       size_t xSpace,
                                       size_t xRequiredSpace )
{
    size_t xNextHead = pxStreamBuffer->xHead;
    size_t xMessageLength;
    if( ( pxStreamBuffer->ucFlags & sbFLAGS_IS_MESSAGE_BUFFER ) != ( uint8_t ) 0 )
    {
        xMessageLength = ( size_t ) xDataLengthBytes;
        if( xSpace >= xRequiredSpace )
        {
            xNextHead = prvWriteBytesToBuffer( pxStreamBuffer, ( const uint8_t * ) &( xMessageLength ), sbBYTES_TO_STORE_MESSAGE_LENGTH, xNextHead );
        }
        else
        {
            xDataLengthBytes = 0;
        }
    }
    else
    {
        xDataLengthBytes =   xDataLengthBytes  <  xSpace  ?  xDataLengthBytes  :  xSpace;
    }
    if( xDataLengthBytes != ( size_t ) 0 )
    {
        pxStreamBuffer->xHead = prvWriteBytesToBuffer( pxStreamBuffer, ( const uint8_t * ) pvTxData, xDataLengthBytes, xNextHead );
    }
    return xDataLengthBytes;
}

static size_t prvBytesInBuffer( const StreamBuffer_t * const pxStreamBuffer )
{
    size_t xCount;
    xCount = pxStreamBuffer->xLength + pxStreamBuffer->xHead;
    xCount -= pxStreamBuffer->xTail;
    if( xCount >= pxStreamBuffer->xLength )
    {
        xCount -= pxStreamBuffer->xLength;
    }
    return xCount;
}
#define sbSEND_COMPLETED( pxStreamBuffer )                                  \
    vTaskSuspendAll();                                                              \
    {                                                                               \
        if( ( pxStreamBuffer )->xTaskWaitingToReceive != NULL )                     \
        {                                                                           \
            ( void ) xTaskNotify( ( pxStreamBuffer )->xTaskWaitingToReceive,        \
                                         ( uint32_t ) 0,                            \
                                         eNoAction );                               \
            ( pxStreamBuffer )->xTaskWaitingToReceive = NULL;                       \
        }                                                                           \
    }                                                                               \
    ( void ) xTaskResumeAll()

size_t xStreamBufferSend( StreamBufferHandle_t xStreamBuffer,
                          const void * pvTxData,
                          size_t xDataLengthBytes,
                          TickType_t xTicksToWait )
{
    StreamBuffer_t * const pxStreamBuffer = xStreamBuffer;
    size_t xReturn, xSpace = 0;
    size_t xRequiredSpace = xDataLengthBytes;
    TimeOut_t xTimeOut;
    size_t xMaxReportedSpace = 0;
    xMaxReportedSpace = pxStreamBuffer->xLength - ( size_t ) 1;
    if( ( pxStreamBuffer->ucFlags & sbFLAGS_IS_MESSAGE_BUFFER ) != ( uint8_t ) 0 )
    {
        xRequiredSpace += sbBYTES_TO_STORE_MESSAGE_LENGTH;
        if( xRequiredSpace > xMaxReportedSpace )
        {
            xTicksToWait = ( TickType_t ) 0;
        }
    }
    else
    {
        if( xRequiredSpace > xMaxReportedSpace )
        {
            xRequiredSpace = xMaxReportedSpace;
        }
    }
    if( xTicksToWait != ( TickType_t ) 0 )
    {
        vTaskSetTimeOutState( &xTimeOut );
        do
        {
            taskENTER_CRITICAL();
            {
                xSpace = xStreamBufferSpacesAvailable( pxStreamBuffer );
                if( xSpace < xRequiredSpace )
                {
                    ( void ) xTaskGenericNotifyStateClear(NULL);
                    pxStreamBuffer->xTaskWaitingToSend = xTaskGetCurrentTaskHandle();
                }
                else
                {
                    taskEXIT_CRITICAL();
                    break;
                }
            }
            taskEXIT_CRITICAL();
            ( void ) xTaskNotifyWait(( uint32_t ) 0, ( uint32_t ) 0, (uint32_t*)0, xTicksToWait );
            pxStreamBuffer->xTaskWaitingToSend = NULL;
        } while( xTaskCheckForTimeOut( &xTimeOut, &xTicksToWait ) == pdFALSE );
    }
    if( xSpace == ( size_t ) 0 )
    {
        xSpace = xStreamBufferSpacesAvailable( pxStreamBuffer );
    }
    xReturn = prvWriteMessageToBuffer( pxStreamBuffer, pvTxData, xDataLengthBytes, xSpace, xRequiredSpace );
    if( xReturn > ( size_t ) 0 )
    {
        if( prvBytesInBuffer( pxStreamBuffer ) >= pxStreamBuffer->xTriggerLevelBytes )
        {
            if( ( pxStreamBuffer )->pxSendCompletedCallback != NULL )                             
            {                                                                                     
                ( pxStreamBuffer )->pxSendCompletedCallback( ( pxStreamBuffer ), pdFALSE, 0 ); 
            }                                                                                     
            else                                                                                  
            {                                                                                     
                vTaskSuspendAll();                                                              
                {                                                                               
                    if( ( pxStreamBuffer )->xTaskWaitingToReceive != NULL )                     
                    {                                                                           
                        ( void ) xTaskNotify( ( pxStreamBuffer )->xTaskWaitingToReceive,( uint32_t ) 0,eNoAction );                               
                        ( pxStreamBuffer )->xTaskWaitingToReceive = NULL;                       
                    }                                                                           
                }                                                                               
                ( void ) xTaskResumeAll() ;                                        
            }
        }
    }
    return xReturn;
}
static size_t prvReadBytesFromBuffer( StreamBuffer_t * pxStreamBuffer,
                                      uint8_t * pucData,
                                      size_t xCount,
                                      size_t xTail )
{
    size_t xFirstLength;
    xFirstLength = pxStreamBuffer->xLength-xTail < xCount ? pxStreamBuffer->xLength - xTail : xCount;
    ( void ) memcpy( ( void * ) pucData, ( const void * ) &( pxStreamBuffer->pucBuffer[ xTail ] ), xFirstLength );
    if( xCount > xFirstLength )
    {
        ( void ) memcpy( ( void * ) &( pucData[ xFirstLength ] ), ( const void * ) ( pxStreamBuffer->pucBuffer ), xCount - xFirstLength );
    }
    xTail += xCount;
    if( xTail >= pxStreamBuffer->xLength )
    {
        xTail -= pxStreamBuffer->xLength;
    }
    return xTail;
}
static size_t prvReadMessageFromBuffer( StreamBuffer_t * pxStreamBuffer,
                                        void * pvRxData,
                                        size_t xBufferLengthBytes,
                                        size_t xBytesAvailable )
{
    size_t xCount, xNextMessageLength,xTempNextMessageLength;
    size_t xNextTail = pxStreamBuffer->xTail;
    if( ( pxStreamBuffer->ucFlags & sbFLAGS_IS_MESSAGE_BUFFER ) != ( uint8_t ) 0 )
    {
        xNextTail = prvReadBytesFromBuffer( pxStreamBuffer, ( uint8_t * ) &xTempNextMessageLength, sbBYTES_TO_STORE_MESSAGE_LENGTH, xNextTail );
        xNextMessageLength = ( size_t ) xTempNextMessageLength;
        xBytesAvailable -= sbBYTES_TO_STORE_MESSAGE_LENGTH;
        if( xNextMessageLength > xBufferLengthBytes )
        {
            xNextMessageLength = 0;
        }
    }
    else
    {
        xNextMessageLength = xBufferLengthBytes;
    }
    xCount = xNextMessageLength < xBytesAvailable ? xNextMessageLength : xBytesAvailable;
    if( xCount != ( size_t ) 0 )
    {
        pxStreamBuffer->xTail = prvReadBytesFromBuffer( pxStreamBuffer, ( uint8_t * ) pvRxData, xCount, xNextTail );
    }
    return xCount;
}
size_t xStreamBufferReceive( StreamBufferHandle_t xStreamBuffer,void * pvRxData,size_t xBufferLengthBytes,TickType_t xTicksToWait )
{
    StreamBuffer_t * const pxStreamBuffer = xStreamBuffer;
    size_t xReceivedLength = 0, xBytesAvailable, xBytesToStoreMessageLength;
    if( ( pxStreamBuffer->ucFlags & sbFLAGS_IS_MESSAGE_BUFFER ) != ( uint8_t ) 0 )
    {
        xBytesToStoreMessageLength = sbBYTES_TO_STORE_MESSAGE_LENGTH;
    }
    else if( ( pxStreamBuffer->ucFlags & sbFLAGS_IS_BATCHING_BUFFER ) != ( uint8_t ) 0 )
    {
        xBytesToStoreMessageLength = pxStreamBuffer->xTriggerLevelBytes;
    }
    else
    {
        xBytesToStoreMessageLength = 0;
    }
    if( xTicksToWait != ( TickType_t ) 0 )
    {
        taskENTER_CRITICAL();
        {
            xBytesAvailable = prvBytesInBuffer( pxStreamBuffer );
            if( xBytesAvailable <= xBytesToStoreMessageLength )
            {
                ( void ) xTaskGenericNotifyStateClear( NULL);
                
                pxStreamBuffer->xTaskWaitingToReceive = xTaskGetCurrentTaskHandle();
            }
        }
        taskEXIT_CRITICAL();
        if( xBytesAvailable <= xBytesToStoreMessageLength )
        {
            ( void ) xTaskNotifyWait(( uint32_t ) 0, ( uint32_t ) 0, (uint32_t*)0, xTicksToWait );
            pxStreamBuffer->xTaskWaitingToReceive = NULL;
            xBytesAvailable = prvBytesInBuffer( pxStreamBuffer );
        }
    }
    else
    {
        xBytesAvailable = prvBytesInBuffer( pxStreamBuffer );
    }
    if( xBytesAvailable > xBytesToStoreMessageLength )
    {
        xReceivedLength = prvReadMessageFromBuffer( pxStreamBuffer, pvRxData, xBufferLengthBytes, xBytesAvailable );
        if( xReceivedLength != ( size_t ) 0 )
        {
            
            if( ( pxStreamBuffer )->pxReceiveCompletedCallback != NULL )                             
            {                                                                                     
                ( pxStreamBuffer )->pxReceiveCompletedCallback( ( pxStreamBuffer ), pdFALSE, 0 ); 
            }                                                                                     
            else                                                                                  
            {                                                                                     
                vTaskSuspendAll();                                                              
                {                                                                               
                    if( ( pxStreamBuffer )->xTaskWaitingToReceive != NULL )                     
                    {                                                                           
                        ( void ) xTaskNotify( ( pxStreamBuffer )->xTaskWaitingToReceive,( uint32_t ) 0,eNoAction );                               
                        ( pxStreamBuffer )->xTaskWaitingToReceive = NULL;                       
                    }                                                                           
                }                                                                               
                ( void ) xTaskResumeAll() ;                                        
            }
        }
    }
    return xReceivedLength;
}
void vStreamBufferDelete( StreamBufferHandle_t xStreamBuffer )
{
    StreamBuffer_t * pxStreamBuffer = xStreamBuffer;
    vPortFree( ( void * ) pxStreamBuffer );
}
BaseType_t xStreamBufferReset( StreamBufferHandle_t xStreamBuffer )
{
    StreamBuffer_t * const pxStreamBuffer = xStreamBuffer;
    BaseType_t xReturn = 0;
    StreamBufferCallbackFunction_t pxSendCallback = NULL, pxReceiveCallback = NULL;
    taskENTER_CRITICAL();
    {
        if( ( pxStreamBuffer->xTaskWaitingToReceive == NULL ) && ( pxStreamBuffer->xTaskWaitingToSend == NULL ) )
        {
            if( configUSE_SB_COMPLETED_CALLBACK == 1 )
            {
                pxSendCallback = pxStreamBuffer->pxSendCompletedCallback;
                pxReceiveCallback = pxStreamBuffer->pxReceiveCompletedCallback;
            }
            prvInitialiseNewStreamBuffer( pxStreamBuffer,
                                          pxStreamBuffer->pucBuffer,
                                          pxStreamBuffer->xLength,
                                          pxStreamBuffer->xTriggerLevelBytes,
                                          pxStreamBuffer->ucFlags,
                                          pxSendCallback,
                                          pxReceiveCallback );
            xReturn = 1;
        }
    }
    taskEXIT_CRITICAL();

}