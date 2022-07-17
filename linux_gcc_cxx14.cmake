# ---------------------------------------------------------------------------- #
# yaccs config file for linux / GCC / C++14
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
#   - Enable C++14
#
# ---------------------------------------------------------------------------- #


# Guard.
if(DEFINED LINUX_GCC_CXX14)
    return()
endif()
set(LINUX_GCC_CXX14 1)


# Include base config.
# The filename does the rest.
include(${CMAKE_CURRENT_LIST_DIR}/base/linux_gcc.cmake)

# Load c++ standard.
yaccs_load_std_cxx(${CMAKE_CURRENT_LIST_FILE})