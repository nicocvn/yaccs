# ---------------------------------------------------------------------------- #
# yaccs config file for macOS / AppleClang / C++14
#
# Nicolas Clauvelin (n.clauvelin+code@gmail.com)
# nicocvn.com, 2019
#
#
# MODULE:   yaccs
#
# MANIFEST:
#   Platform:       macOS
#   Compiler:       AppleClang
#   - Enable C++14
#
# ---------------------------------------------------------------------------- #


# Guard.
if(DEFINED MACOS_APPLECLANG_CXX14)
    return()
endif()
set(MACOS_APPLECLANG_CXX14 1)


# Include base config.
# The filename does the rest.
include(${CMAKE_CURRENT_LIST_DIR}/base/macos_apple-clang.cmake)

# Load c++ standard.
yaccs_load_std_cxx(${CMAKE_CURRENT_LIST_FILE})
