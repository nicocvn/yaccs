# ---------------------------------------------------------------------------- #
# yaccs config file for macOS / clang-13 / C++11
#
# Nicolas Clauvelin (n.clauvelin+code@gmail.com)
# nicocvn.com, 2019
#
#
# MODULE:   yaccs
#
# MANIFEST:
#   Platform:       macOS
#   Compiler:       clang-13
#   - Enable C++11
#
# ---------------------------------------------------------------------------- #


# Guard.
if(DEFINED MACOS_CLANG13_CXX11)
    return()
endif()
set(MACOS_CLANG13_CXX11 1)


# Include base config.
# The filename does the rest.
include(${CMAKE_CURRENT_LIST_DIR}/base/macos_clang-13.cmake)

# Load c++ standard.
yaccs_load_std_cxx(${CMAKE_CURRENT_LIST_FILE})
