# ---------------------------------------------------------------------------- #
# yaccs config file for linux / clang-13 / base
#
# Nicolas Clauvelin (n.clauvelin+code@gmail.com)
# nicocvn.com, 2019
#
#
# MODULE:   yaccs
#
# MANIFEST:
#   Platform:       linux
#   Compiler:       clang-13
#   - Minimal C/C++ flags for all build types.
#   - Apply dead code optimization to all build types except Debug
#   - Enable LTO
#   - Force lld linker
#   - Enable address, undefined behavior, and leak sanitizers for Debug build
#     type
#
# ---------------------------------------------------------------------------- #


# Guard.
if(DEFINED LINUX_CLANG13_BASE)
    return()
endif()
set(LINUX_CLANG13_BASE 1)


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
include(${_yaccs_main_dir}/platform/linux.cmake)

# Compiler.
include(${_yaccs_main_dir}/compiler/clang-13.cmake)

# Flags.
include(${_yaccs_main_dir}/flags/clang-base-flags.cmake)
#
include(${_yaccs_main_dir}/flags/debug-levels.cmake)
#
include(${_yaccs_main_dir}/flags/clang-lld-linker.cmake)
#
include(${_yaccs_main_dir}/flags/LTO.cmake)
include(${_yaccs_main_dir}/flags/dead-code.cmake)
include(${_yaccs_main_dir}/flags/gcc-strip.cmake)
#
include(${_yaccs_main_dir}/flags/sanitizer-address.cmake)
include(${_yaccs_main_dir}/flags/sanitizer-undefined.cmake)
include(${_yaccs_main_dir}/flags/sanitizer-leak.cmake)
#
include(${_yaccs_main_dir}/flags/libcxx.cmake)
