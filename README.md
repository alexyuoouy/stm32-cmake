# stm32-cmake
[中文页](README_zh.md) |

A simple stm32 cmake project template.
* ## Main process
  * Set compiler path and flags.
  * Set stm32 chip type.
  * Set buid type (Debug/Release).
  * Set include directories path.
  * Find all source file and filter out unnessary file.
  * Complie and link.
  * Postbuild command.

* ## How to use
  * Create "src" directory in stm32-cmake, amd put your project in "src".
  * Modify STM32_TOOLCHAIN_PATH in cmake/gcc-arm-none-eabi.cmake or add -DSTM32_TOOLCHAIN_PATH=/your/arm/toolchain/path to cmake command.
  * Modify your chip type and chip flags in cmake/stm32.cmake.
  * Modify ASM C CPP compiler flags in cmake/stm32-gcc-flags.cmake.
  * Modify postbuild command in cmake/stm32-gcc-postbuild.cmake.
  * In CMakeLists.cmake, modify CMAKE_BUILD_TYPE, add include path, add filter rule, add linker flags and add libraries if you need.
  * Create build directory in stm32-cmake, change current directory to build.
  * Input follow command:
  ```
  cmake ..
  make
  ```
  * Maybe you want to modify STM32_TOOLCHAIN_PATH and CMAKE_BUILD_TYPE in cmake command:
  ```
  cmake -DSTM32_TOOLCHAIN_PATH=/your/arm/toolchain/path -DCMAKE_BUILD_TYPE=Debug ..
  make
  ```
  * Maybe you want to show build detail:
  ```
  cmake ..
  make VERBOSE=1
  ```
