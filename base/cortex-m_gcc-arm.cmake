# ---------------------------------------------------------------------------- #
# yaccs config file for cortex-m / gcc-arm / base
#
# Nicolas Clauvelin (n.clauvelin+code@gmail.com)
# nicocvn.com, 2022
#
#
# MODULE:   yaccs
#
# MANIFEST:
#   Platform:       cortex-m
#   Compiler:       GCC ARM Embedded Toolchain
#   - Minimal flags for bare metal C/C++ projects
#   - Dead code optimization enabled on all build types
#   - Semihosting enabled based on yaccs_gcc_arm_enable_semihosting option
#
# ---------------------------------------------------------------------------- #


# Guard.
if(DEFINED CORTEX_M_GCC_BASE)
    return()
endif()
set(CORTEX_M_GCC_BASE 1)


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
include(${_yaccs_main_dir}/platform/cortex-m.cmake)

# Compiler.
include(${_yaccs_main_dir}/compiler/gcc-arm.cmake)

# Flags.
include(${_yaccs_main_dir}/flags/gcc-arm-base-flags.cmake)
include(${_yaccs_main_dir}/flags/gcc-arm-nano-libc.cmake)
include(${_yaccs_main_dir}/flags/dead-code.cmake)
include(${_yaccs_main_dir}/flags/dead-code-debug.cmake)
if(yaccs_gcc_arm_enable_semihosting)
    yaccs_status_message("semi-hosting enabled for GCC ARM compilers")
    include(${_yaccs_main_dir}/flags/gcc-arm-semihosting.cmake)
else()
    yaccs_status_message("semi-hosting disabled for GCC ARM compilers")
    include(${_yaccs_main_dir}/flags/gcc-arm-no-semihosting.cmake)
endif()
