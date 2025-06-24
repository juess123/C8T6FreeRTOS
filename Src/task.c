#include "../Inc/task.h"

static List_t * volatile pxDelayedTaskList;
static List_t * volatile pxOverflowDelayedTaskList;
static List_t xDelayedTaskList1;
static List_t xDelayedTaskList2;
static List_t xPendingReadyList;
static List_t pxReadyTasksLists[ configMAX_PRIORITIES ];/*< Prioritised ready tasks. */
static volatile UBaseType_t uxTopReadyPriority 		= tskIDLE_PRIORITY;
static volatile UBaseType_t uxSchedulerSuspended	= ( UBaseType_t ) pdFALSE;
static volatile UBaseType_t uxCurrentNumberOfTasks 	= ( UBaseType_t ) 0U;
static volatile UBaseType_t uxPendedTicks 			= ( UBaseType_t ) 0U;
static volatile TickType_t xNextTaskUnblockTime		= ( TickType_t ) 0U;
static volatile TickType_t xTickCount 				= ( TickType_t ) 0U;
static volatile BaseType_t xNumOfOverflows 			= ( BaseType_t ) 0;
static volatile BaseType_t xSchedulerRunning 		= pdFALSE;
static volatile BaseType_t xYieldPending 			= pdFALSE;
static UBaseType_t uxTaskNumber 					= ( UBaseType_t ) 0U;
static volatile UBaseType_t uxDeletedTasksWaitingCleanUp = ( UBaseType_t ) 0U;
static List_t xTasksWaitingTermination;
static List_t xSuspendedTaskList;


TCB_t * volatile pxCurrentTCB = NULL;

static TaskHandle_t xIdleTaskHandle	= NULL;

static void prvInitialiseTaskLists( void )
{
    UBaseType_t uxPriority;
    for(uxPriority=(UBaseType_t)0U;uxPriority<(UBaseType_t)configMAX_PRIORITIES;uxPriority++)
    {
        vListInitialise(&(pxReadyTasksLists[uxPriority]));
    }
    vListInitialise( &xDelayedTaskList1 );
	vListInitialise( &xDelayedTaskList2 );
    vListInitialise( &xPendingReadyList);
    #if(INCLUDE_vTaskDelete==1)
    {
        vListInitialise( &xTasksWaitingTermination);
    }
    #endif
    #if(INCLUDE_vTaskSuspend==1)
    {
        vListInitialise( &xSuspendedTaskList);
    }
    #endif
    pxDelayedTaskList = &xDelayedTaskList1;
    pxOverflowDelayedTaskList= &xDelayedTaskList2;
}
#define portRECORD_READY_PRIORITY( uxPriority, uxReadyPriorities ) ( uxReadyPriorities ) |= ( 1UL << ( uxPriority ) )
#define taskRECORD_READY_PRIORITY( uxPriority )	portRECORD_READY_PRIORITY( uxPriority, uxTopReadyPriority )
#define prvAddTaskToReadyList( pxTCB )																   \
	taskRECORD_READY_PRIORITY( ( pxTCB )->uxPriority );												   \
	vListInsertEnd( &( pxReadyTasksLists[ ( pxTCB )->uxPriority ] ), &( ( pxTCB )->xStateListItem ) ); \


static void prvAddNewTaskToReadyList( TCB_t *pxNewTCB )
{
    taskENTER_CRITICAL();
    {
        uxCurrentNumberOfTasks++;
        if(pxCurrentTCB == NULL)
        {
            pxCurrentTCB=pxNewTCB;
            if(uxCurrentNumberOfTasks==(UBaseType_t)1)
            {
                prvInitialiseTaskLists();
            }
            else
            {
                mtCOVERAGE_TEST_MARKER();
            }
        }
        else
        {
            if(xSchedulerRunning == pdFALSE)
            {
                if(pxCurrentTCB->uxPriority<=pxNewTCB->uxPriority)
                {
                    pxCurrentTCB= pxNewTCB;
                }
                else
                {
                    mtCOVERAGE_TEST_MARKER();
                }
            }
            else
            {
                mtCOVERAGE_TEST_MARKER();
            }
        }
        uxTaskNumber++;
		prvAddTaskToReadyList( pxNewTCB );
    }
    taskEXIT_CRITICAL();
    if(xSchedulerRunning!=pdFALSE)
    {
        if(pxCurrentTCB->uxBasePriority<pxNewTCB->uxPriority)
        {
            taskYIELD();
        }
        else
        {
            mtCOVERAGE_TEST_MARKER();
        }
    }
    else
    {
        mtCOVERAGE_TEST_MARKER();
    }
}
static void prvInitialiseNewTask( 	TaskFunction_t pxTaskCode,
									const char * const pcName,
									const uint32_t ulStackDepth,
									void * const pvParameters,
									UBaseType_t uxPriority,
									TaskHandle_t * const pxCreatedTask,
									TCB_t *pxNewTCB,
									const MemoryRegion_t * const xRegions )
{
    StackType_t*pxTopOfStack;
    UBaseType_t x;
    (void)memset(pxNewTCB->pxStack,(int)tskSTACK_FILL_BYTE,(unsigned int)ulStackDepth*( sizeof(StackType_t)));
    pxTopOfStack=pxNewTCB->pxStack+(ulStackDepth-(uint32_t)1);
    pxTopOfStack=(StackType_t*)( (uint32_t)pxTopOfStack & (~0x7) );
    for(x=(UBaseType_t)0;x<(UBaseType_t)configMAX_TASK_NAME_LEN;x++)
    {
        pxNewTCB->pcTaskName[x]=pcName[x];
        if(pcName[x]==0x00)
        {
            break;
        }
        else
        {
            mtCOVERAGE_TEST_MARKER();
        }
    }
    pxNewTCB->pcTaskName[configMAX_TASK_NAME_LEN-1]='\0';
    if(uxPriority>=(UBaseType_t)configMAX_PRIORITIES)
    {
        uxPriority=(UBaseType_t)configMAX_PRIORITIES - (UBaseType_t)1U;
    }
    else
    {
        mtCOVERAGE_TEST_MARKER();
    }
    pxNewTCB->uxPriority=uxPriority;
    #if(configUSE_MUTEXES==1)
    {
        pxNewTCB->uxBasePriority=uxPriority;
        pxNewTCB->uxMutexesHeld=0;
    }
    #endif
    vListInitialiseItem( &(pxNewTCB->xStateListItem));
    vListInitialiseItem( &(pxNewTCB->xEventListItem));
    listSET_LIST_ITEM_OWNER( &( pxNewTCB->xStateListItem) ,pxNewTCB);
    listSET_LIST_ITEM_VALUE( &( pxNewTCB->xEventListItem ), ( TickType_t ) configMAX_PRIORITIES - ( TickType_t ) uxPriority ); 
    listSET_LIST_ITEM_OWNER( &( pxNewTCB->xEventListItem ), pxNewTCB );
    #if (configUSE_TASK_NOTIFICATIONS == 1)
    {
        pxNewTCB->ulNotifiedValue=0;
        pxNewTCB->ucNotifyState=taskNOT_WAITING_NOTIFICATION;
    }
    #endif
    pxNewTCB->pxTopOfStack=pxPortInitialiseStack(pxTopOfStack,pxTaskCode,pvParameters);
    if((void*) pxCreatedTask!=NULL)
    {
        *pxCreatedTask=(TaskHandle_t)pxNewTCB;        
    }
    else
    {
        mtCOVERAGE_TEST_MARKER();
    }
}

