# ---------------------------------------------------------------------------- #
# yaccs / flags / global config
#
# Nicolas Clauvelin (n.clauvelin+code@gmail.com)
# nicocvn.com, 2019
#
#
# MODULE:   yaccs
#
# MANIFEST:
#   This file defines global settings used by the various flags setup.
#
# ---------------------------------------------------------------------------- #


# Default architecture.
# This is used by Clang and GCC variants.
set(yaccs_DEFAULT_ARCH "nehalem"
    CACHE STRING "Default CPU architecture")


# macOS deployment target.
# This is used to set CMAKE_OSX_DEPLOYMENT_TARGET
set(yaccs_OSX_TARGET "10.13"
    CACHE STRING "macOS deployment target")


# Apple Silicon M1 support.
set(yaccs_APPLE_M1 OFF
    CACHE BOOL "Enable Apple M1 support")


# Visual Studio deployment target.
# This is used to set:
# - CMAKE_SYSTEM_VERSION
# - CMAKE_VS_WINDOWS_TARGET_PLATFORM_VERSION
# These variables are required when compiling on Windows 10 and targeting
# Windows 8.1.
set(yaccs_VS_SYSTEM_VERSION "8.1"
    CACHE STRING "Windows system version for VS deployment target")
set(yaccs_VS_WINDOWS_TARGET "8.1"
    CACHE STRING "Visual Studio deployment target")
set(yaccs_VS_PLATFORM "x64"
    CACHE STRING "Visual Studio platform")
