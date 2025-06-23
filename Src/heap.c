#include "../Inc/heap.h"
static BlockLink_t xStart, *pxEnd = NULL;
static const unsigned int xHeapStructSize	= ( sizeof( BlockLink_t ) + ( ( unsigned int ) ( portBYTE_ALIGNMENT - 1 ) ) ) & ~( ( unsigned int ) portBYTE_ALIGNMENT_MASK );
static unsigned int xFreeBytesRemaining = 0U;
static unsigned int xMinimumEverFreeBytesRemaining = 0U;
static unsigned int xBlockAllocatedBit = 0;
static unsigned char ucHeap[ 10*1024 ];
void *memset(void *dstpp, int c, unsigned int len)
{
    unsigned int dstp = (unsigned int)dstpp;
    if (len >= 4)
    {
        unsigned int xlen;
        unsigned int cccc;
        cccc = (unsigned char)c;
        cccc |= cccc << 8;
        cccc |= cccc << 16;
        xlen = len / 32;
        while (xlen-- > 0)
        {
            ((unsigned int *)dstp)[0] = cccc;
            ((unsigned int *)dstp)[1] = cccc;
            ((unsigned int *)dstp)[2] = cccc;
            ((unsigned int *)dstp)[3] = cccc;
            ((unsigned int *)dstp)[4] = cccc;
            ((unsigned int *)dstp)[5] = cccc;
            ((unsigned int *)dstp)[6] = cccc;
            ((unsigned int *)dstp)[7] = cccc;
            dstp += 32;
        }
        xlen = (len % 32) / 4;
        while (xlen-- > 0)
        {
            ((unsigned int *)dstp)[0] = cccc;
            dstp += 4;
        }
    }
    return dstpp;
}
void* memcpy(void* dstpp, const void* srcpp, unsigned int len)
{
    unsigned int dstp = (unsigned int)dstpp;
    unsigned int srcp = (unsigned int)srcpp;

    if (len >= 4)
    {
        unsigned int nwords = len / 4;
        while (nwords--)
        {
            *(unsigned int*)dstp = *(unsigned int*)srcp;
            dstp += 4;
            srcp += 4;
        }
        len %= 4;
    }
    while (len--)
    {
        *(unsigned char*)dstp = *(unsigned char*)srcp;
        dstp += 1;
        srcp += 1;
    }
    return dstpp;
}

void prvHeadInit(void)
{
    BlockLink_t *pxFirstFreeBlock;
    unsigned char *pucAlignedHead;
    unsigned int uxAddress;
    unsigned int xTotalHeadSize=(unsigned int)10*1024;
    uxAddress=(unsigned int)ucHeap;
    memset(ucHeap, 0, 10*1024);
    if((uxAddress & 0x007)!=0)
    {
        uxAddress+=(8-1);
        uxAddress&=~((unsigned int)0x007);
        xTotalHeadSize-=uxAddress-(unsigned int)ucHeap;
    }
    
    pucAlignedHead=(unsigned char*)uxAddress;

    xStart.pxNextFreeBlock=(void*)pucAlignedHead;// void*  or BlockLink_t
    xStart.xBlockSize=(unsigned int)0;

    uxAddress=(unsigned int)pucAlignedHead+xTotalHeadSize;
    uxAddress-=xHeapStructSize;
    uxAddress &=~((unsigned int)portBYTE_ALIGNMENT_MASK);

    pxEnd=(void*)uxAddress;
    pxEnd->xBlockSize=(unsigned int)0;
    pxEnd->pxNextFreeBlock=NULL;

    pxFirstFreeBlock=(void*)pucAlignedHead;
    pxFirstFreeBlock->xBlockSize=uxAddress-(unsigned int)pxFirstFreeBlock;
    pxFirstFreeBlock->pxNextFreeBlock=pxEnd;

    xMinimumEverFreeBytesRemaining = pxFirstFreeBlock->xBlockSize;
	xFreeBytesRemaining = pxFirstFreeBlock->xBlockSize;

    xBlockAllocatedBit=((unsigned int) 1)<< (sizeof(unsigned int)*heapBITS_PER_BYTE-1);
    
}
void prvInsertBlockIntoFreeList( BlockLink_t *pxBlockToInsert )
{
    BlockLink_t* pxIterator;
    unsigned char *puc;
    for(pxIterator=&xStart;pxIterator->pxNextFreeBlock<pxBlockToInsert;pxIterator=pxIterator->pxNextFreeBlock)
    {

    };
    puc=(unsigned char*)pxIterator;
    if(puc+pxIterator->xBlockSize==(unsigned char*)pxBlockToInsert)
    {
        pxIterator->xBlockSize+=pxBlockToInsert->xBlockSize;
        pxBlockToInsert=pxIterator;
    }
    else
    {
        mtCOVERAGE_TEST_MARKER();
    }
    puc=(unsigned char*)pxBlockToInsert;
    if(puc+pxBlockToInsert->xBlockSize==(unsigned char*)pxIterator->pxNextFreeBlock)
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

void *pvPortMalloc(unsigned int xWantedSize)
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
                    pvReturn=(void*)(((unsigned char*)pxPreviousBlock->pxNextFreeBlock) + xHeapStructSize);
                    pxPreviousBlock->pxNextFreeBlock=pxBlock->pxNextFreeBlock;
                    if((pxBlock->xBlockSize-xWantedSize)>heapMINIMUM_BLOCK_SIZE)
                    {
                        pxNewBlockLink=(void*)(((unsigned char*)pxBlock)+xWantedSize);
                        //configASSERT( ( ( ( unsigned int ) pxNewBlockLink ) & portBYTE_ALIGNMENT_MASK ) == 0 );
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
    return pvReturn;
}
void vPortFree( void *pv )
{
    unsigned char *puc=(unsigned char*)pv;
    BlockLink_t *pxLink;
    if(pv!=NULL)
    {
        puc -= xHeapStructSize;
        pxLink=(void* )puc;
        if((pxLink->xBlockSize & xBlockAllocatedBit)!=0)
        {
            if(pxLink->pxNextFreeBlock==NULL)
            {
                pxLink->xBlockSize &=~xBlockAllocatedBit;
                vTaskSuspendAll();
                {
                    xFreeBytesRemaining+=pxLink->xBlockSize;
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