# ---------------------------------------------------------------------------- #
# yaccs config file for windows / mingw gcc / base
#
# Nicolas Clauvelin (n.clauvelin+code@gmail.com)
# nicocvn.com, 2019
#
#
# MODULE:   yaccs
#
# MANIFEST:
#   Platform:       windows
#   Compiler:       mingw gcc
#   - Minimal C/C++ flags for all build types.
#   - Apply dead code optimization to all build types except Debug
#   - Enable LTO
#
# ---------------------------------------------------------------------------- #


# Guard.
if(DEFINED WINDOWS_MINGW_GCC_BASE)
    return()
endif()
set(WINDOWS_MINGW_GCC_BASE 1)


# yaccs module.
if (NOT _yaccs_main_dir)
    set(_yaccs_main_dir ${CMAKE_CURRENT_LIST_DIR}/..)
endif()
include(${_yaccs_main_dir}/yaccs.cmake)


# Guard.
if(DEFINED __yaccs_config_file_loaded)
    yaccs_fatal_error_message("Trying to load ${CMAKE_CURRENT_LIST_FILE} ... Only a single config file can be loaded")
    return()
endif()
set(__yaccs_config_file_loaded 1)


# Platform.
include(${_yaccs_main_dir}/platform/windows.cmake)

# Compiler.
include(${_yaccs_main_dir}/compiler/mingw-gcc.cmake)

# Flags.
include(${_yaccs_main_dir}/flags/gcc-base-flags.cmake)
#
include(${_yaccs_main_dir}/flags/debug-levels.cmake)
#
include(${_yaccs_main_dir}/flags/LTO.cmake)
include(${_yaccs_main_dir}/flags/dead-code.cmake)
include(${_yaccs_main_dir}/flags/gcc-strip.cmake)
#
# Gold linker appears to be broken in MinGW ... linker flags are all over the
# place.
#include(${_yaccs_main_dir}/flags/gcc-gold-linker.cmake)
#
# Sanitizers are not available on windows.
