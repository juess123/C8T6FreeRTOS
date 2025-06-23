#ifndef LIST_H
#define LIST_H
#define NULL ((void *)0)
#define portMAX_DELAY ( TickType_t ) 0xffffffffUL
#define listLIST_IS_EMPTY( pxList )	( ( BaseType_t ) ( ( pxList )->uxNumberOfItems == ( UBaseType_t ) 0 ) )
#define listSET_LIST_ITEM_OWNER( pxListItem, pxOwner )		( ( pxListItem )->pvOwner = ( void * ) ( pxOwner ) )
#define listSET_LIST_ITEM_VALUE( pxListItem, xValue )	( ( pxListItem )->xItemValue = ( xValue ) )
#define listCURRENT_LIST_LENGTH( pxList )	( ( pxList )->uxNumberOfItems )
#define listGET_LIST_ITEM_VALUE( pxListItem )	( ( pxListItem )->xItemValue )
#define listLIST_ITEM_CONTAINER( pxListItem ) ( ( pxListItem )->pvContainer )
#define listIS_CONTAINED_WITHIN( pxList, pxListItem ) ( ( BaseType_t ) ( ( pxListItem )->pvContainer == ( void * ) ( pxList ) ) )
#define listGET_OWNER_OF_HEAD_ENTRY( pxList )  ( (&( ( pxList )->xListRoot ))->pxNext->pvOwner )

#define listGET_ITEM_VALUE_OF_HEAD_ENTRY( pxList )	( ( ( pxList )->xListRoot).pxNext->xItemValue )

#define listGET_OWNER_OF_NEXT_ENTRY( pxTCB, pxList )                                       \
{                                                                                          \
	List_t * const pxConstList = ( pxList );                                               \
	( pxConstList )->pxIndex = ( pxConstList )->pxIndex->pxNext;                           \
	if( ( void * ) ( pxConstList )->pxIndex == ( void * ) &( ( pxConstList )->xListRoot ) ) \
	{                                                                                      \
		( pxConstList )->pxIndex = ( pxConstList )->pxIndex->pxNext;                       \
	}                                                                                      \
	( pxTCB ) = ( pxConstList )->pxIndex->pvOwner;                                         \
}
typedef unsigned int TickType_t;
typedef unsigned int UBaseType_t;
typedef struct xLIST_ITEM
{			
	TickType_t xItemValue;			
	struct xLIST_ITEM * pxNext;		
	struct xLIST_ITEM * pxPrevious;	
	void * pvOwner;										
	void * pvContainer;				
}ListItem_t;
typedef struct xMINI_LIST_ITEM
{
	TickType_t xItemValue;
	ListItem_t *  pxNext;
	ListItem_t *  pxPrevious;
}MiniListItem_t;
typedef struct xLIST
{			
	UBaseType_t uxNumberOfItems;
	ListItem_t * pxIndex;			
	MiniListItem_t xListRoot;										
} List_t;
UBaseType_t uxListRemove(ListItem_t* const pxItemToRemove);
void vListInsertEnd( List_t * const pxList, ListItem_t * const pxNewListItem );
void vListInitialiseItem( ListItem_t * const pxItem );
void vListInitialise( List_t * const pxList );
void vListInsert( List_t * const pxList, ListItem_t * const pxNewListItem );
#endif