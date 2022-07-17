# ---------------------------------------------------------------------------- #
# yaccs config file for macOS / GCC / C++11
#
# Nicolas Clauvelin (n.clauvelin+code@gmail.com)
# nicocvn.com, 2022
#
#
# MODULE:   yaccs
#
# MANIFEST:
#   Platform:       macOS
#   Compiler:       GCC
#   - Enable C++11
#
# ---------------------------------------------------------------------------- #


# Guard.
if(DEFINED MACOS_GCC_CXX11)
    return()
endif()
set(MACOS_GCC_CXX11 1)


# Include base config.
# The filename does the rest.
include(${CMAKE_CURRENT_LIST_DIR}/base/macos_gcc.cmake)

# Load c++ standard.
yaccs_load_std_cxx(${CMAKE_CURRENT_LIST_FILE})
