# ---------------------------------------------------------------------------- #
# yaccs config file for linux / clang-8 / static linking + rtlib
#
# Nicolas Clauvelin (n.clauvelin+code@gmail.com)
# nicocvn.com, 2019
#
#
# MODULE:   yaccs
#
# MANIFEST:
#   Platform:       linux
#   Compiler:       clang-8
#   - Enable static linking and compiler-rt
#
# ---------------------------------------------------------------------------- #


# Guard.
if(DEFINED LINUX_CLANG8_CXX14_STATIC_RTLIB)
    return()
endif()
set(LINUX_CLANG8_CXX14_STATIC_RTLIB 1)


# Include base config.
# The filename does the rest.
include(${CMAKE_CURRENT_LIST_DIR}/base/linux_clang-8.cmake)

# Static linking.
include(${_yaccs_main_dir}/flags/static.cmake)
include(${_yaccs_main_dir}/flags/clang-static-linux.cmake)
include(${_yaccs_main_dir}/flags/clang-rtlib.cmake)

# Load c++ standard.
yaccs_load_std_cxx(${CMAKE_CURRENT_LIST_FILE})
