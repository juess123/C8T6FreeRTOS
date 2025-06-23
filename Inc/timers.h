#ifndef TIMERS_H
#define TIMERS_H
#include "../Inc/task.h"
#include "../Inc/queue.h"
typedef void* TimerHandle_t;

typedef void (*TimerCallbackFunction_t)( TimerHandle_t xTimer );



#define tmrCOMMAND_EXECUTE_CALLBACK_FROM_ISR 	( ( BaseType_t ) -2 )
#define tmrCOMMAND_EXECUTE_CALLBACK				( ( BaseType_t ) -1 )
#define tmrCOMMAND_START_DONT_TRACE				( ( BaseType_t ) 0 )
#define tmrCOMMAND_START					    ( ( BaseType_t ) 1 )
#define tmrCOMMAND_RESET						( ( BaseType_t ) 2 )
#define tmrCOMMAND_STOP							( ( BaseType_t ) 3 )
#define tmrCOMMAND_CHANGE_PERIOD				( ( BaseType_t ) 4 )
#define tmrCOMMAND_DELETE						( ( BaseType_t ) 5 )

#define tmrFIRST_FROM_ISR_COMMAND				( ( BaseType_t ) 6 )
#define tmrCOMMAND_START_FROM_ISR				( ( BaseType_t ) 6 )
#define tmrCOMMAND_RESET_FROM_ISR				( ( BaseType_t ) 7 )
#define tmrCOMMAND_STOP_FROM_ISR				( ( BaseType_t ) 8 )
#define tmrCOMMAND_CHANGE_PERIOD_FROM_ISR		( ( BaseType_t ) 9 )

#define tmrNO_DELAY		( TickType_t ) 0U
#define configTIMER_QUEUE_LENGTH 		10
#define configTIMER_TASK_PRIORITY 		5

#define xTimerStart( xTimer, xTicksToWait ) xTimerGenericCommand( ( xTimer ), tmrCOMMAND_START, ( xTaskGetTickCount() ), NULL, ( xTicksToWait ) )

typedef struct tmrTimerControl
{
	const char				*pcTimerName;		
	ListItem_t				xTimerListItem;	
	TickType_t				xTimerPeriodInTicks;
	UBaseType_t				uxAutoReload;		
	void 					*pvTimerID;			
	TimerCallbackFunction_t	pxCallbackFunction;	
} Timer_t;
typedef struct tmrTimerParameters
{
	TickType_t			xMessageValue;		
	Timer_t *			pxTimer;			
} TimerParameter_t;
typedef struct tmrTimerQueueMessage
{
	BaseType_t			xMessageID;			
	union
	{
		TimerParameter_t xTimerParameters;
	} u;
} DaemonTaskMessage_t;      

TimerHandle_t xTimerCreate(	const char * const pcTimerName,
								const TickType_t xTimerPeriodInTicks,
								const UBaseType_t uxAutoReload,
								void * const pvTimerID,
								TimerCallbackFunction_t pxCallbackFunction );

BaseType_t xTimerGenericCommand( TimerHandle_t xTimer, const BaseType_t xCommandID, const TickType_t xOptionalValue, BaseType_t * const pxHigherPriorityTaskWoken, const TickType_t xTicksToWait );
BaseType_t xTimerCreateTimerTask( void );

#define xTimerStop( xTimer, xTicksToWait ) xTimerGenericCommand( ( xTimer ), tmrCOMMAND_STOP, 0U, NULL, ( xTicksToWait ) )
#define xTimerChangePeriod( xTimer, xNewPeriod, xTicksToWait ) xTimerGenericCommand( ( xTimer ), tmrCOMMAND_CHANGE_PERIOD, ( xNewPeriod ), NULL, ( xTicksToWait ) )
#endif                            