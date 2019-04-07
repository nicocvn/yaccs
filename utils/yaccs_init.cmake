# ---------------------------------------------------------------------------- #
# yaccs / utils / init
#
# Nicolas Clauvelin (n.clauvelin+code@gmail.com)
# nicocvn.com, 2019
#
#
# MODULE:   yaccs
#
# ---------------------------------------------------------------------------- #


# Guard.
if(DEFINED __yaccs_init_guard)
    return()
endif()
set(__yaccs_init_guard 1)


# Store script location.
set(_yaccs_init_dir "${CMAKE_CURRENT_LIST_DIR}")


# Global configuration.
include(${_yaccs_main_dir}/config/global-config.cmake)


# Enforce defaults for C standard.
set(CMAKE_C_STANDARD "99"
    CACHE STRING "C language standard" FORCE)
set(CMAKE_C_STANDARD_REQUIRED ON
    CACHE STRING "Enable C standard requirement" FORCE)

# Set option for C++ extensions.
set(CMAKE_CXX_EXTENSIONS OFF
    CACHE STRING "Enable C++ extensions" FORCE)
