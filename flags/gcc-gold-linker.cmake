# ---------------------------------------------------------------------------- #
# yaccs / flags / gcc gold linker
#
# Nicolas Clauvelin (n.clauvelin+code@gmail.com)
# nicocvn.com, 2019
#
#
# MODULE:   yaccs
#
# MANIFEST:
#   Enable gold linker for gcc.
#
# ---------------------------------------------------------------------------- #


# Guard.
if(DEFINED __yaccs_gcc_gold)
    return()
endif()
set(__yaccs_gcc_gold 1)


# Enable gold linker for all build types.
yaccs_update_cache_var(CMAKE_EXE_LINKER_FLAGS_DEBUG "-fuse-ld=gold")
yaccs_update_cache_var(CMAKE_EXE_LINKER_FLAGS_RELEASE "-fuse-ld=gold")
yaccs_update_cache_var(CMAKE_EXE_LINKER_FLAGS_RELWITHDEBINFO "-fuse-ld=gold")
yaccs_update_cache_var(CMAKE_EXE_LINKER_FLAGS_MINSIZEREL "-fuse-ld=gold")
#
yaccs_update_cache_var(CMAKE_SHARED_LINKER_FLAGS_DEBUG "-fuse-ld=gold")
yaccs_update_cache_var(CMAKE_SHARED_LINKER_FLAGS_RELEASE "-fuse-ld=gold")
yaccs_update_cache_var(CMAKE_SHARED_LINKER_FLAGS_RELWITHDEBINFO "-fuse-ld=gold")
yaccs_update_cache_var(CMAKE_SHARED_LINKER_FLAGS_MINSIZEREL "-fuse-ld=gold")
