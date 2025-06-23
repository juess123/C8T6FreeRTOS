#include "../Inc/timers.h"
typedef void* QueueHandle_t;

static List_t xActiveTimerList1;
static List_t xActiveTimerList2;
static List_t *pxCurrentTimerList;
static List_t *pxOverflowTimerList;

static QueueHandle_t xTimerQueue = NULL;
static TaskHandle_t xTimerTaskHandle = NULL;
static void prvCheckForValidListAndQueue( void )
{
	taskENTER_CRITICAL();
	{
		if( xTimerQueue == NULL )
		{
			vListInitialise( &xActiveTimerList1 );
			vListInitialise( &xActiveTimerList2 );
			pxCurrentTimerList = &xActiveTimerList1;
			pxOverflowTimerList = &xActiveTimerList2;
			xTimerQueue = xQueueCreate( ( UBaseType_t ) configTIMER_QUEUE_LENGTH, sizeof( DaemonTaskMessage_t ) );
		}
	}
	taskEXIT_CRITICAL();
}
static void prvInitialiseNewTimer(	const char * const pcTimerName,
									const TickType_t xTimerPeriodInTicks,
									const UBaseType_t uxAutoReload,
									void * const pvTimerID,
									TimerCallbackFunction_t pxCallbackFunction,
									Timer_t *pxNewTimer ) 
{	
	if( pxNewTimer != NULL )
	{
		prvCheckForValidListAndQueue();
		pxNewTimer->pcTimerName = pcTimerName;
		pxNewTimer->xTimerPeriodInTicks = xTimerPeriodInTicks;
		pxNewTimer->uxAutoReload = uxAutoReload;
		pxNewTimer->pvTimerID = pvTimerID;
		pxNewTimer->pxCallbackFunction = pxCallbackFunction;
		vListInitialiseItem( &( pxNewTimer->xTimerListItem ) );
	}
}

TimerHandle_t xTimerCreate(	const char * const pcTimerName,
								const TickType_t xTimerPeriodInTicks,
								const UBaseType_t uxAutoReload,
								void * const pvTimerID,
								TimerCallbackFunction_t pxCallbackFunction )
{
    Timer_t *pxNewTimer;
    pxNewTimer = ( Timer_t * ) pvPortMalloc( sizeof( Timer_t ) );
    if( pxNewTimer != NULL )
    {
        prvInitialiseNewTimer( pcTimerName, xTimerPeriodInTicks, uxAutoReload, pvTimerID, pxCallbackFunction, pxNewTimer );
    }
    return pxNewTimer;
}
                          
