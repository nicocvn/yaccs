# ---------------------------------------------------------------------------- #
# yaccs config file for macOS / gcc-8 / C++17 + static builds
#
# Nicolas Clauvelin (n.clauvelin+code@gmail.com)
# nicocvn.com, 2019
#
#
# MODULE:   yaccs
#
# MANIFEST:
#   Platform:       macOS
#   Compiler:       gcc-8
#   - Enable C++17
#   - Add static build features
#   
#   This configuration provides the ability to generate static build products on
#   macOS using gcc-8. Note that, the build products will still require macOS
#   system shared libraries.
#
# ---------------------------------------------------------------------------- #


# Guard.
if(DEFINED MACOS_GCC8_CXX17_STATIC)
    return()
endif()
set(MACOS_GCC8_CXX17_STATIC 1)


# Include base config.
include(${CMAKE_CURRENT_LIST_DIR}/base/macos_gcc-8.cmake)

# Static flags.
# Note: we do not add the static flag as this is not supported on macOS; the
# system libraries are only provided as shared libraries.
include(${_yaccs_main_dir}/flags/static-libgcc.cmake)
include(${_yaccs_main_dir}/flags/static-libstdcxx.cmake)

# Load c++ standard.
yaccs_load_std_cxx(${CMAKE_CURRENT_LIST_FILE})
