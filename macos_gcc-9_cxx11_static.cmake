# ---------------------------------------------------------------------------- #
# yaccs config file for macOS / gcc-9 / C++11 + static builds
#
# Nicolas Clauvelin (n.clauvelin+code@gmail.com)
# nicocvn.com, 2019
#
#
# MODULE:   yaccs
#
# MANIFEST:
#   Platform:       macOS
#   Compiler:       gcc-9
#   - Enable C++11
#   - Add static build features
#   
#   This configuration provides the ability to generate static build products on
#   macOS using gcc-9. Note that, the build products will still require macOS
#   system shared libraries.
#
# ---------------------------------------------------------------------------- #


# Guard.
if(DEFINED MACOS_GCC9_CXX11_STATIC)
    return()
endif()
set(MACOS_GCC9_CXX11_STATIC 1)


# Include base config.
include(${CMAKE_CURRENT_LIST_DIR}/base/macos_gcc-9.cmake)

# Static flags.
# Note: we do not add the static flag as this is not supported on macOS; the
# system libraries are only provided as shared libraries.
include(${_yaccs_main_dir}/flags/static-libgcc.cmake)
include(${_yaccs_main_dir}/flags/static-libstdcxx.cmake)

# Load c++ standard.
yaccs_load_std_cxx(${CMAKE_CURRENT_LIST_FILE})
