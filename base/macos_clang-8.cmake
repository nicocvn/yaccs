# ---------------------------------------------------------------------------- #
# yaccs config file for macOS / clang-8 / base
#
# Nicolas Clauvelin (n.clauvelin+code@gmail.com)
# nicocvn.com, 2019
#
#
# MODULE:   yaccs
#
# MANIFEST:
#   Platform:       macOS
#   Compiler:       clang-8
#   - Minimal C/C++ flags for all build types.
#   - Apply dead strip flags for all build types except Debug
#   - Force usage of libc++
#   - Enable LTO
#   - Enable address, undefined behavior, and leak sanitizers for Debug build
#     type
#   
#   This configuration is equivalent to a "standard" macOS configuration with
#   clang-8 as the compiler.
#
# ---------------------------------------------------------------------------- #


# Guard.
if(DEFINED MACOS_CLANG8_BASE)
    return()
endif()
set(MACOS_CLANG8_BASE 1)


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
include(${_yaccs_main_dir}/platform/macos.cmake)

# Compiler.
include(${_yaccs_main_dir}/compiler/clang-8.cmake)

# Flags.
include(${_yaccs_main_dir}/flags/clang-base-flags.cmake)
#
include(${_yaccs_main_dir}/flags/libcxx.cmake)
#
include(${_yaccs_main_dir}/flags/LTO.cmake)
include(${_yaccs_main_dir}/flags/macos-dead-code.cmake)
#
include(${_yaccs_main_dir}/flags/sanitizer-address.cmake)
include(${_yaccs_main_dir}/flags/sanitizer-undefined.cmake)
include(${_yaccs_main_dir}/flags/sanitizer-leak.cmake)
