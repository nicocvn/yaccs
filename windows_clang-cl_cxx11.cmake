# ---------------------------------------------------------------------------- #
# yaccs config file for windows / clang-cl / C++11
#
# Nicolas Clauvelin (n.clauvelin+code@gmail.com)
# nicocvn.com, 2019
#
#
# MODULE:   yaccs
#
# MANIFEST:
#   Platform:       windows
#   Compiler:       clang-cl
#   - Enable C++11
#
# ---------------------------------------------------------------------------- #


# Guard.
if(DEFINED WINDOWS_CLANG_CL_CXX11)
    return()
endif()
set(WINDOWS_CLANG_CL_CXX11 1)


# Include base config.
# The filename does the rest.
include(${CMAKE_CURRENT_LIST_DIR}/base/windows_clang-cl.cmake)

# Load c++ standard.
yaccs_load_std_cxx(${CMAKE_CURRENT_LIST_FILE})