BaseType_t xTaskCreate(  TaskFunction_t pxTaskCode,
                        const char* const pcName,
                        const uint16_t usStackDepth,
                        void * const pvParameters,
                        UBaseType_t uxPriority,
                        TaskHandle_t * const pxCreatedTask)
{
    TCB_t* pxNewTCB=NULL;
    BaseType_t xreturn=-1;
    StackType_t* pxStack=NULL;
    pxStack = ( StackType_t * ) pvPortMalloc( ( ( ( unsigned int ) usStackDepth ) * sizeof( StackType_t ) ) );
    if(pxStack!=NULL)
    {
        
        pxNewTCB=(TCB_t*)pvPortMalloc(sizeof(TCB_t));
        if(pxNewTCB!=NULL)
        {
            pxNewTCB->pxStack=pxStack;
        }
        else
        {
            vPortFree(pxStack);
        }
    }
    else
    {
        pxNewTCB=NULL;
    }
    if(pxNewTCB!=NULL)
    {
        prvInitialiseNewTask( pxTaskCode, pcName, ( uint32_t ) usStackDepth, pvParameters, uxPriority, pxCreatedTask, pxNewTCB, NULL );
        prvAddNewTaskToReadyList(pxNewTCB);
        xreturn =pdTRUE;
    }
    else
    {
        xreturn = -1;
    }
    return xreturn;
}
void vTaskSuspendAll(void)
{
    ++uxSchedulerSuspended;
}
static void prvResetNextTaskUnblockTime( void )
{
    TCB_t *pxTCb;
    if( listLIST_IS_EMPTY( pxDelayedTaskList ) != pdFALSE )
    {
        xNextTaskUnblockTime = portMAX_DELAY;
    }
    else
    {
        (pxTCb)=(TCB_t*)listGET_OWNER_OF_HEAD_ENTRY(pxDelayedTaskList);
        xNextTaskUnblockTime=listGET_LIST_ITEM_VALUE(&((pxTCb)->xStateListItem));
    }
}
#define taskSWITCH_DELAYED_LISTS()																	\
{																									\
	List_t *pxTemp;																					\
	pxTemp = pxDelayedTaskList;																		\
	pxDelayedTaskList = pxOverflowDelayedTaskList;													\
	pxOverflowDelayedTaskList = pxTemp;																\
	xNumOfOverflows++;																				\
	prvResetNextTaskUnblockTime();																	\
}

BaseType_t xTaskIncrementTick( void )
{
    TCB_t* pxTCB;
    TickType_t xItemValue;
    BaseType_t xSwitchRequired=pdFALSE;
    
    if(uxSchedulerSuspended == (UBaseType_t)pdFALSE)
    {
        const TickType_t xConstTickCount=xTickCount+1;
        xTickCount=xConstTickCount;
        if(xConstTickCount==(TickType_t)0U)
        {
            taskSWITCH_DELAYED_LISTS();
        }

        if(xConstTickCount>=xNextTaskUnblockTime)
        {
            for(;;)
            {
                if(listLIST_IS_EMPTY(pxDelayedTaskList)!=pdFALSE)
                {
                    xNextTaskUnblockTime=portMAX_DELAY;
                    break;
                }
                else
                {
                    pxTCB=(TCB_t*)listGET_OWNER_OF_HEAD_ENTRY(pxDelayedTaskList);
                    
                    xItemValue=listGET_LIST_ITEM_VALUE(&(pxTCB->xStateListItem));
                    if(xConstTickCount<xItemValue)
                    {
                        xNextTaskUnblockTime=xItemValue;
                        break;
                    }
                    else
                    {
                        mtCOVERAGE_TEST_MARKER();
                    }
                    
                    (void)uxListRemove(&(pxTCB->xStateListItem));
                    if(listLIST_ITEM_CONTAINER(&(pxTCB->xEventListItem))!=NULL)
                    {
                        (void)uxListRemove(&(pxTCB)->xEventListItem);
                        
                    }
                    else
                    {
                        mtCOVERAGE_TEST_MARKER();
                    }
                   
                    prvAddTaskToReadyList(pxTCB);
                   
                    #if(configUSE_PREEMPTION==1)
                    {
                        if(pxTCB->uxPriority>=pxCurrentTCB->uxPriority)
                        {
                            xSwitchRequired=pdTRUE;
                            
                        }
                        else
                        {
                            mtCOVERAGE_TEST_MARKER();
                        }
                    }
                    #endif
                }
            }
        }
        #if ( ( configUSE_PREEMPTION == 1 ) && ( configUSE_TIME_SLICING == 1 ) )
		{
			if( listCURRENT_LIST_LENGTH( &( pxReadyTasksLists[ pxCurrentTCB->uxPriority ] ) ) > ( UBaseType_t ) 1 )
			{
				xSwitchRequired = pdTRUE;
			}
		}
		#endif
        #if ( configUSE_TICK_HOOK == 1 )
		{
			if( uxPendedTicks == ( UBaseType_t ) 0U )
			{
				vApplicationTickHook();
			}
			else
			{
				mtCOVERAGE_TEST_MARKER();
			}
		}
		#endif /* configUSE_TICK_HOOK */
    }
    else
    {
        ++uxPendedTicks;
        #if(configUSE_TICK_HOOK==1)
        {
            vApplicationTickHook();
        }
        #endif
    }
    #if ( configUSE_PREEMPTION == 1 )
	{
		if( xYieldPending != pdFALSE )
		{
			xSwitchRequired = pdTRUE;
		}
	}
	#endif /* configUSE_PREEMPTION */

	return xSwitchRequired;
}

