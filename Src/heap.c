#include "../Inc/heap.h"


static BlockLink_t xStart, *pxEnd = NULL;
static const size_t xHeapStructSize	= ( sizeof( BlockLink_t ) + ( ( size_t ) ( portBYTE_ALIGNMENT - 1 ) ) ) & ~( ( size_t ) portBYTE_ALIGNMENT_MASK );
static size_t xFreeBytesRemaining = 0U;
static size_t xMinimumEverFreeBytesRemaining = 0U;
static size_t xBlockAllocatedBit = 0;
static uint8_t ucHeap[ 10*1024 ];
void prvHeadInit(void)
{
    BlockLink_t *pxFirstFreeBlock;
    uint8_t *pucAlignedHead;
    size_t uxAddress;
    size_t xTotalHeadSize=(size_t)10*1024;
    uxAddress=(size_t)ucHeap;
    memset(ucHeap, 0, 10*1024);
    if((uxAddress & 0x007)!=0)
    {
        uxAddress+=(8-1);
        uxAddress&=~((size_t)0x007);
        xTotalHeadSize-=uxAddress-(size_t)ucHeap;
    }
    
    pucAlignedHead=(uint8_t*)uxAddress;

    xStart.pxNextFreeBlock=(void*)pucAlignedHead;// void*  or BlockLink_t
    xStart.xBlockSize=(size_t)0;

    uxAddress=(size_t)pucAlignedHead+xTotalHeadSize;
    uxAddress-=xHeapStructSize;
    uxAddress &=~((size_t)portBYTE_ALIGNMENT_MASK);

    pxEnd=(void*)uxAddress;
    pxEnd->xBlockSize=(size_t)0;
    pxEnd->pxNextFreeBlock=NULL;

    pxFirstFreeBlock=(void*)pucAlignedHead;
    pxFirstFreeBlock->xBlockSize=uxAddress-(size_t)pxFirstFreeBlock;
    pxFirstFreeBlock->pxNextFreeBlock=pxEnd;

    xMinimumEverFreeBytesRemaining = pxFirstFreeBlock->xBlockSize;
	xFreeBytesRemaining = pxFirstFreeBlock->xBlockSize;

    xBlockAllocatedBit=((size_t) 1)<< (sizeof(size_t)*heapBITS_PER_BYTE-1);
    
}
void prvInsertBlockIntoFreeList( BlockLink_t *pxBlockToInsert )
{
    BlockLink_t* pxIterator;
    uint8_t *puc;
    for(pxIterator=&xStart;pxIterator->pxNextFreeBlock<pxBlockToInsert;pxIterator=pxIterator->pxNextFreeBlock)
    {

    };
    puc=(uint8_t*)pxIterator;
    if(puc+pxIterator->xBlockSize==(uint8_t*)pxBlockToInsert)
    {
        pxIterator->xBlockSize+=pxBlockToInsert->xBlockSize;
        pxBlockToInsert=pxIterator;
    }
    else
    {
        mtCOVERAGE_TEST_MARKER();
    }
    puc=(uint8_t*)pxBlockToInsert;
    if(puc+pxBlockToInsert->xBlockSize==(uint8_t*)pxIterator->pxNextFreeBlock)
    {
        if(pxIterator->pxNextFreeBlock!=pxEnd)
        {
            pxBlockToInsert->xBlockSize+=pxIterator->pxNextFreeBlock->xBlockSize;
            pxBlockToInsert->pxNextFreeBlock=pxIterator->pxNextFreeBlock->pxNextFreeBlock;
        }
        else
        {
            pxBlockToInsert->pxNextFreeBlock=pxEnd;
        }
    }
    else
    {
        pxBlockToInsert->pxNextFreeBlock=pxIterator->pxNextFreeBlock;
    }
    if(pxIterator!=pxBlockToInsert)//This only happens when a forward merge occurs!
    {
        pxIterator->pxNextFreeBlock=pxBlockToInsert;
    }
}
void *pvPortMalloc(size_t xWantedSize)
{
    BlockLink_t *pxBlock,*pxPreviousBlock,*pxNewBlockLink;
    void* pvReturn=NULL;
    vTaskSuspendAll();
    {
        if(pxEnd==NULL)
        {
            prvHeadInit();
        }
        else
        {
            mtCOVERAGE_TEST_MARKER();
        }
        if((xWantedSize & xBlockAllocatedBit)==0)
        {
            if(xWantedSize>0)
            {
                xWantedSize+=xHeapStructSize;
                if( (xWantedSize & portBYTE_ALIGNMENT_MASK) !=0x00)
                {
                    xWantedSize+=(portBYTE_ALIGNMENT-(xWantedSize & portBYTE_ALIGNMENT_MASK));
                    //configASSERT((xWantedSize & portBYTE_ALIGNMENT_MASK)==0);
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
            if(xWantedSize>0 && xWantedSize<=xFreeBytesRemaining)
            {
                pxPreviousBlock=&xStart;
                pxBlock=pxPreviousBlock->pxNextFreeBlock;
                while (pxBlock->xBlockSize<xWantedSize && pxBlock->pxNextFreeBlock!=NULL)
                {
                    pxPreviousBlock=pxBlock;
                    pxBlock=pxBlock->pxNextFreeBlock;

                }
                if(pxBlock!=pxEnd)
                {
                    pvReturn=(void*)(((uint8_t*)pxPreviousBlock->pxNextFreeBlock) + xHeapStructSize);
                    pxPreviousBlock->pxNextFreeBlock=pxBlock->pxNextFreeBlock;
                    if((pxBlock->xBlockSize-xWantedSize)>heapMINIMUM_BLOCK_SIZE)
                    {
                        pxNewBlockLink=(void*)(((uint8_t*)pxBlock)+xWantedSize);
                        //configASSERT( ( ( ( size_t ) pxNewBlockLink ) & portBYTE_ALIGNMENT_MASK ) == 0 );
                        pxNewBlockLink->xBlockSize=pxBlock->xBlockSize-xWantedSize;
                        pxBlock->xBlockSize=xWantedSize;
                        prvInsertBlockIntoFreeList( pxNewBlockLink );
                    }
                }
                else
                {
                     mtCOVERAGE_TEST_MARKER();
                }
                xFreeBytesRemaining-=pxBlock->xBlockSize;
                if(xFreeBytesRemaining<xMinimumEverFreeBytesRemaining)
                {
                    xFreeBytesRemaining=xMinimumEverFreeBytesRemaining;
                }
                else
                {
                    mtCOVERAGE_TEST_MARKER();
                }
                pxBlock->xBlockSize |=xBlockAllocatedBit;
                pxBlock->pxNextFreeBlock=NULL;
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
        //traceMALLOC( pvReturn, xWantedSize );
    }
   
    ( void ) xTaskResumeAll();
 

    #if( configUSE_MALLOC_FAILED_HOOK == 1 )
	{
		if( pvReturn == NULL )
		{
			extern void vApplicationMallocFailedHook( void );
			vApplicationMallocFailedHook();
		}
		else
		{
			mtCOVERAGE_TEST_MARKER();
		}
	}
	#endif
    //configASSERT( ( ( ( size_t ) pvReturn ) & ( size_t ) portBYTE_ALIGNMENT_MASK ) == 0 );
    return pvReturn;
}
void vPortFree( void *pv )
{
    uint8_t *puc=(uint8_t*)pv;
    BlockLink_t *pxLink;
    if(pv!=NULL)
    {
        puc -= xHeapStructSize;
        pxLink=(void* )puc;
        //configASSERT( ( pxLink->xBlockSize & xBlockAllocatedBit ) != 0 );
		//configASSERT( pxLink->pxNextFreeBlock == NULL );
        if((pxLink->xBlockSize & xBlockAllocatedBit)!=0)
        {
            if(pxLink->pxNextFreeBlock==NULL)
            {
                pxLink->xBlockSize &=~xBlockAllocatedBit;
                vTaskSuspendAll();
                {
                    xFreeBytesRemaining+=pxLink->xBlockSize;
                    //traceFREE( pv, pxLink->xBlockSize );
                    prvInsertBlockIntoFreeList(((BlockLink_t*)pxLink));
                }
            (void)xTaskResumeAll();
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
    
}