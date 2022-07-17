# ---------------------------------------------------------------------------- #
# yaccs config file for linux / GCC / C++11
#
# Nicolas Clauvelin (n.clauvelin+code@gmail.com)
# nicocvn.com, 2022
#
#
# MODULE:   yaccs
#
# MANIFEST:
#   Platform:       linux
#   Compiler:       GCC
#   - Enable C++11
#
# ---------------------------------------------------------------------------- #


# Guard.
if(DEFINED LINUX_GCC_CXX11)
    return()
endif()
set(LINUX_GCC_CXX11 1)


# Include base config.
# The filename does the rest.
include(${CMAKE_CURRENT_LIST_DIR}/base/linux_gcc.cmake)

# Load c++ standard.
yaccs_load_std_cxx(${CMAKE_CURRENT_LIST_FILE})
