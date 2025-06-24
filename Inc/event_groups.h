#include "task.h"
typedef void * EventGroupHandle_t;
typedef TickType_t EventBits_t;



#define eventCLEAR_EVENTS_ON_EXIT_BIT	0x01000000UL
#define eventWAIT_FOR_ALL_BITS			0x04000000UL
#define eventUNBLOCKED_DUE_TO_BIT_SET	0x02000000UL
#define eventEVENT_BITS_CONTROL_BYTES	0xff000000UL
typedef struct xEventGroupDefinition
{
	EventBits_t uxEventBits;
	List_t xTasksWaitingForBits;		/*< List of tasks waiting for a bit to be set. */
} EventGroup_t;
EventGroupHandle_t xEventGroupCreate( void );
EventBits_t xEventGroupWaitBits( EventGroupHandle_t xEventGroup, const EventBits_t uxBitsToWaitFor, const BaseType_t xClearOnExit, const BaseType_t xWaitForAllBits, TickType_t xTicksToWait );
EventBits_t xEventGroupSetBits( EventGroupHandle_t xEventGroup, const EventBits_t uxBitsToSet );