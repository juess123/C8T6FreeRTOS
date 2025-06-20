inc =$(shell find Src -name *.c)
core =$(shell find Core -name *.c)
inc_obj =$(patsubst Src/%.c,Build/%.o,$(inc))
core_obj =$(patsubst Core/%.c,Build/%.o,$(core))
obj = Build/startup_stm32f10x_md.o $(inc_obj) $(core_obj)

Build/%.o :  Src/%.c
	@arm-none-eabi-gcc -g -mthumb -mcpu=cortex-m3 -c $^ -o $@
Build/%.o :  Core/%.c
	@arm-none-eabi-gcc -g -mthumb -mcpu=cortex-m3 -c $^ -o $@
Build/startup_stm32f10x_md.o : Config/startup_stm32f10x_md.s
	@arm-none-eabi-gcc -g -mthumb -mcpu=cortex-m3 -c Config/startup_stm32f10x_md.s -o Build/startup_stm32f10x_md.o 
Compile : $(obj)
	@arm-none-eabi-gcc -g -O0 -o Build/exec.elf $^ -mthumb -mcpu=cortex-m3 -T Config/stm32_flash.ld -static -Wl,-cref,-u,Reset_Handler -Wl,-Map=Build/test.map -Wl,--gc-sections
Bin : Compile
	@arm-none-eabi-objcopy Build/exec.elf -O binary Build/exec.bin
Run : Bin
	@st-flash write ./Build/exec.bin 0x08000000 
Clear :
	rm -rf ./Build/*



## arm-none-eabi-objdump -d -S ./Build/exec.elf > output.asm
## -g 生成调试信息
## -O0 禁用优化，通常用于调试阶段，以便更清晰地跟踪代码
## -o Build/exec.elf 指定输出文件名
## -mthumb 生成适合 ARM Cortex-M 处理器的 Thumb 指令集代码
## -mcpu=cortex-m3 指定目标处理器的架构
## -T Config/stm32_flash.ld 指定链接脚本
## -static 静态链接，意味着所有的库都被静态链接进可执行文件
## -Wl,-cref,-u,Reset_Handler 传递给链接器的选项 -cref：生成引用的符号信息（通常是调试用途）-u,Reset_Handler：指示链接器 Reset_Handler 是一个未定义符号，应该使用它作为程序的入口。
## -Wl,-Map=Build/test.map 生成链接映射文件，用于查看符号和地址分配。
## -Wl,--gc-sections 启用垃圾回收，去除未使用的代码和数据