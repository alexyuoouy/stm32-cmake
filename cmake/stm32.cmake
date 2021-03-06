set(STM32_SERIAL STM32F4)
set(STM32_FAMILY STM32F429)
set(STM32_TYPE STM32F429xx)
set(STM32_NAME STM32F429II)

set(CPU -mcpu=cortex-m4)
set(FPU -mfpu=fpv4-sp-d16)
set(FLOAT_ABI -mfloat-abi=hard)
set(MCU "${CPU} -mthumb ${FPU} ${FLOAT_ABI}")


