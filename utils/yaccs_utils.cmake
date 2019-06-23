# ---------------------------------------------------------------------------- #
# yaccs utils
#
# Nicolas Clauvelin (n.clauvelin+code@gmail.com)
# nicocvn.com, 2019
#
#
# MODULE:   yaccs
#
# ---------------------------------------------------------------------------- #


# Guard.
if(DEFINED __yaccs_utils)
    return()
endif()
set(__yaccs_utils 1)


# Store script location.
set(_yaccs_utils_dir "${CMAKE_CURRENT_LIST_DIR}")


# Reference for platform identification:
# https://gitlab.kitware.com/cmake/community/wikis/doc/cmake/Checking-Platform

# Reference for compiler identification (as of 3.14.0):
# https://cmake.org/cmake/help/v3.10/variable/CMAKE_LANG_COMPILER_ID.html#variable:CMAKE_%3CLANG%3E_COMPILER_ID



# idenfity_compiler:
#   function to identify the compiler
#
# \arg compiler_var:        contains the compiler id upon return
#
# Supported compilers:
#   "GNU" for gcc and g++ compilers
#   "AppleClang" for clang shipped with macOS
#   "Clang" for clang and clang++
#   "MSVC" for Visual Studio compilers 
function(identify_compiler compiler_var)

    # If the C and CXX compiler IDs do not match this is an error.
    if(NOT CMAKE_C_COMPILER_ID STREQUAL CMAKE_CXX_COMPILER_ID)
        yaccs_fatal_error_message("C and CXX IDs differ ... this is confusing")
        return()
    endif()

    # GNU.
    if(CMAKE_C_COMPILER_ID STREQUAL "GNU")
        set(${compiler_var} "GNU" PARENT_SCOPE)
        return()
    endif()

    # AppleClang.
    if(CMAKE_C_COMPILER_ID STREQUAL "AppleClang")
        set(${compiler_var} "AppleClang" PARENT_SCOPE)
        return()
    endif()

    # Clang.
    if(CMAKE_C_COMPILER_ID STREQUAL "Clang")
        set(${compiler_var} "Clang" PARENT_SCOPE)
        return()
    endif()

    # MSVC.
    if(CMAKE_C_COMPILER_ID STREQUAL "MSVC")
        set(${compiler_var} "MSVC" PARENT_SCOPE)
        return()
    endif()

endfunction()


# identify_platform:
#   function to identify the platform
#
# \arg platform_var:        contains the platform id upon return
#
# Supported platforms:
#   "Linux" for all Linux distributions
#   "Darwin" for macOS and similar (tvOS, ...)
#   "Windows" for Windows (all versions)
#   "Generic" for bare-metal systems
function(identify_platform platform_var)

    # Linux.
    if(CMAKE_SYSTEM_NAME STREQUAL "Linux")
        set(${platform_var} "Linux" PARENT_SCOPE)
        return()
    endif()

    # Apple.
    if(CMAKE_SYSTEM_NAME STREQUAL "Darwin")
        set(${platform_var} "Darwin" PARENT_SCOPE)
        return()
    endif()

    # Windows.
    if(CMAKE_SYSTEM_NAME STREQUAL "Windows")
        set(${platform_var} "Windows" PARENT_SCOPE)
        return()
    endif()

    # Generic.
    # This is used for bare-metal systems (no operating system).
    if(CMAKE_SYSTEM_NAME STREQUAL "Generic")
        set(${platform_var} "Generic" PARENT_SCOPE)
        return()
    endif()

endfunction()


function(is_config_supported_by_yaccs supported_var)

    # Get platform and compiler identities.
    identify_platform(platform_id)
    identify_compiler(compiler_id)

    # Check that the relevant config file exists.
    if(EXISTS ${_yaccs_utils_dir}/${platform_id}/${compiler_id}/config.cmake)
        set(${supported_var} TRUE PARENT_SCOPE)
    else()
        set(${supported_var} FALSE PARENT_SCOPE)
    endif()

endfunction()


