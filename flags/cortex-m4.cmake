# ---------------------------------------------------------------------------- #
# yaccs / flags / Cortex-M4 support
#
# Nicolas Clauvelin (n.clauvelin+code@gmail.com)
# nicocvn.com, 2019
#
#
# MODULE:   yaccs
#
# MANIFEST:
#   Enable hardware support for Cortex-M4.
#
# ---------------------------------------------------------------------------- #


# Guard.
if(DEFINED __yaccs_cortex_m4)
    return()
endif()
set(__yaccs_cortex_m4 1)


# Add flags for Cortex-M4 to all build types.
yaccs_update_cache_var(CMAKE_C_FLAGS_DEBUG "-mcpu=cortex-m4")
yaccs_update_cache_var(CMAKE_C_FLAGS_DEBUG "-mfloat-abi=hard")
yaccs_update_cache_var(CMAKE_C_FLAGS_DEBUG "-mfpu=fpv4-sp-d16")
yaccs_update_cache_var(CMAKE_CXX_FLAGS_DEBUG "-mcpu=cortex-m4")
yaccs_update_cache_var(CMAKE_CXX_FLAGS_DEBUG "-mfloat-abi=hard")
yaccs_update_cache_var(CMAKE_CXX_FLAGS_DEBUG "-mfpu=fpv4-sp-d16")
#
yaccs_update_cache_var(CMAKE_C_FLAGS_RELEASE "-mcpu=cortex-m4")
yaccs_update_cache_var(CMAKE_C_FLAGS_RELEASE "-mfloat-abi=hard")
yaccs_update_cache_var(CMAKE_C_FLAGS_RELEASE "-mfpu=fpv4-sp-d16")
yaccs_update_cache_var(CMAKE_CXX_FLAGS_RELEASE "-mcpu=cortex-m4")
yaccs_update_cache_var(CMAKE_CXX_FLAGS_RELEASE "-mfloat-abi=hard")
yaccs_update_cache_var(CMAKE_CXX_FLAGS_RELEASE "-mfpu=fpv4-sp-d16")
#
yaccs_update_cache_var(CMAKE_C_FLAGS_RELWITHDEBINFO "-mcpu=cortex-m4")
yaccs_update_cache_var(CMAKE_C_FLAGS_RELWITHDEBINFO "-mfloat-abi=hard")
yaccs_update_cache_var(CMAKE_C_FLAGS_RELWITHDEBINFO "-mfpu=fpv4-sp-d16")
yaccs_update_cache_var(CMAKE_CXX_FLAGS_RELWITHDEBINFO "-mcpu=cortex-m4")
yaccs_update_cache_var(CMAKE_CXX_FLAGS_RELWITHDEBINFO "-mfloat-abi=hard")
yaccs_update_cache_var(CMAKE_CXX_FLAGS_RELWITHDEBINFO "-mfpu=fpv4-sp-d16")
#
yaccs_update_cache_var(CMAKE_C_FLAGS_MINSIZEREL "-mcpu=cortex-m4")
yaccs_update_cache_var(CMAKE_C_FLAGS_MINSIZEREL "-mfloat-abi=hard")
yaccs_update_cache_var(CMAKE_C_FLAGS_MINSIZEREL "-mfpu=fpv4-sp-d16")
yaccs_update_cache_var(CMAKE_CXX_FLAGS_MINSIZEREL "-mcpu=cortex-m4")
yaccs_update_cache_var(CMAKE_CXX_FLAGS_MINSIZEREL "-mfloat-abi=hard")
yaccs_update_cache_var(CMAKE_CXX_FLAGS_MINSIZEREL "-mfpu=fpv4-sp-d16")
