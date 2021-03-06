# override link command
set(CMAKE_C_LINK_EXECUTABLE "<CMAKE_C_COMPILER> <CMAKE_C_LINK_FLAGS> <LINK_FLAGS> <OBJECTS> -o <TARGET> <LINK_LIBRARIES>")
set(CMAKE_CXX_LINK_EXECUTABLE "<CMAKE_CXX_COMPILER> <CMAKE_CXX_LINK_FLAGS> <LINK_FLAGS> <OBJECTS> -o <TARGET> <LINK_LIBRARIES>")
cmake_minimum_required(VERSION 3.0.0)

include(cmake/gcc-arm-none-eabi.cmake)
include(cmake/stm32.cmake)

project(tooldetective C CXX ASM)

# set building type
if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Debug)
endif(NOT CMAKE_BUILD_TYPE)

if(CMAKE_BUILD_TYPE MATCHES Debug)
  message(STATUS "Build type: Debug")
elseif(CMAKE_BUILD_TYPE MATCHES Release)
  message(STATUS "Build type: Release")
endif()
include(cmake/stm32-gcc-flags.cmake)

# set include directories
include_directories(
	${CMAKE_CURRENT_SOURCE_DIR}/src/Core/Inc







		)

# find all c cpp asm file
set(ALL_SRC)
set(CPP_SRC)
file(GLOB_RECURSE CPP_SRC ${CMAKE_CURRENT_SOURCE_DIR}/src/*.cpp)
list(APPEND ALL_SRC ${CPP_SRC})
set(C_SRC)
file(GLOB_RECURSE C_SRC ${CMAKE_CURRENT_SOURCE_DIR}/src/*.c)
list(APPEND ALL_SRC ${C_SRC})
set(ASM_SRC)
file(GLOB_RECURSE ASM_SRC ${CMAKE_CURRENT_SOURCE_DIR}/src/*.s)
list(APPEND ALL_SRC ${ASM_SRC})


# set filter file
set(FILTER_SRC
	""






	)

# filter out unnesessary file
foreach(SRC ${ALL_SRC})
	#message(STATUS "${SRC}")
	foreach(FILTER_ITEM ${FILTER_SRC})
		if(${SRC} MATCHES ${FILTER_ITEM}*)
			message(STATUS "filter out: ${SRC}")
			list(REMOVE_ITEM ALL_SRC ${SRC})
        	endif()
	endforeach()
endforeach()

message(STATUS "after filter, list src:")
foreach(SRC ${ALL_SRC})
	message(STATUS "${SRC}")
endforeach()

#message(STATUS "All src: " ${ALL_SRC})

add_executable(${PROJECT_NAME}.elf ${ALL_SRC})
target_link_options(${PROJECT_NAME}.elf 
	PRIVATE 


	)
# enable if you need to link some libraries
#target_link_libraries(${PROJECT_NAME}.elf 
#	PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/src/lib.a"
#	)

# execute some postbuild command
include(cmake/stm32-gcc-postbuild.cmake)
