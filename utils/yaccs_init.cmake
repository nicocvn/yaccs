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


# Set configuration types.
set(CMAKE_CONFIGURATION_TYPES "Debug;Release;RelWithDebInfo;MinSizeRel"
    CACHE STRING "" FORCE)

# Default build type is Debug.
if(NOT CMAKE_BUILD_TYPE)
    yaccs_status_message("Defaulting build type to Debug")
    set(CMAKE_BUILD_TYPE "Debug" CACHE STRING
        "Build type" FORCE)
endif()


# Set some helper text for the GUI.
set_property(CACHE CMAKE_BUILD_TYPE
             PROPERTY HELPSTRING "Choose the type of build")
set_property(CACHE CMAKE_BUILD_TYPE
             PROPERTY STRINGS "Debug;Release;RelWithDebInfo;MinSizeRel")


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


# Enable compilation database.
set(CMAKE_EXPORT_COMPILE_COMMANDS ON
    CACHE STRING "Enable compilation database" FORCE)
