# ---------------------------------------------------------------------------- #
# yaccs CMake module
#
# Nicolas Clauvelin (n.clauvelin+code@gmail.com)
# nicocvn.com, 2019
#
#
# MODULE:   yaccs
#
# ---------------------------------------------------------------------------- #


cmake_minimum_required(VERSION 3.10.0 FATAL_ERROR)


# Guard.
if(DEFINED __yaccs_main_guard)
    return()
endif()
set(__yaccs_main_guard 1)


# Version
set("yaccs_VERSION" "2.2.1" CACHE STRING "yaccs version" FORCE)


# Store script location.
set(_yaccs_main_dir "${CMAKE_CURRENT_LIST_DIR}"
    CACHE STRING "yaccs main directory" FORCE)


# Include utility code.
include(${_yaccs_main_dir}/utils/yaccs_common.cmake)
include(${_yaccs_main_dir}/utils/yaccs_cortex_flags_loader.cmake)
include(${_yaccs_main_dir}/utils/yaccs_std_cxx_loader.cmake)
include(${_yaccs_main_dir}/utils/yaccs_system_info.cmake)
include(${_yaccs_main_dir}/utils/yaccs_update_cache_var.cmake)
include(${_yaccs_main_dir}/utils/yaccs_init_build_tree.cmake)
include(${_yaccs_main_dir}/utils/yaccs_utils.cmake)


# Init.
include(${_yaccs_main_dir}/utils/yaccs_init.cmake)


# Load user-defined config options if available.
include(${CMAKE_SOURCE_DIR}/yaccs-user-config.cmake OPTIONAL)
