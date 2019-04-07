# ---------------------------------------------------------------------------- #
# yaccs / flags / gcc static libstdc++
#
# Nicolas Clauvelin (n.clauvelin+code@gmail.com)
# nicocvn.com, 2019
#
#
# MODULE:   yaccs
#
# MANIFEST:
#   Enable static build against libstdc++.
#
# ---------------------------------------------------------------------------- #


# Guard.
if(DEFINED __yaccs_static_libstdcxx)
    return()
endif()
set(__yaccs_static_libstdcxx 1)

 
# Enable static libstdc++.
yaccs_update_cache_var(CMAKE_C_FLAGS_DEBUG "-static-libstdc++")
yaccs_update_cache_var(CMAKE_CXX_FLAGS_DEBUG "-static-libstdc++")
#
yaccs_update_cache_var(CMAKE_C_FLAGS_RELEASE "-static-libstdc++")
yaccs_update_cache_var(CMAKE_CXX_FLAGS_RELEASE "-static-libstdc++")
#
yaccs_update_cache_var(CMAKE_C_FLAGS_RELWITHDEBINFO "-static-libstdc++")
yaccs_update_cache_var(CMAKE_CXX_FLAGS_RELWITHDEBINFO "-static-libstdc++")
#
yaccs_update_cache_var(CMAKE_C_FLAGS_MINSIZEREL "-static-libstdc++")
yaccs_update_cache_var(CMAKE_CXX_FLAGS_MINSIZEREL "-static-libstdc++")
