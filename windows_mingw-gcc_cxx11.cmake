# ---------------------------------------------------------------------------- #
# yaccs config file for windows / mingw gcc / C++11
#
# Nicolas Clauvelin (n.clauvelin+code@gmail.com)
# nicocvn.com, 2022
#
#
# MODULE:   yaccs
#
# MANIFEST:
#   Platform:       windows
#   Compiler:       mingw gcc
#   - Enable C++11
#
# ---------------------------------------------------------------------------- #


# Guard.
if(DEFINED WINDOWS_MINGW_GCC_CXX11)
    return()
endif()
set(WINDOWS_MINGW_GCC_CXX11 1)


# Include base config.
# The filename does the rest.
include(${CMAKE_CURRENT_LIST_DIR}/base/windows_mingw-gcc.cmake)

# Load c++ standard.
yaccs_load_std_cxx(${CMAKE_CURRENT_LIST_FILE})
