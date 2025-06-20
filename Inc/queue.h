#ifndef QUEUE_H
#define QUEUE_H
#include "../Inc/list.h"
#include "../Inc/portmacro.h"
typedef void* QueueHandle_t;
typedef unsigned int UBaseType_t;
typedef signed int BaseType_t;
typedef unsigned int size_t;
typedef signed char int8_t;
typedef unsigned char uint8_t;
#define pdTRUE (BaseType_t)1
#define pdFALSE (BaseType_t)0
#define NULL (void*)0
typedef struct QueueDefinition
{
    int8_t *pcHead;
    int8_t *pcTail;
    int8_t *pcWriteTo;	
    union							
	{
		int8_t *pcReadFrom;			
		UBaseType_t uxRecursiveCallCount;
	} u;
    List_t xTasksWaitingToSend;
	List_t xTasksWaitingToReceive;
    volatile UBaseType_t uxMessagesWaiting;
    UBaseType_t uxLength;
    UBaseType_t uxItemSize;	
    volatile  int8_t cRxLock;
    volatile  int8_t cTxLock;
    UBaseType_t uxQueueNumber;
	int8_t ucQueueType;
}Queue_t;
void *pvPortMalloc(size_t xWantedSize);
#endif