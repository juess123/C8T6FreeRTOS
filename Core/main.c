

#include "../Inc/event_groups.h"
#include "../Inc/OLED.h"
#define BIT_0 (1 << 0)

static EventGroupHandle_t xTestEventGroup = NULL;

void vTaskA(void *pvParameters)
{
    EventBits_t uxBits;
    OLED_ShowChar(4,1,'o');
    uxBits = xEventGroupWaitBits(
        xTestEventGroup,  // 等待的事件组
        BIT_0,            // 要等待的事件位
        pdTRUE,           // 满足后清除事件位
        pdTRUE,           // 等待所有位（这里只有 BIT_0）
        5000 // 最多等 5 秒
    );
    if ((uxBits & BIT_0) != 0)
    {
       
        OLED_ShowChar(1,1,'s');
    }
    else
    {
        OLED_ShowChar(2,1,'t');
    }
    while(1)
    {
        vTaskDelay(2000);
    }
}

// 任务 B：延迟一段时间后设置 BIT_0
void vTaskB(void *pvParameters)
{           
    EventBits_t a;
    a=xEventGroupSetBits(xTestEventGroup, BIT_0);
    while(1)
    {
        vTaskDelay(1000);
    }
}

int main(void)
{
    OLED_Init();
    xTestEventGroup = xEventGroupCreate();
    xTaskCreate(vTaskA, "TaskA", 256, NULL, 1, NULL);
    xTaskCreate(vTaskB, "TaskB", 256, NULL, 2, NULL);
    vTaskStartScheduler();
    for (;;);
}
