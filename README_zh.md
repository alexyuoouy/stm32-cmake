# stm32-cmake
简单的 cmake 工程模板。

* ## 主要流程
  * 设置arm工具链路径及编译选项。
  * 设置stm32 芯片类型。
  * 设置编译类型(Debug/Release)。
  * 设置头文件路径。
  * 搜索所有源文件并过滤无用文件。
  * 编译并链接。
  * 执行对目标文件后续处理的一些命令。

* ## 怎样使用？
  * 首先在stm32-cmake目录下创建 "src" 目录， 将原有的工程中所有文件拷到 "src" 目录下。
  * 修改cmake/gcc-arm-none-eabi.cmake 中的STM32_TOOLCHAIN_PATH变量，或在执行cmake命令的时候添加 -DSTM32_TOOLCHAIN_PATH=/your/arm/toolchain/path 选项。
  * 修改cmake/stm32.cmake 文件中芯片类型和一些芯片相关的编译选项。
  * 修改cmake/stm32-gcc-flags.cmake 文件中ASM C CPP 编译选项。
  * 按需修改cmake/stm32-gcc-postbuild.cmake 文件中的命令。
  * 在CMakeLists.txt中，修改CMAKE_BUILD_TYPE，添加头文件路径，添加过滤规则，添加链接选项，如果有库需要链接则使能链接库。
  * 在stm32-cmake目录下创建build目录并进入。
  * 输入命令:
  ```
  cmake ..
  make
  ```
  * 在cmake命令中指定 STM32_TOOLCHAIN_PATH 和 CMAKE_BUILD_TYPE:
  ```
  cmake -DSTM32_TOOLCHAIN_PATH=/your/arm/toolchain/path -DCMAKE_BUILD_TYPE=Debug ..
  make
  ```
  * 在编译时显示编译细节来调试cmake:
  ```
  cmake ..
  make VERBOSE=1
  ```
> 注意：不同编译器的cmsis库和链接脚本会有所区别，移植时需要注意。

