# ---------------------------------------------------------------------------- #
# yaccs config file for macOS / clang / C++11
#
# Nicolas Clauvelin (n.clauvelin+code@gmail.com)
# nicocvn.com, 2022
#
#
# MODULE:   yaccs
#
# MANIFEST:
#   Platform:       macOS
#   Compiler:       clang
#   - Enable C++11
#
# ---------------------------------------------------------------------------- #


# Guard.
if(DEFINED MACOS_CLANG_CXX11)
    return()
endif()
set(MACOS_CLANG_CXX11 1)


# Include base config.
# The filename does the rest.
include(${CMAKE_CURRENT_LIST_DIR}/base/macos_clang.cmake)

# Load c++ standard.
yaccs_load_std_cxx(${CMAKE_CURRENT_LIST_FILE})
