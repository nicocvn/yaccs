# ---------------------------------------------------------------------------- #
# yaccs / flags / C++17
#
# Nicolas Clauvelin (n.clauvelin+code@gmail.com)
# nicocvn.com, 2019
#
#
# MODULE:   yaccs
#
# MANIFEST:
#   Enable C++17 standard.
#
# ---------------------------------------------------------------------------- #


# Guard.
if(DEFINED __yaccs_std_cxx17)
    return()
endif()
set(__yaccs_std_cxx17 1)


set(CMAKE_CXX_STANDARD "17"
    CACHE STRING "C++ language standard" FORCE)
set(CMAKE_CXX_STANDARD_REQUIRED ON
    CACHE STRING "Enable C standard requirement" FORCE)
