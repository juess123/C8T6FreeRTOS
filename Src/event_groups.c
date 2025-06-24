#include "../Inc/event_groups.h"
EventGroupHandle_t xEventGroupCreate( void )
{
    EventGroup_t *pxEventBits;
    pxEventBits = ( EventGroup_t * ) pvPortMalloc( sizeof( EventGroup_t ) );

    if( pxEventBits != NULL )
    {
        pxEventBits->uxEventBits = 0;
        vListInitialise( &( pxEventBits->xTasksWaitingForBits ) );
    }
    return ( EventGroupHandle_t ) pxEventBits;
}

static BaseType_t prvTestWaitCondition( const EventBits_t uxCurrentEventBits, const EventBits_t uxBitsToWaitFor, const BaseType_t xWaitForAllBits )
{

	BaseType_t xWaitConditionMet = pdFALSE;

	if( xWaitForAllBits == pdFALSE )
	{
		if( ( uxCurrentEventBits & uxBitsToWaitFor ) != ( EventBits_t ) 0 )
		{
			xWaitConditionMet = pdTRUE;
		}
	}
	else
	{
		if( ( uxCurrentEventBits & uxBitsToWaitFor ) == uxBitsToWaitFor )
		{
			xWaitConditionMet = pdTRUE;
		}
	}

	return xWaitConditionMet;
}
EventBits_t xEventGroupWaitBits( EventGroupHandle_t xEventGroup, const EventBits_t uxBitsToWaitFor, const BaseType_t xClearOnExit, const BaseType_t xWaitForAllBits, TickType_t xTicksToWait )
{
    EventGroup_t *pxEventBits = ( EventGroup_t * ) xEventGroup;
    EventBits_t uxReturn, uxControlBits = 0;
    BaseType_t xWaitConditionMet, xAlreadyYielded;
    BaseType_t xTimeoutOccurred = pdFALSE;
    vTaskSuspendAll();
    {
        const EventBits_t uxCurrentEventBits = pxEventBits->uxEventBits;
        xWaitConditionMet = prvTestWaitCondition( uxCurrentEventBits, uxBitsToWaitFor, xWaitForAllBits );
        if( xWaitConditionMet != pdFALSE )
		{
			uxReturn = uxCurrentEventBits;
			xTicksToWait = ( TickType_t ) 0;
			if( xClearOnExit != pdFALSE )
			{
				pxEventBits->uxEventBits &= ~uxBitsToWaitFor;
			}
		}
        else if( xTicksToWait == ( TickType_t ) 0 )
		{
			uxReturn = uxCurrentEventBits;
		}
        else
        {
            if( xClearOnExit != pdFALSE )
			{
				uxControlBits |= eventCLEAR_EVENTS_ON_EXIT_BIT; 
			}
			if( xWaitForAllBits != pdFALSE )
			{
				uxControlBits |= eventWAIT_FOR_ALL_BITS;
			}
            vTaskPlaceOnUnorderedEventList( &( pxEventBits->xTasksWaitingForBits ), ( uxBitsToWaitFor | uxControlBits ), xTicksToWait );
            uxReturn = 0;
        }
    }
    xAlreadyYielded = xTaskResumeAll();
    if( xTicksToWait != ( TickType_t ) 0 )
    {
        if( xAlreadyYielded == pdFALSE )
		{
			taskYIELD();
		}
        uxReturn = uxTaskResetEventItemValue();
        if( ( uxReturn & eventUNBLOCKED_DUE_TO_BIT_SET ) == ( EventBits_t ) 0 )
        {
            taskENTER_CRITICAL();
			{
				uxReturn = pxEventBits->uxEventBits;
				if( ( uxReturn & uxBitsToWaitFor ) == uxBitsToWaitFor )
				{
					pxEventBits->uxEventBits &= ~uxBitsToWaitFor;
				}
			}
			taskEXIT_CRITICAL();
			xTimeoutOccurred = pdFALSE;
        }
		uxReturn &= ~eventEVENT_BITS_CONTROL_BYTES;
    }
    return uxReturn;
}

EventBits_t xEventGroupSetBits( EventGroupHandle_t xEventGroup, const EventBits_t uxBitsToSet )
{
	ListItem_t *pxListItem, *pxNext;
	ListItem_t const *pxListEnd;
	List_t *pxList;
	EventBits_t uxBitsToClear = 0, uxBitsWaitedFor, uxControlBits;
	EventGroup_t *pxEventBits = ( EventGroup_t * ) xEventGroup;
	BaseType_t xMatchFound = pdFALSE;
	pxList = &( pxEventBits->xTasksWaitingForBits );
	pxListEnd = listGET_END_MARKER( pxList );
	vTaskSuspendAll();
	{
		pxListItem = listGET_HEAD_ENTRY( pxList );
		pxEventBits->uxEventBits |= uxBitsToSet;
		while( pxListItem != pxListEnd )
		{
			pxNext = listGET_NEXT( pxListItem );
			uxBitsWaitedFor = listGET_LIST_ITEM_VALUE( pxListItem );
			xMatchFound = pdFALSE;
			uxControlBits = uxBitsWaitedFor & eventEVENT_BITS_CONTROL_BYTES;
			uxBitsWaitedFor &= ~eventEVENT_BITS_CONTROL_BYTES;
			if( ( uxControlBits & eventWAIT_FOR_ALL_BITS ) == ( EventBits_t ) 0 )
			{
				if( ( uxBitsWaitedFor & pxEventBits->uxEventBits ) != ( EventBits_t ) 0 )
				{
					xMatchFound = pdTRUE;
				}
			}
			else if( ( uxBitsWaitedFor & pxEventBits->uxEventBits ) == uxBitsWaitedFor )
			{
				xMatchFound = pdTRUE;
			}
			if( xMatchFound != pdFALSE )
			{
				
				if( ( uxControlBits & eventCLEAR_EVENTS_ON_EXIT_BIT ) != ( EventBits_t ) 0 )
				{
					uxBitsToClear |= uxBitsWaitedFor;
				}
				( void ) xTaskRemoveFromUnorderedEventList( pxListItem, pxEventBits->uxEventBits | eventUNBLOCKED_DUE_TO_BIT_SET );
			}
			pxListItem = pxNext;
		}
		pxEventBits->uxEventBits &= ~uxBitsToClear;
	}
	( void ) xTaskResumeAll();
	return pxEventBits->uxEventBits;
}