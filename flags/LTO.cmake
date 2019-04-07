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
#   Enable LTO.
#
# ---------------------------------------------------------------------------- #


# Guard.
if(DEFINED __yaccs_lto)
    return()
endif()
set(__yaccs_lto 1)


# Rely on CMake to enable LTO.
# For supported recent compilers this should not interfere with debug symbols.
set(CMAKE_INTERPROCEDURAL_OPTIMIZATION ON CACHE STRING "" FORCE)

