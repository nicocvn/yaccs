# ---------------------------------------------------------------------------- #
# yaccs / flags / gcc static libgcc
#
# Nicolas Clauvelin (n.clauvelin+code@gmail.com)
# nicocvn.com, 2019
#
#
# MODULE:   yaccs
#
# MANIFEST:
#   Enable static build against libgcc.
#
# ---------------------------------------------------------------------------- #


# Guard.
if(DEFINED __yaccs_static_libgcc)
    return()
endif()
set(__yaccs_static_libgcc 1)

 
# Enable static libgcc.
yaccs_update_cache_var(CMAKE_C_FLAGS_DEBUG "-static-libgcc")
yaccs_update_cache_var(CMAKE_CXX_FLAGS_DEBUG "-static-libgcc")
#
yaccs_update_cache_var(CMAKE_C_FLAGS_RELEASE "-static-libgcc")
yaccs_update_cache_var(CMAKE_CXX_FLAGS_RELEASE "-static-libgcc")
#
yaccs_update_cache_var(CMAKE_C_FLAGS_RELWITHDEBINFO "-static-libgcc")
yaccs_update_cache_var(CMAKE_CXX_FLAGS_RELWITHDEBINFO "-static-libgcc")
#
yaccs_update_cache_var(CMAKE_C_FLAGS_MINSIZEREL "-static-libgcc")
yaccs_update_cache_var(CMAKE_CXX_FLAGS_MINSIZEREL "-static-libgcc")
