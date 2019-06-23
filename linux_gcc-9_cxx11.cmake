# ---------------------------------------------------------------------------- #
# yaccs config file for linux / gcc-9 / C++11
#
# Nicolas Clauvelin (n.clauvelin+code@gmail.com)
# nicocvn.com, 2019
#
#
# MODULE:   yaccs
#
# MANIFEST:
#   Platform:       linux
#   Compiler:       gcc-9
#   - Enable C++11
#
# ---------------------------------------------------------------------------- #


# Guard.
if(DEFINED LINUX_GCC9_CXX11)
    return()
endif()
set(LINUX_GCC9_CXX11 1)


# Include base config.
# The filename does the rest.
include(${CMAKE_CURRENT_LIST_DIR}/base/linux_gcc-9.cmake)

# Load c++ standard.
yaccs_load_std_cxx(${CMAKE_CURRENT_LIST_FILE})
