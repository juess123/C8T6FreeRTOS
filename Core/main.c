#include "../Inc/stream_buffer.h"

#include "../Inc/OLED.h"

StreamBufferHandle_t xMessageBuffer;

void vSenderTask(void *pvParameters)
{
    const TickType_t xDelay = 100;
    char* p="Stream buffers execute a callback upon completion of each send and receive operation Stream buffers created using the xStreamBufferCreate API share the same send and receive completed callback functions which are defined using ";
    size_t sent,i=0;
    while (1)
    {
        if( i<200) 
        {
            sent = xStreamBufferSend(xMessageBuffer,p,12,100);
            i+=12;
            p+=12;
        }
        else
        {
            OLED_ShowNum(1,1,i,3);
            vTaskSuspend(NULL);
        }
        if (sent > 0)
        {
            OLED_ShowNum(2,1,sent,4);
        }
        vTaskDelay(xDelay);
    }
}
void vReceiverTask(void *pvParameters)
{
    char recvBuffer[13] = {0};

    while (1)
    {
        size_t received = xStreamBufferReceive(xMessageBuffer,recvBuffer,12,100);
        if (received > 0)
        {
            OLED_ShowString(3,1,recvBuffer);   
        }
        vTaskDelay(200);
    }
}
void HardFault_Handler(void)
{
    OLED_ShowChar(4,1,'e');
    for(;;);
}
int main(void)
{

    OLED_Init();
    xMessageBuffer=xStreamBufferGenericCreate(64, 4, sbFLAGS_IS_MESSAGE_BUFFER, NULL, NULL);
    if (xMessageBuffer == NULL)
    {
        OLED_ShowNum(4,15,1,1);
        while (1);
    }
    xTaskCreate(vSenderTask, "Sender", 512, NULL, 2, NULL);
    xTaskCreate(vReceiverTask, "Receiver", 256, NULL, 1, NULL);
    vTaskStartScheduler();
    for (;;);
}
