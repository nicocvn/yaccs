# ---------------------------------------------------------------------------- #
# yaccs / flags / libc++
#
# Nicolas Clauvelin (n.clauvelin+code@gmail.com)
# nicocvn.com, 2022
#
#
# MODULE:   yaccs
#
# MANIFEST:
#   Enable libc++.
#
# ---------------------------------------------------------------------------- #


# Guard.
if(DEFINED __yaccs_libcxx)
    return()
endif()
set(__yaccs_libcxx 1)


# Enable gold linker for all build types.
yaccs_update_cache_var(CMAKE_C_FLAGS_DEBUG_INIT "-stdlib=libc++")
yaccs_update_cache_var(CMAKE_CXX_FLAGS_DEBUG_INIT "-stdlib=libc++")
#
yaccs_update_cache_var(CMAKE_C_FLAGS_RELEASE_INIT "-stdlib=libc++")
yaccs_update_cache_var(CMAKE_CXX_FLAGS_RELEASE_INIT "-stdlib=libc++")
#
yaccs_update_cache_var(CMAKE_C_FLAGS_RELWITHDEBINFO_INIT "-stdlib=libc++")
yaccs_update_cache_var(CMAKE_CXX_FLAGS_RELWITHDEBINFO_INIT "-stdlib=libc++")
#
yaccs_update_cache_var(CMAKE_C_FLAGS_MINSIZEREL_INIT "-stdlib=libc++")
yaccs_update_cache_var(CMAKE_CXX_FLAGS_MINSIZEREL_INIT "-stdlib=libc++")
