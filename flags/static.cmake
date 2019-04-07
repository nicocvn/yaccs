# ---------------------------------------------------------------------------- #
# yaccs / flags / static
#
# Nicolas Clauvelin (n.clauvelin+code@gmail.com)
# nicocvn.com, 2019
#
#
# MODULE:   yaccs
#
# MANIFEST:
#   Enable static build.
#
# ---------------------------------------------------------------------------- #


# Guard.
if(DEFINED __yaccs_static)
    return()
endif()
set(__yaccs_static 1)


# Enable static build.
yaccs_update_cache_var(CMAKE_C_FLAGS_DEBUG "-static")
yaccs_update_cache_var(CMAKE_CXX_FLAGS_DEBUG "-static")
#
yaccs_update_cache_var(CMAKE_C_FLAGS_RELEASE "-static")
yaccs_update_cache_var(CMAKE_CXX_FLAGS_RELEASE "-static")
#
yaccs_update_cache_var(CMAKE_C_FLAGS_RELWITHDEBINFO "-static")
yaccs_update_cache_var(CMAKE_CXX_FLAGS_RELWITHDEBINFO "-static")
#
yaccs_update_cache_var(CMAKE_C_FLAGS_MINSIZEREL "-static")
yaccs_update_cache_var(CMAKE_CXX_FLAGS_MINSIZEREL "-static")
