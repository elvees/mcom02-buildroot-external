#
# Copyright 2019 RnD Center "ELVEES", JSC
#

set(TRIPLE elcore-elvis-elf)
set(CMAKE_TOOLCHAIN_SYSTEM_NAME Generic)
set(CMAKE_TOOLCHAIN_SYSTEM_PROCESSOR elcore)
set(CMAKE_TOOLCHAIN_SYSTEM_TARGET ${TRIPLE})

# CMake determines if we are cross-compiling by looking at CMAKE_SYSTEM_NAME
# after including this file. This is done in CMakeDetermineSystem.cmake.
# If CMAKE_SYSTEM_NAME is set then it is supposed that we are cross-compiling
# and CMake sets CMAKE_CROSSCOMPILING. Otherwise it resets CMAKE_SYSTEM_* by
# host system values.
if(NOT CMAKE_HOST_SYSTEM_PROCESSOR STREQUAL CMAKE_TOOLCHAIN_SYSTEM_PROCESSOR OR
    NOT CMAKE_HOST_SYSTEM_NAME STREQUAL CMAKE_TOOLCHAIN_SYSTEM_NAME)
    # In this case we are cross-compiling
    set(CMAKE_SYSTEM_NAME      ${CMAKE_TOOLCHAIN_SYSTEM_NAME})
    set(CMAKE_SYSTEM_PROCESSOR ${CMAKE_TOOLCHAIN_SYSTEM_PROCESSOR})
    set(CMAKE_SYSTEM_TARGET    ${CMAKE_TOOLCHAIN_SYSTEM_TARGET})

    # We use only libraries in CMAKE_FIND_ROOT_PATH and don't use any binaries
    set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
    set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
    set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
    set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)
endif()

# If CMAKE_FIND_ROOT_PATH_MODE_* are not set find_something() behaves as is
# case when they are BOTH.

get_filename_component(CMAKE_TOOLCHAIN_PREFIX "${CMAKE_CURRENT_LIST_DIR}/../../" ABSOLUTE)

# Add .exe suffix for Win tools
if(WIN32)
    set(EXTENSION ".exe")
else()
    set(EXTENSION "")
endif()

set(CMAKE_C_COMPILER "${CMAKE_TOOLCHAIN_PREFIX}/bin/clang${EXTENSION}")
set(CMAKE_CXX_COMPILER "${CMAKE_TOOLCHAIN_PREFIX}/bin/clang++${EXTENSION}")

# Read "Modules/CMakeFindBinUtils.cmake" to see how this variables are used.
set(_CMAKE_TOOLCHAIN_PREFIX "${CMAKE_TOOLCHAIN_SYSTEM_TARGET}-")
set(CMAKE_C_COMPILER_EXTERNAL_TOOLCHAIN "${CMAKE_TOOLCHAIN_PREFIX}")
set(CMAKE_CXX_COMPILER_EXTERNAL_TOOLCHAIN "${CMAKE_TOOLCHAIN_PREFIX}")

list(APPEND CMAKE_FIND_ROOT_PATH ${CMAKE_TOOLCHAIN_PREFIX}/${CMAKE_TOOLCHAIN_SYSTEM_TARGET})

set(MCPU_VER "elcore30")
set(DSP_ARCH "cx11")
set(DSP_LIBS_PATH "${CMAKE_TOOLCHAIN_PREFIX}/${TRIPLE}/lib")
set(DSP_LIBS "-lc++,-lc++abi,-lc,-lm,-lunwind,-lcrt,-lsim")

set(DSP_INCLUDE_FLAGS "-I${CMAKE_TOOLCHAIN_PREFIX}/${TRIPLE}/include"
                      "-I${CMAKE_TOOLCHAIN_PREFIX}/${TRIPLE}/include/c++/v1")
set(DSP_LINKER_FLAGS "-Wl,-e0,-t,-N,-L${DSP_LIBS_PATH},${DSP_LIBS}")
set(DSP_ASM_FLAGS "-Wa,-m${DSP_ARCH},-gstabs,-Wdojb-force-long,-W")
set(DSP_OPTIMIZTION_FLAGS "-mllvm -elcore-enable-delay-filler -mllvm"
                          "-elcore-use-indexed-loadstore -v")
#set(DSP_FLAGS "-target elcore -O3 -mcpu=${MCPU_VER} -D_ELCODE_DSP_ -fno-tree-vectorize")
set(DSP_FLAGS "-target elcore -O3 -mcpu=${MCPU_VER} -D_ELCODE_DSP_")
set(DSP_FLAGS "${DSP_FLAGS} -D_LIBCPP_HAS_NO_THREADS")
set(DSP_FLAGS "${DSP_FLAGS} ${DSP_INCLUDE_FLAGS}")
set(DSP_FLAGS "${DSP_FLAGS} -DSTACK_SIZE=0x81000")
set(DSP_FLAGS "${DSP_FLAGS} ${DSP_ASM_FLAGS}")
set(DSP_FLAGS "${DSP_FLAGS} ${DSP_LINKER_FLAGS}")
set(DSP_FLAGS "${DSP_FLAGS} ${DSP_OPTIMIZTION_FLAGS}")
set(DSP_FLAGS "${DSP_FLAGS} -B ${CMAKE_TOOLCHAIN_PREFIX}/bin")

set(CMAKE_C_FLAGS "${DSP_FLAGS}" CACHE STRING "")
set(CMAKE_CXX_FLAGS "${CMAKE_C_FLAGS}" CACHE STRING "")
