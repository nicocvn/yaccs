# ---------------------------------------------------------------------------- #
# yaccs / flags / libc++
#
# Nicolas Clauvelin (n.clauvelin+code@gmail.com)
# nicocvn.com, 2019
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
yaccs_update_cache_var(CMAKE_C_FLAGS_DEBUG "-stdlib=libc++")
yaccs_update_cache_var(CMAKE_CXX_FLAGS_DEBUG "-stdlib=libc++")
#
yaccs_update_cache_var(CMAKE_C_FLAGS_RELEASE "-stdlib=libc++")
yaccs_update_cache_var(CMAKE_CXX_FLAGS_RELEASE "-stdlib=libc++")
#
yaccs_update_cache_var(CMAKE_C_FLAGS_RELWITHDEBINFO "-stdlib=libc++")
yaccs_update_cache_var(CMAKE_CXX_FLAGS_RELWITHDEBINFO "-stdlib=libc++")
#
yaccs_update_cache_var(CMAKE_C_FLAGS_MINSIZEREL "-stdlib=libc++")
yaccs_update_cache_var(CMAKE_CXX_FLAGS_MINSIZEREL "-stdlib=libc++")
