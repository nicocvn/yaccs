# ---------------------------------------------------------------------------- #
# yaccs / flags / Cortex-M0+ support
#
# Nicolas Clauvelin (n.clauvelin+code@gmail.com)
# nicocvn.com, 2019
#
#
# MODULE:   yaccs
#
# MANIFEST:
#   Enable hardware support for Cortex-M0+.
#
# ---------------------------------------------------------------------------- #


# Guard.
if(DEFINED __yaccs_cortex_m0p)
    return()
endif()
set(__yaccs_cortex_m0p 1)


# Add flags for Cortex-M0+ to all build types.
yaccs_update_cache_var(CMAKE_C_FLAGS_DEBUG "-mcpu=cortex-m0plus")
yaccs_update_cache_var(CMAKE_CXX_FLAGS_DEBUG "-mcpu=cortex-m0plus")
#
yaccs_update_cache_var(CMAKE_C_FLAGS_RELEASE "-mcpu=cortex-m0plus")
yaccs_update_cache_var(CMAKE_CXX_FLAGS_RELEASE "-mcpu=cortex-m0plus")
#
yaccs_update_cache_var(CMAKE_C_FLAGS_RELWITHDEBINFO "-mcpu=cortex-m0plus")
yaccs_update_cache_var(CMAKE_CXX_FLAGS_RELWITHDEBINFO "-mcpu=cortex-m0plus")
#
yaccs_update_cache_var(CMAKE_C_FLAGS_MINSIZEREL "-mcpu=cortex-m0plus")
yaccs_update_cache_var(CMAKE_CXX_FLAGS_MINSIZEREL "-mcpu=cortex-m0plus")
