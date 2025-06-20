#include "../Inc/stm32f10x.h"                  // Device header
#include "../Inc/OLED.h"
#include "../Inc/task.h"
TaskHandle_t T1,T2,T3;
extern int temp;
void TestFunc1(void* parameters)
{
	uint32_t i=0;
    while(1)
	{
		i++;
		OLED_ShowNum(1,1,i,4);
		
		vTaskDelay(20);	
	}
}

void TestFunc2(void* parameters)
{
	uint32_t i=0;
	
	while(1)
    {
		i++;
        OLED_ShowHexNum(4,1,i,4);
		
        vTaskDelay(20);
    } 
}
void HardFault_Handler(void)
{
	char a='A';
	OLED_ShowHexNum(3,8,a,4);
}
int main(void)
{
	int a=0;
	OLED_Init();
	//xTaskCreate(TestFunc1, "test1", 256, NULL, 1, &T1);
	xTaskCreate(TestFunc2, "test2", 128, NULL, 2, &T2);
	TCB_t* P=(TaskHandle_t)T2;
	OLED_ShowHexNum(1,1,(uint32_t)P->pxTopOfStack,8);
	OLED_ShowHexNum(2,1,(uint32_t)P,8);
	// OLED_ShowHexNum(4,8,(uint32_t)P->pxStack,8);
	
	vTaskStartScheduler();
	while(1);
}
	