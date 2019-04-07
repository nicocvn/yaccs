# ---------------------------------------------------------------------------- #
# yaccs config file for macOS / gcc-8 / C++11
#
# Nicolas Clauvelin (n.clauvelin+code@gmail.com)
# nicocvn.com, 2019
#
#
# MODULE:   yaccs
#
# MANIFEST:
#   Platform:       macOS
#   Compiler:       gcc-8
#   - Enable C++11
#
# ---------------------------------------------------------------------------- #


# Guard.
if(DEFINED MACOS_GCC8_CXX11)
    return()
endif()
set(MACOS_GCC8_CXX11 1)


# Include base config.
# The filename does the rest.
include(${CMAKE_CURRENT_LIST_DIR}/base/macos_gcc-8.cmake)

# Load c++ standard.
yaccs_load_std_cxx(${CMAKE_CURRENT_LIST_FILE})