BaseType_t xTaskResumeAll(void)
{
    TCB_t *pxTCB=NULL;
    BaseType_t xAlreadyYielded=pdFALSE;
   
    taskENTER_CRITICAL();
    {
        --uxSchedulerSuspended;
        if(uxSchedulerSuspended==(UBaseType_t)pdFALSE)
        {
            if(uxCurrentNumberOfTasks>(UBaseType_t)0U)
            {
                while(listLIST_IS_EMPTY(&xPendingReadyList)==pdFALSE)
                {
                   
                    pxTCB=(TCB_t*)listGET_OWNER_OF_HEAD_ENTRY((&xPendingReadyList));
                    (void)uxListRemove(&(pxTCB->xEventListItem));
                    (void)uxListRemove(&(pxTCB->xStateListItem));
                    prvAddTaskToReadyList(pxTCB);
                    if(pxTCB->uxPriority>=pxCurrentTCB->uxPriority)
                    {
                        xYieldPending=pdTRUE;
                    }
                    else
                    {
                        mtCOVERAGE_TEST_MARKER();
                    }
                }
                if(pxTCB!=NULL)
                {
                    prvResetNextTaskUnblockTime();
                }
                UBaseType_t uxPendCounts=uxPendedTicks;
                if(uxPendCounts>(UBaseType_t)0U)
                {
                    do
                    {
                        if(xTaskIncrementTick()!=pdFALSE)
                        {
                            xYieldPending=pdTRUE;
                        }
                        else
                        {
                            
                        }
                        --uxPendCounts;                        
                    }while(uxPendCounts>(UBaseType_t)0U);
                    uxPendedTicks=0;
                }
                if(xYieldPending !=pdFALSE)
                {
                    #if(configUSE_PREEMPTION!=0)
                    {
                        xAlreadyYielded =pdTRUE;
                    }
                    #endif
                    taskYIELD();
                }
            }
        }
    }
    taskEXIT_CRITICAL();
    return xAlreadyYielded;
}
static void prvDeleteTCB( TCB_t *pxTCB )
{
    vPortFree(pxTCB->pxStack);
    vPortFree(pxTCB);
}

static void prvCheckTasksWaitingTermination( void )
{
    
    #if(INCLUDE_vTaskDelete==1)
    {
        BaseType_t xListIsEmpty;
        while(uxDeletedTasksWaitingCleanUp > (UBaseType_t)0U)
        {
            vTaskSuspendAll();
            {
                xListIsEmpty=listLIST_IS_EMPTY(&xTasksWaitingTermination);
            }
            (void)xTaskResumeAll();
            if(xListIsEmpty==pdFALSE)
            {
                TCB_t *pxTCB;
                taskENTER_CRITICAL();
                {
                    pxTCB=(TCB_t*)listGET_OWNER_OF_HEAD_ENTRY((&xTasksWaitingTermination));
                    (void)uxListRemove(&(pxTCB->xStateListItem));
                    --uxCurrentNumberOfTasks;
                    --uxDeletedTasksWaitingCleanUp;
                }
                taskEXIT_CRITICAL();
                prvDeleteTCB(pxTCB);
            }
            else
            {
                
            }
            
        }
    }
    #endif
}


static void prvIdleTask(void *pvParameters)
{
    (void)pvParameters;
    for(;;)
    {
        
        prvCheckTasksWaitingTermination();
        #if((configUSE_PREEMPTION==1) && ( configIDLE_SHOULD_YIELD == 1 ))
        {
            if(listCURRENT_LIST_LENGTH(& (pxReadyTasksLists[tskIDLE_PRIORITY]) )>(UBaseType_t)1U)
            {
                taskYIELD();
            }
            else
            {
                mtCOVERAGE_TEST_MARKER();
            }
        }
        #endif
       
    }
}

