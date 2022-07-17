# ---------------------------------------------------------------------------- #
# yaccs config file for windows / cl / base
#
# Nicolas Clauvelin (n.clauvelin+code@gmail.com)
# nicocvn.com, 2022
#
#
# MODULE:   yaccs
#
# MANIFEST:
#   Platform:       windows
#   Compiler:       cl
#
# ---------------------------------------------------------------------------- #


# Guard.
if(DEFINED WINDOWS_CL_BASE)
    return()
endif()
set(WINDOWS_CL_BASE 1)


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
include(${_yaccs_main_dir}/compiler/cl.cmake)
