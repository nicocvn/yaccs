# ---------------------------------------------------------------------------- #
# yaccs config file for macOS / GCC / C++17
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
#   - Enable C++17
#
# ---------------------------------------------------------------------------- #


# Guard.
if(DEFINED MACOS_GCC_CXX17)
    return()
endif()
set(MACOS_GCC_CXX17 1)


# Include base config.
# The filename does the rest.
include(${CMAKE_CURRENT_LIST_DIR}/base/macos_gcc.cmake)

# Load c++ standard.
yaccs_load_std_cxx(${CMAKE_CURRENT_LIST_FILE})
