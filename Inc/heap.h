#ifndef HEAP_H
#define HEAP_H
#include <stdio.h>
#include <stdint.h>
#include "./task.h"
#define portBYTE_ALIGNMENT			8
#define portBYTE_ALIGNMENT_MASK ( 0x0007 )
#define heapBITS_PER_BYTE		( ( size_t ) 8 )
#define heapMINIMUM_BLOCK_SIZE	( ( size_t ) ( xHeapStructSize << 1 ) )
#define mtCOVERAGE_TEST_MARKER() 
typedef struct A_BLOCK_LINK
{
    struct A_BLOCK_LINK* pxNextFreeBlock;
    size_t xBlockSize;
}BlockLink_t;

void prvHeadInit(void);
void prvInsertBlockIntoFreeList( BlockLink_t *pxBlockToInsert );
void *pvPortMalloc(size_t xWantedSize);
void vPortFree( void *pv );
#endif