void vTaskStartScheduler( void )
{
    BaseType_t xReturn;
    
    xReturn=xTaskCreate(prvIdleTask,"IDLE",configMINIMAL_STACK_SIZE,(void*)NULL,0,&xIdleTaskHandle);
    
    

    if(xReturn == pdTRUE)
    {
        
        portDISABLE_INTERRUPTS();
        xNextTaskUnblockTime=portMAX_DELAY;
        xSchedulerRunning=pdTRUE;
        xTickCount=(TickType_t)0U;
        //portCONFIGURE_TIMER_FOR_RUN_TIME_STATS();
        
        if(xPortStartScheduler()!=pdFALSE)
        {

        }
        else
        {

        }
    }
    else
    {
        //configASSERT( xReturn != errCOULD_NOT_ALLOCATE_REQUIRED_MEMORY );
    }
    (void)xIdleTaskHandle;
}
__attribute__( ( always_inline ) ) static inline uint8_t ucPortCountLeadingZeros( uint32_t ulBitmap )
{
	uint8_t ucReturn;

	__asm volatile ( "clz %0, %1" : "=r" ( ucReturn ) : "r" ( ulBitmap ) : "memory" );

	return ucReturn;
}
#define portGET_HIGHEST_PRIORITY( uxTopPriority, uxReadyPriorities )    uxTopPriority = ( 31UL - ( uint32_t ) ucPortCountLeadingZeros( ( uxReadyPriorities ) ) )
#define taskSELECT_HIGHEST_PRIORITY_TASK()                                                  \
{                                                                                           \
    UBaseType_t uxTopPriority;                                                              \
    portGET_HIGHEST_PRIORITY( uxTopPriority, uxTopReadyPriority );                          \
    listGET_OWNER_OF_NEXT_ENTRY( pxCurrentTCB, &( pxReadyTasksLists[ uxTopPriority ] ) );   \
} 
void vTaskSwitchContext( void )
{
	if(uxSchedulerSuspended!=(UBaseType_t)pdFALSE)
    {
        xYieldPending = pdTRUE;
    }
    else
    {
        xYieldPending = pdFALSE;
        
        taskSELECT_HIGHEST_PRIORITY_TASK(); 
    }
   
}
#define prvGetTCBFromHandle( pxHandle ) ( ( ( pxHandle ) == NULL ) ? ( TCB_t * ) pxCurrentTCB : ( TCB_t * ) ( pxHandle ) )
#define portRESET_READY_PRIORITY( uxPriority, uxReadyPriorities ) ( uxReadyPriorities ) &= ~( 1UL << ( uxPriority ) )
#define taskRESET_READY_PRIORITY( uxPriority )														\
{																									\
    if( listCURRENT_LIST_LENGTH( &( pxReadyTasksLists[ ( uxPriority ) ] ) ) == ( UBaseType_t ) 0 )	\
    {																								\
        portRESET_READY_PRIORITY( ( uxPriority ), ( uxTopReadyPriority ) );							\
    }																								\
}
void vTaskSuspend( TaskHandle_t xTaskToSuspend )
{
    TCB_t *pxTCB;
    taskENTER_CRITICAL();
    {
        pxTCB = prvGetTCBFromHandle( xTaskToSuspend );
        if(uxListRemove(&(pxTCB->xStateListItem))==(UBaseType_t)0)
        {
            taskRESET_READY_PRIORITY( pxTCB->uxPriority );
        }
        else
        {

        }
        if( listLIST_ITEM_CONTAINER( &( pxTCB->xEventListItem ) ) != NULL )
        {
            ( void ) uxListRemove( &( pxTCB->xEventListItem ) );
        }
        else
        {
            
        }
        vListInsertEnd( &xSuspendedTaskList, &( pxTCB->xStateListItem ) );
    }
    taskEXIT_CRITICAL();
    if( xSchedulerRunning != pdFALSE )
    {
        taskENTER_CRITICAL();
        {
            prvResetNextTaskUnblockTime();
        }
        taskEXIT_CRITICAL();
    }
    else
    {
        
    }
    if(pxTCB==pxCurrentTCB)
    {
        if(xSchedulerRunning!=pdFALSE)
        {
            taskYIELD();
        }
        else
        {
            if( listCURRENT_LIST_LENGTH( &xSuspendedTaskList ) == uxCurrentNumberOfTasks )
            {
                pxCurrentTCB = NULL;
            }
            else
            {
                vTaskSwitchContext();
            }
        }
    }
    else
    {

    }
}

void vTaskDelete(TaskHandle_t xTaskToDelete )
{
    TCB_t* pxTCB;
    taskENTER_CRITICAL();
    {
        pxTCB = prvGetTCBFromHandle( xTaskToDelete );
        if( uxListRemove( &( pxTCB->xStateListItem ) ) == ( UBaseType_t ) 0 )
        {
            taskRESET_READY_PRIORITY( pxTCB->uxPriority );
        }
        if( listLIST_ITEM_CONTAINER( &( pxTCB->xEventListItem ) ) != NULL )
        {
            ( void ) uxListRemove( &( pxTCB->xEventListItem ) );
        }
        uxTaskNumber++;
        if(pxTCB==pxCurrentTCB)
        {
            vListInsertEnd( &xTasksWaitingTermination, &( pxTCB->xStateListItem ) );
            ++uxDeletedTasksWaitingCleanUp;
        }
        else
        {
            --uxCurrentNumberOfTasks;
            prvDeleteTCB( pxTCB );
            prvResetNextTaskUnblockTime();
        }
    }
    taskEXIT_CRITICAL();
    if( xSchedulerRunning != pdFALSE )
    {
        if( pxTCB == pxCurrentTCB )
        {
            taskYIELD();
        }
    }
}


static void prvAddCurrentTaskToDelayedList( TickType_t xTicksToWait, const BaseType_t xCanBlockIndefinitely )
{
   
    TickType_t xTimeToWake;
    const TickType_t xConstTickCount = xTickCount;
   
    if( uxListRemove( &( pxCurrentTCB->xStateListItem ) ) == ( UBaseType_t ) 0 )
	{
		portRESET_READY_PRIORITY( pxCurrentTCB->uxPriority, uxTopReadyPriority );
	}
    if( ( xTicksToWait == portMAX_DELAY ) && ( xCanBlockIndefinitely != pdFALSE ) )
    {
        vListInsertEnd( &xSuspendedTaskList, &( pxCurrentTCB->xStateListItem ) );
        
    }
    else
    {
        xTimeToWake = xConstTickCount + xTicksToWait;
        listSET_LIST_ITEM_VALUE( &( pxCurrentTCB->xStateListItem ), xTimeToWake );
        if(  xTimeToWake < xConstTickCount )
        {
            vListInsert( pxOverflowDelayedTaskList, &( pxCurrentTCB->xStateListItem ) );
        }
        else
        {
            vListInsert( pxDelayedTaskList, &( pxCurrentTCB->xStateListItem ) );
            if( xTimeToWake < xNextTaskUnblockTime )
            {
                xNextTaskUnblockTime = xTimeToWake;
            }
            else
            {
                
            }
        }
    }
    
}

