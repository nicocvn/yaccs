# ---------------------------------------------------------------------------- #
# yaccs / flags / Cortex-M3 support
#
# Nicolas Clauvelin (n.clauvelin+code@gmail.com)
# nicocvn.com, 2019
#
#
# MODULE:   yaccs
#
# MANIFEST:
#   Enable hardware support for Cortex-M3.
#
# ---------------------------------------------------------------------------- #


# Guard.
if(DEFINED __yaccs_cortex_m3)
    return()
endif()
set(__yaccs_cortex_m3 1)


# Add flags for Cortex-M3 to all build types.
yaccs_update_cache_var(CMAKE_C_FLAGS_DEBUG "-mcpu=cortex-m3")
yaccs_update_cache_var(CMAKE_CXX_FLAGS_DEBUG "-mcpu=cortex-m3")
#
yaccs_update_cache_var(CMAKE_C_FLAGS_RELEASE "-mcpu=cortex-m3")
yaccs_update_cache_var(CMAKE_CXX_FLAGS_RELEASE "-mcpu=cortex-m3")
#
yaccs_update_cache_var(CMAKE_C_FLAGS_RELWITHDEBINFO "-mcpu=cortex-m3")
yaccs_update_cache_var(CMAKE_CXX_FLAGS_RELWITHDEBINFO "-mcpu=cortex-m3")
#
yaccs_update_cache_var(CMAKE_C_FLAGS_MINSIZEREL "-mcpu=cortex-m3")
yaccs_update_cache_var(CMAKE_CXX_FLAGS_MINSIZEREL "-mcpu=cortex-m3")
