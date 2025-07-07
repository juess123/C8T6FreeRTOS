#include "../Inc/stm32f10x.h"
#include "../Inc/OLED.h"
void uart1_init(void)
{
    RCC->APB2ENR |=(1<<2);
    RCC->APB2ENR |=(1<<14);

    GPIOA->CRH &= ~(0xf<<4);
    GPIOA->CRH |= (0xb<<4);

    GPIOA->CRH &= ~(0xF << 8);
    GPIOA->CRH |=  (0x4 << 8); 

    USART1->BRR =(468<<4)|12;

    USART1->CR1 |=(1<<13);
    USART1->CR1 |=(1<<3);
    USART1->CR1 |= (1 << 2);    
}
void uart1_send_char(char c)
{
    while (!(USART1->SR & (1 << 7))); // 等待 TXE = 1，数据寄存器空
    USART1->DR = c;
}
char uart1_recv_char(void)
{
    while (!(USART1->SR & (1 << 5))); // 等待 RXNE = 1
    return USART1->DR;                // 读取接收到的数据
}
void HardFault_Handler(void)
{
    OLED_ShowChar(4,1,'e');
}
int main(void)
{
    OLED_Init();
    uart1_init();

    
    uint32_t i=0;
    char p[16]={0};
    char* s="Readyhessd";
    char c =0;
    while (*s)
    {
        uart1_send_char(*s++);
        c = uart1_recv_char();
        p[i++]=c;
    }
    OLED_ShowString(1,1,p);
    while(1);
   
}