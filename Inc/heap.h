#ifndef HEAP_H
#define HEAP_H

typedef int BaseType_t;
#define portBYTE_ALIGNMENT			8
#define portBYTE_ALIGNMENT_MASK ( 0x0007 )
#define heapBITS_PER_BYTE		( ( unsigned int ) 8 )
#define heapMINIMUM_BLOCK_SIZE	( ( unsigned int ) ( xHeapStructSize << 1 ) )
#define mtCOVERAGE_TEST_MARKER()
#define NULL ((void *)0)

typedef struct A_BLOCK_LINK
{
    struct A_BLOCK_LINK* pxNextFreeBlock;
    unsigned int xBlockSize;
}BlockLink_t;
void prvHeadInit(void);
void prvInsertBlockIntoFreeList( BlockLink_t *pxBlockToInsert );
void *pvPortMalloc(unsigned int xWantedSize);
void vPortFree( void *pv );
BaseType_t xTaskResumeAll(void);
void vTaskSuspendAll(void);
void *memset(void *dstpp, int c, unsigned int len);
void* memcpy(void* dstpp,const const void* srcpp,unsigned int len);
#endif