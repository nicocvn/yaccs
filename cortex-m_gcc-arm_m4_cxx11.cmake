# ---------------------------------------------------------------------------- #
# yaccs config file for cortex-m / gcc-arm / Cortex-M4 + C++11
#
# Nicolas Clauvelin (n.clauvelin+code@gmail.com)
# nicocvn.com, 2019
#
#
# MODULE:   yaccs
#
# MANIFEST:
#   Platform:       cortex-m
#   Compiler:       GCC ARM Embedded Toolchain
#   - Enable C++11
#
# ---------------------------------------------------------------------------- #


# Guard.
if(DEFINED CORTEX_M_GCC_M4_CXX11)
    return()
endif()
set(CORTEX_M_GCC_M4_CXX11 1)


# Include base config.
# The filename does the rest.
include(${CMAKE_CURRENT_LIST_DIR}/base/cortex-m_gcc-arm.cmake)

# Load c++ standard.
yaccs_load_std_cxx(${CMAKE_CURRENT_LIST_FILE})

# Load cortex flags.
yaccs_load_cortex_flags(${CMAKE_CURRENT_LIST_FILE})