void vTaskDelay( const TickType_t xTicksToDelay )
{
    BaseType_t xAlreadyYielded = pdFALSE;
   
    if( xTicksToDelay > ( TickType_t ) 0U )
    {
        vTaskSuspendAll();
        { 
            
            prvAddCurrentTaskToDelayedList( xTicksToDelay, pdFALSE );
        }
        xAlreadyYielded = xTaskResumeAll();
        
    }
    if( xAlreadyYielded == pdFALSE )
    {
        taskYIELD();
    }
}
TickType_t xTaskGetTickCount( void )
{
    TickType_t xTicks;
	xTicks = xTickCount;
	return xTicks;
}
void vTaskDelayUntil( TickType_t * const pxPreviousWakeTime, const TickType_t xTimeIncrement )
{
    TickType_t xTimeToWake;
	BaseType_t xAlreadyYielded, xShouldDelay = pdFALSE;
    vTaskSuspendAll();
    {
        const TickType_t xConstTickCount = xTickCount;
        xTimeToWake = *pxPreviousWakeTime + xTimeIncrement;
        if( xConstTickCount < *pxPreviousWakeTime )
        {
            if( ( xTimeToWake < *pxPreviousWakeTime ) && ( xTimeToWake > xConstTickCount ) )
            {
                xShouldDelay = pdTRUE;
            }
        }
        else
        {
            if( ( xTimeToWake < *pxPreviousWakeTime ) || ( xTimeToWake > xConstTickCount ) )
            {
                xShouldDelay = pdTRUE;
            }
        }
        *pxPreviousWakeTime = xTimeToWake;
        if( xShouldDelay != pdFALSE )
        {
            prvAddCurrentTaskToDelayedList( xTimeToWake - xConstTickCount, pdFALSE );
        }
    }
    xAlreadyYielded=xTaskResumeAll();
    if( xAlreadyYielded == pdFALSE )
    {
        taskYIELD();
    }

}
UBaseType_t uxTaskPriorityGet( TaskHandle_t xTask )
{
    TCB_t *pxTCB;
    UBaseType_t uxReturn;
    taskENTER_CRITICAL();
    {
        pxTCB = prvGetTCBFromHandle( xTask );
        uxReturn = pxTCB->uxPriority;
    }
    taskEXIT_CRITICAL();

    return uxReturn;
}
#define taskEVENT_LIST_ITEM_VALUE_IN_USE	0x80000000UL
void vTaskPrioritySet( TaskHandle_t xTask, UBaseType_t uxNewPriority )
{
    TCB_t *pxTCB;
	UBaseType_t uxCurrentBasePriority, uxPriorityUsedOnEntry;
	BaseType_t xYieldRequired = pdFALSE;
    if( uxNewPriority >= ( UBaseType_t ) configMAX_PRIORITIES )
    {
        uxNewPriority = ( UBaseType_t ) configMAX_PRIORITIES - ( UBaseType_t ) 1U;
    }
    taskENTER_CRITICAL();
    {
        pxTCB = prvGetTCBFromHandle( xTask );
        uxCurrentBasePriority = pxTCB->uxBasePriority;

        if( uxCurrentBasePriority != uxNewPriority )
        {
            if( uxNewPriority > uxCurrentBasePriority )
            {
                if( pxTCB != pxCurrentTCB )
                {
                    if( uxNewPriority >= pxCurrentTCB->uxPriority )
                    {
                        xYieldRequired = pdTRUE;
                    }
                }
                else
                {

                }
            }
            else if( pxTCB == pxCurrentTCB )
            {
                xYieldRequired = pdTRUE;
            }
            else
            {

            }
            uxPriorityUsedOnEntry = pxTCB->uxPriority;
            if( pxTCB->uxBasePriority == pxTCB->uxPriority )
            {
                pxTCB->uxPriority = uxNewPriority;
            }
            pxTCB->uxBasePriority = uxNewPriority;
            if( ( listGET_LIST_ITEM_VALUE( &( pxTCB->xEventListItem ) ) & taskEVENT_LIST_ITEM_VALUE_IN_USE ) == 0UL )
            {
                listSET_LIST_ITEM_VALUE( &( pxTCB->xEventListItem ), ( ( TickType_t ) configMAX_PRIORITIES - ( TickType_t ) uxNewPriority ) ); /*lint !e961 MISRA exception as the casts are only redundant for some ports. */
            }
            if( listIS_CONTAINED_WITHIN( &( pxReadyTasksLists[ uxPriorityUsedOnEntry ] ), &( pxTCB->xStateListItem ) ) != pdFALSE )
            {
                if( uxListRemove( &( pxTCB->xStateListItem ) ) == ( UBaseType_t ) 0 )
                {
                    portRESET_READY_PRIORITY( uxPriorityUsedOnEntry, uxTopReadyPriority );
                }
                prvAddTaskToReadyList( pxTCB );
            }
            if( xYieldRequired != pdFALSE )
            {
                taskYIELD();
            }
            ( void ) uxPriorityUsedOnEntry;
        }
    }
    taskEXIT_CRITICAL();
}

