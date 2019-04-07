# ---------------------------------------------------------------------------- #
# yaccs / flags / C++14
#
# Nicolas Clauvelin (n.clauvelin+code@gmail.com)
# nicocvn.com, 2019
#
#
# MODULE:   yaccs
#
# MANIFEST:
#   Enable C++14 standard.
#
# ---------------------------------------------------------------------------- #


# Guard.
if(DEFINED __yaccs_std_cxx14)
    return()
endif()
set(__yaccs_std_cxx14 1)


set(CMAKE_CXX_STANDARD "14"
    CACHE STRING "C++ language standard" FORCE)
set(CMAKE_CXX_STANDARD_REQUIRED ON
    CACHE STRING "Enable C standard requirement" FORCE)
