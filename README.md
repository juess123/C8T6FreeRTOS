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

## 安装必备工具

```bash
sudo apt update
sudo apt install gcc-arm-none-eabi
sudo apt install gdb-multiarch
sudo apt install openocd
sudo apt install stlink-tools
sudo apt install make
