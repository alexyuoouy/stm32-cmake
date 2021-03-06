# set mcu flags
set(MCU_FLAGS "${MCU} -D${STM32_TYPE}")

# use hal library
if(NOT USE_HAL_DRIVER)
	set(USE_HAL_DRIVER "-DUSE_HAL_DRIVER")
endif()

# compiler: language specific flags
set(CMAKE_C_FLAGS "${MCU_FLAGS} ${USE_HAL_DRIVER} -std=gnu11 -Wall -fdata-sections -ffunction-sections -fstack-usage --specs=nano.specs" CACHE INTERNAL "C compiler flags")
set(CMAKE_C_FLAGS_DEBUG "-DDEBUG -g3 -O0 " CACHE INTERNAL "C compiler flags: Debug")
set(CMAKE_C_FLAGS_RELEASE "-Os" CACHE INTERNAL "C compiler flags: Release")

set(CMAKE_CXX_FLAGS "${MCU_FLAGS} ${USE_HAL_DRIVER} -std=gnu++14 -fno-exceptions -fdata-sections -ffunction-sections -fno-rtti -fno-use-cxa-atexit -Wall -femit-class-debug-always -fstack-usage --specs=nano.specs" CACHE INTERNAL "Cxx compiler flags")
set(CMAKE_CXX_FLAGS_DEBUG "-DDEBUG -g3 -O0 " CACHE INTERNAL "Cxx compiler flags: Debug")
set(CMAKE_CXX_FLAGS_RELEASE "-Os" CACHE INTERNAL "Cxx compiler flags: Release")

set(CMAKE_ASM_FLAGS "${MCU_FLAGS} -x assembler-with-cpp --specs=nano.specs" CACHE INTERNAL "ASM compiler flags")
set(CMAKE_ASM_FLAGS_DEBUG "-g3" CACHE INTERNAL "ASM compiler flags: Debug")
set(CMAKE_ASM_FLAGS_RELEASE "" CACHE INTERNAL "ASM compiler flags: Release")

