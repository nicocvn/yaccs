# ---------------------------------------------------------------------------- #
# yaccs config file for linux / gcc-9 / C++17 + static builds
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
#   - Add static build features.
#
# ---------------------------------------------------------------------------- #


# Guard.
if(DEFINED LINUX_GCC9_CXX17_STATIC)
    return()
endif()
set(LINUX_GCC9_CXX17_STATIC 1)


# Include base config.
# The filename does the rest.
include(${CMAKE_CURRENT_LIST_DIR}/base/linux_gcc-9.cmake)

# Static flags.
include(${_yaccs_main_dir}/flags/static.cmake)
include(${_yaccs_main_dir}/flags/static-libgcc.cmake)
include(${_yaccs_main_dir}/flags/static-libstdcxx.cmake)


# Load c++ standard.
yaccs_load_std_cxx(${CMAKE_CURRENT_LIST_FILE})
