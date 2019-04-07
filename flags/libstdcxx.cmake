# ---------------------------------------------------------------------------- #
# yaccs / flags / stdlibc++
#
# Nicolas Clauvelin (n.clauvelin+code@gmail.com)
# nicocvn.com, 2019
#
#
# MODULE:   yaccs
#
# MANIFEST:
#   Enable stdlibc++.
#
# ---------------------------------------------------------------------------- #


# Guard.
if(DEFINED __yaccs_libcxx)
    return()
endif()
set(__yaccs_libcxx 1)


# Enable gold linker for all build types.
yaccs_update_cache_var(CMAKE_C_FLAGS_DEBUG "-stdlib=libstdc++")
yaccs_update_cache_var(CMAKE_CXX_FLAGS_DEBUG "-stdlib=libstdc++")
#
yaccs_update_cache_var(CMAKE_C_FLAGS_RELEASE "-stdlib=libstdc++")
yaccs_update_cache_var(CMAKE_CXX_FLAGS_RELEASE "-stdlib=libstdc++")
#
yaccs_update_cache_var(CMAKE_C_FLAGS_RELWITHDEBINFO "-stdlib=libstdc++")
yaccs_update_cache_var(CMAKE_CXX_FLAGS_RELWITHDEBINFO "-stdlib=libstdc++")
#
yaccs_update_cache_var(CMAKE_C_FLAGS_MINSIZEREL "-stdlib=libstdc++")
yaccs_update_cache_var(CMAKE_CXX_FLAGS_MINSIZEREL "-stdlib=libstdc++")