void vTaskPriorityInherit( TaskHandle_t const pxMutexHolder )
{
    TCB_t * const pxTCB = ( TCB_t * ) pxMutexHolder;
    if( pxMutexHolder != NULL )
    {
        if( pxTCB->uxPriority < pxCurrentTCB->uxPriority )
        {
            if( ( listGET_LIST_ITEM_VALUE( &( pxTCB->xEventListItem ) ) & taskEVENT_LIST_ITEM_VALUE_IN_USE ) == 0UL )
            {
                listSET_LIST_ITEM_VALUE( &( pxTCB->xEventListItem ), ( TickType_t ) configMAX_PRIORITIES - ( TickType_t ) pxCurrentTCB->uxPriority ); 
            }
            if( listIS_CONTAINED_WITHIN( &( pxReadyTasksLists[ pxTCB->uxPriority ] ), &( pxTCB->xStateListItem ) ) != pdFALSE )
            {
                if( uxListRemove( &( pxTCB->xStateListItem ) ) == ( UBaseType_t ) 0 )
                {
                    taskRESET_READY_PRIORITY( pxTCB->uxPriority );
                }
                pxTCB->uxPriority = pxCurrentTCB->uxPriority;
                prvAddTaskToReadyList( pxTCB );
            }
            else
            {
                pxTCB->uxPriority = pxCurrentTCB->uxPriority;
            }
        }
    }
}

UBaseType_t uxTaskPriorityGetFromISR( TaskHandle_t xTask )
{
    TCB_t *pxTCB;
    UBaseType_t uxReturn, uxSavedInterruptState;
    uxSavedInterruptState = portSET_INTERRUPT_MASK_FROM_ISR();
    {
        pxTCB = prvGetTCBFromHandle( xTask );
        uxReturn = pxTCB->uxPriority;
    }
    portCLEAR_INTERRUPT_MASK_FROM_ISR( uxSavedInterruptState );
    return uxReturn;
}
BaseType_t xTaskRemoveFromEventList( const List_t * const pxEventList ) 
{
    TCB_t *pxUnblockedTCB;
    BaseType_t xReturn;
    pxUnblockedTCB = ( TCB_t * ) listGET_OWNER_OF_HEAD_ENTRY( pxEventList );
	
	( void ) uxListRemove( &( pxUnblockedTCB->xEventListItem ) );
    if( uxSchedulerSuspended == ( UBaseType_t ) pdFALSE )
	{
		( void ) uxListRemove( &( pxUnblockedTCB->xStateListItem ) );
		prvAddTaskToReadyList( pxUnblockedTCB );
	}
    else
    {
        vListInsertEnd( &( xPendingReadyList ), &( pxUnblockedTCB->xEventListItem ) );
    }
    if(pxUnblockedTCB->uxPriority > pxCurrentTCB->uxPriority)
    {
        xReturn = pdTRUE;
        xYieldPending = pdTRUE;
    }
    else
    {
        xReturn = pdFALSE;
    }
    return xReturn;
}
BaseType_t xTaskPriorityDisinherit( TaskHandle_t const pxMutexHolder )
{
    TCB_t * const pxTCB = ( TCB_t * ) pxMutexHolder;
	BaseType_t xReturn = pdFALSE;
    if( pxMutexHolder != NULL )
    {
        ( pxTCB->uxMutexesHeld )--;

        if( pxTCB->uxPriority != pxTCB->uxBasePriority )
        {
            if( pxTCB->uxMutexesHeld == ( UBaseType_t ) 0 )
            {
                if( uxListRemove( &( pxTCB->xStateListItem ) ) == ( UBaseType_t ) 0 )
                {
                    taskRESET_READY_PRIORITY( pxTCB->uxPriority );
                    
                }
                pxTCB->uxPriority = pxTCB->uxBasePriority;
                listSET_LIST_ITEM_VALUE( &( pxTCB->xEventListItem ), ( TickType_t ) configMAX_PRIORITIES - ( TickType_t ) pxTCB->uxPriority ); 
                prvAddTaskToReadyList( pxTCB );
                xReturn = pdTRUE;
            }
        }
    }
    return xReturn;
}
void vTaskSetTimeOutState( TimeOut_t * const pxTimeOut )
{
	pxTimeOut->xOverflowCount = xNumOfOverflows;
	pxTimeOut->xTimeOnEntering = xTickCount;
}
void vTaskMissedYield( void )
{
	xYieldPending = pdTRUE;
}
BaseType_t xTaskCheckForTimeOut( TimeOut_t * const pxTimeOut, TickType_t * const pxTicksToWait )
{
    BaseType_t xReturn;
    taskENTER_CRITICAL();
    {
        const TickType_t xConstTickCount = xTickCount;
        if( *pxTicksToWait == portMAX_DELAY )
        {
            xReturn = pdFALSE;
        }

        if( ( xNumOfOverflows != pxTimeOut->xOverflowCount ) && ( xConstTickCount >= pxTimeOut->xTimeOnEntering ) ) 
		{
			xReturn = pdTRUE;
		}
        else if( ( ( TickType_t ) ( xConstTickCount - pxTimeOut->xTimeOnEntering ) ) < *pxTicksToWait )
		{
			
			*pxTicksToWait -= ( xConstTickCount - pxTimeOut->xTimeOnEntering );
			vTaskSetTimeOutState( pxTimeOut );
			xReturn = pdFALSE;
		}
        else
        {
            return xReturn;
        }
    }
    taskEXIT_CRITICAL();
    return xReturn;
}

void vTaskPlaceOnEventList( List_t * const pxEventList, const TickType_t xTicksToWait )
{
	vListInsert( pxEventList, &( pxCurrentTCB->xEventListItem ) );
	prvAddCurrentTaskToDelayedList( xTicksToWait, pdTRUE );
}
void *pvTaskIncrementMutexHeldCount( void )
{
    if( pxCurrentTCB != NULL )
    {
        ( pxCurrentTCB->uxMutexesHeld )++;
    }

    return pxCurrentTCB;
}
TaskHandle_t xTaskGetCurrentTaskHandle( void )
{
    TaskHandle_t xReturn;

    xReturn = pxCurrentTCB;

    return xReturn;
}

