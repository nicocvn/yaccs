# ---------------------------------------------------------------------------- #
# yaccs / flags / C++11
#
# Nicolas Clauvelin (n.clauvelin+code@gmail.com)
# nicocvn.com, 2019
#
#
# MODULE:   yaccs
#
# MANIFEST:
#   Enable C++11 standard.
#
# ---------------------------------------------------------------------------- #


# Guard.
if(DEFINED __yaccs_std_cxx11)
    return()
endif()
set(__yaccs_std_cxx11 1)


set(CMAKE_CXX_STANDARD "11"
    CACHE STRING "C++ language standard" FORCE)
set(CMAKE_CXX_STANDARD_REQUIRED ON
    CACHE STRING "Enable C standard requirement" FORCE)