BaseType_t xTimerGenericCommand( TimerHandle_t xTimer, const BaseType_t xCommandID, const TickType_t xOptionalValue, BaseType_t * const pxHigherPriorityTaskWoken, const TickType_t xTicksToWait )
{
    BaseType_t xReturn = pdFALSE;
    DaemonTaskMessage_t xMessage;
	if( xTimerQueue != NULL )
	{
		xMessage.xMessageID = xCommandID;
		xMessage.u.xTimerParameters.xMessageValue = xOptionalValue;
		xMessage.u.xTimerParameters.pxTimer = ( Timer_t * ) xTimer;
		if( xCommandID < tmrFIRST_FROM_ISR_COMMAND )
		{
			if( xTaskGetSchedulerState() == taskSCHEDULER_RUNNING )
			{
				xReturn = xQueueSendToBack( xTimerQueue, &xMessage, xTicksToWait );
			}
			else
			{
				xReturn = xQueueSendToBack( xTimerQueue, &xMessage, tmrNO_DELAY );
			}
		}
		else
		{
			xReturn = xQueueSendToBackFromISR( xTimerQueue, &xMessage, pxHigherPriorityTaskWoken );
		}
	}
	return xReturn;
}
static TickType_t prvGetNextExpireTime( BaseType_t * const pxListWasEmpty )
{
	TickType_t xNextExpireTime;
	*pxListWasEmpty = listLIST_IS_EMPTY( pxCurrentTimerList );
	if( *pxListWasEmpty == pdFALSE )
	{
		xNextExpireTime = listGET_ITEM_VALUE_OF_HEAD_ENTRY( pxCurrentTimerList );
	}
	else
	{
		xNextExpireTime = ( TickType_t ) 0U;
	}
	return xNextExpireTime;
}
static void prvSwitchTimerLists( void )
{
	TickType_t xNextExpireTime, xReloadTime;
	List_t *pxTemp;
	Timer_t *pxTimer;
	BaseType_t xResult;
	while( listLIST_IS_EMPTY( pxCurrentTimerList ) == pdFALSE )
	{
		xNextExpireTime = listGET_ITEM_VALUE_OF_HEAD_ENTRY( pxCurrentTimerList );
		pxTimer = ( Timer_t * ) listGET_OWNER_OF_HEAD_ENTRY( pxCurrentTimerList );
		( void ) uxListRemove( &( pxTimer->xTimerListItem ) );
		pxTimer->pxCallbackFunction( ( TimerHandle_t ) pxTimer );

		if( pxTimer->uxAutoReload == ( UBaseType_t ) pdTRUE )
		{
			xReloadTime = ( xNextExpireTime + pxTimer->xTimerPeriodInTicks );
			if( xReloadTime > xNextExpireTime )
			{
				listSET_LIST_ITEM_VALUE( &( pxTimer->xTimerListItem ), xReloadTime );
				listSET_LIST_ITEM_OWNER( &( pxTimer->xTimerListItem ), pxTimer );
				vListInsert( pxCurrentTimerList, &( pxTimer->xTimerListItem ) );
			}
			else
			{
				xResult = xTimerGenericCommand( pxTimer, tmrCOMMAND_START_DONT_TRACE, xNextExpireTime, NULL, tmrNO_DELAY );
				( void ) xResult;
			}
		}
	}
	pxTemp = pxCurrentTimerList;
	pxCurrentTimerList = pxOverflowTimerList;
	pxOverflowTimerList = pxTemp;
}
static TickType_t prvSampleTimeNow( BaseType_t * const pxTimerListsWereSwitched )
{
	TickType_t xTimeNow;
	static TickType_t xLastTime = ( TickType_t ) 0U; 

	xTimeNow = xTaskGetTickCount();

	if( xTimeNow < xLastTime )
	{
		prvSwitchTimerLists();
		*pxTimerListsWereSwitched = pdTRUE;
	}
	else
	{
		*pxTimerListsWereSwitched = pdFALSE;
	}

	xLastTime = xTimeNow;

	return xTimeNow;
}
static BaseType_t prvInsertTimerInActiveList( Timer_t * const pxTimer, const TickType_t xNextExpiryTime, const TickType_t xTimeNow, const TickType_t xCommandTime )
{
	BaseType_t xProcessTimerNow = pdFALSE;
	listSET_LIST_ITEM_VALUE( &( pxTimer->xTimerListItem ), xNextExpiryTime );
	listSET_LIST_ITEM_OWNER( &( pxTimer->xTimerListItem ), pxTimer );
	if( xNextExpiryTime <= xTimeNow )
	{
		if( ( ( TickType_t ) ( xTimeNow - xCommandTime ) ) >= pxTimer->xTimerPeriodInTicks ) 
		{
			xProcessTimerNow = pdTRUE;
		}
		else
		{
			vListInsert( pxOverflowTimerList, &( pxTimer->xTimerListItem ) );
		}
	}
	else
	{
		if( ( xTimeNow < xCommandTime ) && ( xNextExpiryTime >= xCommandTime ) )
		{
			xProcessTimerNow = pdTRUE;
		}
		else
		{
			vListInsert( pxCurrentTimerList, &( pxTimer->xTimerListItem ) );
		}
	}
	return xProcessTimerNow;
}
static void prvProcessExpiredTimer( const TickType_t xNextExpireTime, const TickType_t xTimeNow )
{
	BaseType_t xResult;
	Timer_t * const pxTimer = ( Timer_t * ) listGET_OWNER_OF_HEAD_ENTRY( pxCurrentTimerList );
	( void ) uxListRemove( &( pxTimer->xTimerListItem ) );
	if( pxTimer->uxAutoReload == ( UBaseType_t ) pdTRUE )
	{
		if( prvInsertTimerInActiveList( pxTimer, ( xNextExpireTime + pxTimer->xTimerPeriodInTicks ), xTimeNow, xNextExpireTime ) != pdFALSE )
		{
			xResult = xTimerGenericCommand( pxTimer, tmrCOMMAND_START_DONT_TRACE, xNextExpireTime, NULL, tmrNO_DELAY );
			( void ) xResult;
		}
	}
	pxTimer->pxCallbackFunction( ( TimerHandle_t ) pxTimer );
}
static void prvProcessTimerOrBlockTask( const TickType_t xNextExpireTime, BaseType_t xListWasEmpty )
{
TickType_t xTimeNow;
BaseType_t xTimerListsWereSwitched;

	vTaskSuspendAll();
	{
		xTimeNow = prvSampleTimeNow( &xTimerListsWereSwitched );
		if( xTimerListsWereSwitched == pdFALSE )
		{
			if( ( xListWasEmpty == pdFALSE ) && ( xNextExpireTime <= xTimeNow ) )
			{
				( void ) xTaskResumeAll();
				prvProcessExpiredTimer( xNextExpireTime, xTimeNow );
			}
			else
			{
				if( xListWasEmpty != pdFALSE )
				{
					xListWasEmpty = listLIST_IS_EMPTY( pxOverflowTimerList );
				}
				vQueueWaitForMessageRestricted( xTimerQueue, ( xNextExpireTime - xTimeNow ), xListWasEmpty );
				if( xTaskResumeAll() == pdFALSE )
				{
					taskYIELD();
				}
			}
		}
		else
		{
			( void ) xTaskResumeAll();
		}
	}
}
static void	prvProcessReceivedCommands( void )
{
	DaemonTaskMessage_t xMessage;
	Timer_t *pxTimer;
	BaseType_t xTimerListsWereSwitched, xResult;
	TickType_t xTimeNow;
	while( xQueueReceive( xTimerQueue, &xMessage, tmrNO_DELAY ) != pdFALSE ) 
	{
		if( xMessage.xMessageID >= ( BaseType_t ) 0 )
		{
			pxTimer = xMessage.u.xTimerParameters.pxTimer;
			if( listIS_CONTAINED_WITHIN( NULL, &( pxTimer->xTimerListItem ) ) == pdFALSE )
			{
				( void ) uxListRemove( &( pxTimer->xTimerListItem ) );
			}
			xTimeNow = prvSampleTimeNow( &xTimerListsWereSwitched );
			switch( xMessage.xMessageID )
			{
				case tmrCOMMAND_START :
			    case tmrCOMMAND_START_FROM_ISR :
			    case tmrCOMMAND_RESET :
			    case tmrCOMMAND_RESET_FROM_ISR :
				case tmrCOMMAND_START_DONT_TRACE :
					if( prvInsertTimerInActiveList( pxTimer,  xMessage.u.xTimerParameters.xMessageValue + pxTimer->xTimerPeriodInTicks, xTimeNow, xMessage.u.xTimerParameters.xMessageValue ) != pdFALSE )
					{
						pxTimer->pxCallbackFunction( ( TimerHandle_t ) pxTimer );
						if( pxTimer->uxAutoReload == ( UBaseType_t ) pdTRUE )
						{
							xResult = xTimerGenericCommand( pxTimer, tmrCOMMAND_START_DONT_TRACE, xMessage.u.xTimerParameters.xMessageValue + pxTimer->xTimerPeriodInTicks, NULL, tmrNO_DELAY );
							( void ) xResult;
						}
					}
					break;
				case tmrCOMMAND_STOP :
				case tmrCOMMAND_STOP_FROM_ISR :
					break;
				case tmrCOMMAND_CHANGE_PERIOD :
				case tmrCOMMAND_CHANGE_PERIOD_FROM_ISR :
					pxTimer->xTimerPeriodInTicks = xMessage.u.xTimerParameters.xMessageValue;
					( void ) prvInsertTimerInActiveList( pxTimer, ( xTimeNow + pxTimer->xTimerPeriodInTicks ), xTimeNow, xTimeNow );
					break;
				case tmrCOMMAND_DELETE :
					vPortFree( pxTimer );
				default	:
					break;
			}
		}
	}
}
static void prvTimerTask( void *pvParameters )
{
	TickType_t xNextExpireTime;
	BaseType_t xListWasEmpty;
	( void ) pvParameters;
	for( ;; )
	{

		xNextExpireTime = prvGetNextExpireTime( &xListWasEmpty );
		prvProcessTimerOrBlockTask( xNextExpireTime, xListWasEmpty );
		prvProcessReceivedCommands();
	}
}
BaseType_t xTimerCreateTimerTask( void )
{
	BaseType_t xReturn = pdFALSE;
	prvCheckForValidListAndQueue();
	if( xTimerQueue != NULL )
	{
		xReturn = xTaskCreate(	prvTimerTask,
									"Tmr_Svc",
									120,
									NULL,
									configTIMER_TASK_PRIORITY-2,
									&xTimerTaskHandle );
	}
}