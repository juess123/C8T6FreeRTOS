#ifndef STREAM_BUFFER_H
#define STREAM_BUFFER_H

#include "task.h"
#define configUSE_SB_COMPLETED_CALLBACK 1


typedef unsigned int size_t;



#define configMESSAGE_BUFFER_LENGTH_TYPE           size_t
#define sbBYTES_TO_STORE_MESSAGE_LENGTH    ( sizeof( configMESSAGE_BUFFER_LENGTH_TYPE ) )

#define sbTYPE_STREAM_BUFFER             ( ( BaseType_t ) 0 )
#define sbTYPE_MESSAGE_BUFFER            ( ( BaseType_t ) 1 )
#define sbTYPE_STREAM_BATCHING_BUFFER    ( ( BaseType_t ) 2 )

#define sbFLAGS_IS_MESSAGE_BUFFER          ( ( uint8_t ) 1 )
#define sbFLAGS_IS_STATICALLY_ALLOCATED    ( ( uint8_t ) 2 ) 
#define sbFLAGS_IS_BATCHING_BUFFER         ( ( uint8_t ) 4 )

struct StreamBufferDef_t;

typedef struct StreamBufferDef_t * StreamBufferHandle_t;

typedef void (* StreamBufferCallbackFunction_t)( StreamBufferHandle_t xStreamBuffer,
                                                 BaseType_t xIsInsideISR,
                                                 BaseType_t * const pxHigherPriorityTaskWoken );

typedef struct StreamBufferDef_t
{
    volatile size_t xTail;                       
    volatile size_t xHead;                       
    size_t xLength;                              
    size_t xTriggerLevelBytes;                   
    volatile TaskHandle_t xTaskWaitingToReceive; 
    volatile TaskHandle_t xTaskWaitingToSend;    
    uint8_t * pucBuffer;                         
    uint8_t ucFlags;
    #if ( configUSE_SB_COMPLETED_CALLBACK == 1 )
        StreamBufferCallbackFunction_t pxSendCompletedCallback;    
        StreamBufferCallbackFunction_t pxReceiveCompletedCallback; 
    #endif
    UBaseType_t uxNotificationIndex;                               
} StreamBuffer_t;


size_t xStreamBufferSend( StreamBufferHandle_t xStreamBuffer,const void * pvTxData,size_t xDataLengthBytes,TickType_t xTicksToWait );
size_t xStreamBufferReceive( StreamBufferHandle_t xStreamBuffer,void * pvRxData,size_t xBufferLengthBytes,TickType_t xTicksToWait );
StreamBufferHandle_t xStreamBufferGenericCreate( size_t xBufferSizeBytes,
                                                    size_t xTriggerLevelBytes,
                                                    BaseType_t xStreamBufferType,
                                                    StreamBufferCallbackFunction_t pxSendCompletedCallback,
                                                    StreamBufferCallbackFunction_t pxReceiveCompletedCallback );
void vStreamBufferDelete( StreamBufferHandle_t xStreamBuffer );
BaseType_t xStreamBufferReset( StreamBufferHandle_t xStreamBuffer );
#endif