BaseType_t xTaskGetSchedulerState( void )
{
    BaseType_t xReturn;
    if( xSchedulerRunning == pdFALSE )
    {
        xReturn = taskSCHEDULER_NOT_STARTED;
    }
    else
    {
        if( uxSchedulerSuspended == ( UBaseType_t ) pdFALSE )
        {
            xReturn = taskSCHEDULER_RUNNING;
        }
        else
        {
            xReturn = taskSCHEDULER_SUSPENDED;
        }
    }
    return xReturn;
}
void vTaskPlaceOnEventListRestricted( List_t * const pxEventList, TickType_t xTicksToWait, const BaseType_t xWaitIndefinitely )
{
    vListInsertEnd( pxEventList, &( pxCurrentTCB->xEventListItem ) );
    if( xWaitIndefinitely != pdFALSE )
    {
        xTicksToWait = portMAX_DELAY;
    }
    prvAddCurrentTaskToDelayedList( xTicksToWait, xWaitIndefinitely );
}

BaseType_t xTaskGenericNotify( TaskHandle_t xTaskToNotify, UBaseType_t ulValue, eNotifyAction eAction, UBaseType_t *pulPreviousNotificationValue )
{
    TCB_t * pxTCB;
	BaseType_t xReturn = pdTRUE;
	uint8_t ucOriginalNotifyState;
    pxTCB = ( TCB_t * ) xTaskToNotify;
    taskENTER_CRITICAL();
    {
        if( pulPreviousNotificationValue != NULL )
        {
            *pulPreviousNotificationValue = pxTCB->ulNotifiedValue;
        }

        ucOriginalNotifyState = pxTCB->ucNotifyState;

        pxTCB->ucNotifyState = taskNOTIFICATION_RECEIVED;
        switch( eAction )
        {
            case eSetBits	:
                pxTCB->ulNotifiedValue |= ulValue;
                break;

            case eIncrement	:
                ( pxTCB->ulNotifiedValue )++;
                break;

            case eSetValueWithOverwrite	:
                pxTCB->ulNotifiedValue = ulValue;
                break;

            case eSetValueWithoutOverwrite :
                if( ucOriginalNotifyState != taskNOTIFICATION_RECEIVED )
                {
                    pxTCB->ulNotifiedValue = ulValue;
                    xReturn = ucOriginalNotifyState;
                }
                else
                {
                    xReturn = pdFALSE;
                }
                break;

            case eNoAction:
                break;
        }
        if( ucOriginalNotifyState == taskWAITING_NOTIFICATION )
        {
            ( void ) uxListRemove( &( pxTCB->xStateListItem ) );
			prvAddTaskToReadyList( pxTCB );
            if( pxTCB->uxPriority > pxCurrentTCB->uxPriority )
            {
                taskYIELD();
            }
        }
    }
    taskEXIT_CRITICAL();
    return xReturn;
}
UBaseType_t ulTaskNotifyTake( BaseType_t xClearCountOnExit, TickType_t xTicksToWait )
{
    UBaseType_t ulReturn;
    taskENTER_CRITICAL();
    {
        if( pxCurrentTCB->ulNotifiedValue == 0UL )
        {
            pxCurrentTCB->ucNotifyState = taskWAITING_NOTIFICATION;
            if( xTicksToWait > ( TickType_t ) 0 )
            {
                prvAddCurrentTaskToDelayedList( xTicksToWait, pdTRUE );
                taskYIELD();
            } 
        }
    }
    taskEXIT_CRITICAL();
    taskENTER_CRITICAL();
    {
        ulReturn = pxCurrentTCB->ulNotifiedValue;
        if( ulReturn != 0UL )
        {
            if( xClearCountOnExit != pdFALSE )
            {
                pxCurrentTCB->ulNotifiedValue = 0UL;
            }
            else
            {
                pxCurrentTCB->ulNotifiedValue = ulReturn - 1;
            }
        }
        pxCurrentTCB->ucNotifyState = taskNOT_WAITING_NOTIFICATION;
    }
    taskEXIT_CRITICAL();
    return ulReturn;
}

void vTaskNotifyGiveFromISR( TaskHandle_t xTaskToNotify, BaseType_t *pxHigherPriorityTaskWoken )
{
    TCB_t * pxTCB;
	uint8_t ucOriginalNotifyState;
	UBaseType_t uxSavedInterruptStatus;
    pxTCB = ( TCB_t * ) xTaskToNotify;

	uxSavedInterruptStatus = portSET_INTERRUPT_MASK_FROM_ISR();
    {
        ucOriginalNotifyState = pxTCB->ucNotifyState;
		pxTCB->ucNotifyState = taskNOTIFICATION_RECEIVED;
        ( pxTCB->ulNotifiedValue )++;
        if( ucOriginalNotifyState == taskWAITING_NOTIFICATION )
        {
            if( uxSchedulerSuspended == ( UBaseType_t ) pdFALSE )
            {
                ( void ) uxListRemove( &( pxTCB->xStateListItem ) );
                prvAddTaskToReadyList( pxTCB );
            }
            else
            {
                vListInsertEnd( &( xPendingReadyList ), &( pxTCB->xEventListItem ) );
            }

            if( pxTCB->uxPriority > pxCurrentTCB->uxPriority )
            {
                if( pxHigherPriorityTaskWoken != NULL )
                {
                    *pxHigherPriorityTaskWoken = pdTRUE;
                }
                else
                {
                    xYieldPending = pdTRUE;
                }
            }
        }
    }
    portCLEAR_INTERRUPT_MASK_FROM_ISR( uxSavedInterruptStatus );
}

