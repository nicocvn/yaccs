# ---------------------------------------------------------------------------- #
# yaccs config file for windows / clang-cl / base
#
# Nicolas Clauvelin (n.clauvelin+code@gmail.com)
# nicocvn.com, 2019
#
#
# MODULE:   yaccs
#
# MANIFEST:
#   Platform:       windows
#   Compiler:       clang-cl
#   - Minimal C/C++ flags for all build types.
#   - Enable LTO
#
# ---------------------------------------------------------------------------- #


# Guard.
if(DEFINED WINDOWS_CLANG_CL_BASE)
    return()
endif()
set(WINDOWS_CLANG_CL_BASE 1)


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
include(${_yaccs_main_dir}/compiler/clang-cl.cmake)

# Flags.
include(${_yaccs_main_dir}/flags/clang-cl-base-flags.cmake)
#
include(${_yaccs_main_dir}/flags/LTO.cmake)

# Sanitizers ...
# These flags can work on Windows but linker flags have to be adjusted. This is
# currently not supported.
# Ref: https://github.com/google/sanitizers/wiki/AddressSanitizerWindowsPort
#include(${_yaccs_main_dir}/flags/sanitizer-address.cmake)
#include(${_yaccs_main_dir}/flags/sanitizer-undefined.cmake)
#include(${_yaccs_main_dir}/flags/sanitizer-leak.cmake)
