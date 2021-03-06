#********************************************************************
#        _       _         _
#  _ __ | |_  _ | |  __ _ | |__   ___
# | '__|| __|(_)| | / _` || '_ \ / __|
# | |   | |_  _ | || (_| || |_) |\__ \
# |_|    \__|(_)|_| \__,_||_.__/ |___/
#
# www.rt-labs.com
# Copyright 2017 rt-labs AB, Sweden.
#
# This software is dual-licensed under GPLv3 and a commercial
# license. See the file LICENSE.md distributed with this software for
# full license information.
#*******************************************************************/

# Guard against multiple inclusion
if(_RT_KERNEL_XMC4_CMAKE_)
  return()
endif()
set(_RT_KERNEL_XMC4_CMAKE_ TRUE)

# the name of the target operating system
set(CMAKE_SYSTEM_NAME rt-kernel)

set(CROSS_PREFIX arm-eabi)
set(ARCH xmc4)
set(CPU cortex-m4f)

if (NOT DEFINED ENV{COMPILERS})
  set(ENV{COMPILERS} /opt/rt-tools/compilers)
endif()

set(CMAKE_C_COMPILER $ENV{COMPILERS}/${CROSS_PREFIX}/bin/${CROSS_PREFIX}-gcc)
set(CMAKE_CXX_COMPILER ${CMAKE_C_COMPILER})
if(CMAKE_HOST_WIN32)
  set(CMAKE_C_COMPILER ${CMAKE_C_COMPILER}.exe)
  set(CMAKE_CXX_COMPILER ${CMAKE_CXX_COMPILER}.exe)
endif(CMAKE_HOST_WIN32)

list(APPEND MACHINE
  -mcpu=cortex-m4
  -mthumb
  -mfloat-abi=hard
  -mfpu=fpv4-sp-d16
  )

add_definitions(${MACHINE})
add_link_options(${MACHINE})
