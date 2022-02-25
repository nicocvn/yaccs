# ---------------------------------------------------------------------------- #
# yaccs config file for linux / clang-13 / C++17
#
# Nicolas Clauvelin (n.clauvelin+code@gmail.com)
# nicocvn.com, 2019
#
#
# MODULE:   yaccs
#
# MANIFEST:
#   Platform:       linux
#   Compiler:       clang-13
#   - Enable C++17
#
# ---------------------------------------------------------------------------- #


# Guard.
if(DEFINED LINUX_CLANG13_CXX17)
    return()
endif()
set(LINUX_CLANG13_CXX17 1)


# Include base config.
# The filename does the rest.
include(${CMAKE_CURRENT_LIST_DIR}/base/linux_clang-13.cmake)

# Load c++ standard.
yaccs_load_std_cxx(${CMAKE_CURRENT_LIST_FILE})
