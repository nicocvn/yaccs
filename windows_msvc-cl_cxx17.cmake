# ---------------------------------------------------------------------------- #
# yaccs config file for windows / cl / C++17
#
# Nicolas Clauvelin (n.clauvelin+code@gmail.com)
# nicocvn.com, 2019
#
#
# MODULE:   yaccs
#
# MANIFEST:
#   Platform:       windows
#   Compiler:       cl
#   - Enable C++17
#
# ---------------------------------------------------------------------------- #


# Guard.
if(DEFINED WINDOWS_CL_CXX17)
    return()
endif()
set(WINDOWS_CL_CXX17 1)


# Include base config.
# The filename does the rest.
include(${CMAKE_CURRENT_LIST_DIR}/base/windows_msvc-cl.cmake)

# Load c++ standard.
yaccs_load_std_cxx(${CMAKE_CURRENT_LIST_FILE})