BaseType_t xTaskNotifyWait( uint32_t ulBitsToClearOnEntry, uint32_t ulBitsToClearOnExit, uint32_t *pulNotificationValue, TickType_t xTicksToWait )
{
    BaseType_t xReturn;
    taskENTER_CRITICAL();
    {
        if( pxCurrentTCB->ucNotifyState != taskNOTIFICATION_RECEIVED )
        {
            pxCurrentTCB->ulNotifiedValue &= ~ulBitsToClearOnEntry;
            pxCurrentTCB->ucNotifyState = taskWAITING_NOTIFICATION;
            if( xTicksToWait > ( TickType_t ) 0 )
            {
                prvAddCurrentTaskToDelayedList( xTicksToWait, pdTRUE );
                taskYIELD();
            }
        }
    }    
    taskEXIT_CRITICAL();

    taskENTER_CRITICAL();
    {
        if( pulNotificationValue != NULL )
        {
            *pulNotificationValue = pxCurrentTCB->ulNotifiedValue;
        }
        if( pxCurrentTCB->ucNotifyState == taskWAITING_NOTIFICATION )
        {
            xReturn = pdFALSE;
        }
        else
        {
            pxCurrentTCB->ulNotifiedValue &= ~ulBitsToClearOnExit;
            xReturn = pdTRUE;
        }
        pxCurrentTCB->ucNotifyState = taskNOT_WAITING_NOTIFICATION;
    }
    taskEXIT_CRITICAL();
    return xReturn;
}
BaseType_t xTaskGenericNotifyFromISR( TaskHandle_t xTaskToNotify, uint32_t ulValue, eNotifyAction eAction, uint32_t *pulPreviousNotificationValue, BaseType_t *pxHigherPriorityTaskWoken )
{
    TCB_t * pxTCB;
	uint8_t ucOriginalNotifyState;
	BaseType_t xReturn = 1;
	UBaseType_t uxSavedInterruptStatus;
    pxTCB = ( TCB_t * ) xTaskToNotify;
    uxSavedInterruptStatus = portSET_INTERRUPT_MASK_FROM_ISR();
    {
        if( pulPreviousNotificationValue != NULL )
        {
            *pulPreviousNotificationValue = pxTCB->ulNotifiedValue;
        }
        ucOriginalNotifyState = pxTCB->ucNotifyState;
        pxTCB->ucNotifyState = taskNOTIFICATION_RECEIVED;
        switch( eAction )
        {
            case eSetBits	:
                pxTCB->ulNotifiedValue |= ulValue;
                break;

            case eIncrement	:
                ( pxTCB->ulNotifiedValue )++;
                break;

            case eSetValueWithOverwrite	:
                pxTCB->ulNotifiedValue = ulValue;
                break;

            case eSetValueWithoutOverwrite :
                if( ucOriginalNotifyState != taskNOTIFICATION_RECEIVED )
                {
                    pxTCB->ulNotifiedValue = ulValue;
                }
                else
                {
                    xReturn = 0;
                }
                break;
            case eNoAction :
                break;
        }
        if( ucOriginalNotifyState == taskWAITING_NOTIFICATION )
        {
            if( uxSchedulerSuspended == ( UBaseType_t ) pdFALSE )
            {
                ( void ) uxListRemove( &( pxTCB->xStateListItem ) );
                prvAddTaskToReadyList( pxTCB );
            }
            else
            {
                vListInsertEnd( &( xPendingReadyList ), &( pxTCB->xEventListItem ) );
            }
            if( pxTCB->uxPriority > pxCurrentTCB->uxPriority )
            {
                if( pxHigherPriorityTaskWoken != NULL )
                {
                    *pxHigherPriorityTaskWoken = pdTRUE;
                }
                else
                {
                    xYieldPending = pdTRUE;
                }
            }
        }
    }
    portCLEAR_INTERRUPT_MASK_FROM_ISR( uxSavedInterruptStatus );
    return xReturn;
}

BaseType_t xTaskGenericNotifyStateClear( TaskHandle_t xTask)
{
    TCB_t * pxTCB;
    BaseType_t xReturn;

    pxTCB = prvGetTCBFromHandle( xTask );

    taskENTER_CRITICAL();
    {
        if( pxTCB->ucNotifyState == taskNOTIFICATION_RECEIVED )
        {
            pxTCB->ucNotifyState = taskNOT_WAITING_NOTIFICATION;
            xReturn = 1;
        }
        else
        {
            xReturn = 0;
        }
    }
    taskEXIT_CRITICAL();
    return xReturn;
}
void vTaskPlaceOnUnorderedEventList( List_t * pxEventList, const TickType_t xItemValue, const TickType_t xTicksToWait )
{

	listSET_LIST_ITEM_VALUE( &( pxCurrentTCB->xEventListItem ), xItemValue | taskEVENT_LIST_ITEM_VALUE_IN_USE );
	vListInsertEnd( pxEventList, &( pxCurrentTCB->xEventListItem ) );
	prvAddCurrentTaskToDelayedList( xTicksToWait, pdTRUE );
}
TickType_t uxTaskResetEventItemValue( void )
{
    TickType_t uxReturn;

	uxReturn = listGET_LIST_ITEM_VALUE( &( pxCurrentTCB->xEventListItem ) );
	listSET_LIST_ITEM_VALUE( &( pxCurrentTCB->xEventListItem ), ( ( TickType_t ) configMAX_PRIORITIES - ( TickType_t ) pxCurrentTCB->uxPriority ) ); 

	return uxReturn;
}
BaseType_t xTaskRemoveFromUnorderedEventList( ListItem_t * pxEventListItem, const TickType_t xItemValue )
{
	TCB_t *pxUnblockedTCB;
	BaseType_t xReturn;
	listSET_LIST_ITEM_VALUE( pxEventListItem, xItemValue | taskEVENT_LIST_ITEM_VALUE_IN_USE );

	pxUnblockedTCB = ( TCB_t * ) listGET_LIST_ITEM_OWNER( pxEventListItem );
	( void ) uxListRemove( pxEventListItem );

	
	( void ) uxListRemove( &( pxUnblockedTCB->xStateListItem ) );
	prvAddTaskToReadyList( pxUnblockedTCB );

	if( pxUnblockedTCB->uxPriority > pxCurrentTCB->uxPriority )
	{
		xReturn = pdTRUE;

		xYieldPending = pdTRUE;
	}
	else
	{
		xReturn = pdFALSE;
	}

	return xReturn;
}
