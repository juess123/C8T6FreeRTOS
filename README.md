# STM32FreeRTOS

A lightweight, custom-built Real-Time Operating System (RTOS) designed for the STM32F103C8T6 microcontroller.  
This project was inspired by the structure and scheduling principles of FreeRTOS, with handcrafted core logic tailored to embedded systems.

---

## 🚀 Features

- Simple task scheduler (preemptive or cooperative)
- Tick-based timing mechanism
- Context switching via PendSV
- Software-based memory management
- Critical section and interrupt masking
- Task delay and sleep
- Basic synchronization mechanisms (semaphore, event group, etc.)

---

## 🔧 Target Platform

- **MCU:** STM32F103C8T6 (Cortex-M3)
- **Toolchain:** Makefile
- **Language:** C, with optional ARM Thumb Assembly

---

## 🔨 How to Build

```bash
# OLED模块代码来自江科大开源项目，已做适配
make flash    # 烧录程序到 STM32 板子  
make clean    # 清除所有编译生成的中间文件  


