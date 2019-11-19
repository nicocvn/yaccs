# ---------------------------------------------------------------------------- #
# yaccs / flags / LTO
#
# Nicolas Clauvelin (n.clauvelin+code@gmail.com)
# nicocvn.com, 2019
#
#
# MODULE:   yaccs
#
# MANIFEST:
#   Enable LTO for Release and MinSizeReal build types
#
# ---------------------------------------------------------------------------- #


# Guard.
if(DEFINED __yaccs_lto)
    return()
endif()
set(__yaccs_lto 1)


# Rely on CMake to enable LTO.
# LTO is only enabled for Release and MinSizeRel build types.
set(CMAKE_INTERPROCEDURAL_OPTIMIZATION_DEBUG OFF
    CACHE STRING "CMake IPO for Debug build type" FORCE)
set(CMAKE_INTERPROCEDURAL_OPTIMIZATION_RELEASE ON
    CACHE STRING "CMake IPO for Release build type" FORCE)
set(CMAKE_INTERPROCEDURAL_OPTIMIZATION_RELWITHDEBINFO OFF
    CACHE STRING "CMake IPO for RelWithDebInfo build type" FORCE)
set(CMAKE_INTERPROCEDURAL_OPTIMIZATION_MINSIZEREL ON
    CACHE STRING "CMake IPO for MinSizeRel build type" FORCE)
