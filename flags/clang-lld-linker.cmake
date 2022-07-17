# ---------------------------------------------------------------------------- #
# yaccs / flags / clang lld linker
#
# Nicolas Clauvelin (n.clauvelin+code@gmail.com)
# nicocvn.com, 2022
#
#
# MODULE:   yaccs
#
# MANIFEST:
#   Enable lld linker for clang.
#
# ---------------------------------------------------------------------------- #


# Guard.
if(DEFINED __yaccs_clang_lld)
    return()
endif()
set(__yaccs_clang_lld 1)


# Enable lld linker for all build types.
yaccs_update_cache_var(CMAKE_EXE_LINKER_FLAGS_DEBUG "-fuse-ld=lld")
yaccs_update_cache_var(CMAKE_EXE_LINKER_FLAGS_RELEASE "-fuse-ld=lld")
yaccs_update_cache_var(CMAKE_EXE_LINKER_FLAGS_RELWITHDEBINFO "-fuse-ld=lld")
yaccs_update_cache_var(CMAKE_EXE_LINKER_FLAGS_MINSIZEREL "-fuse-ld=lld")
#
yaccs_update_cache_var(CMAKE_SHARED_LINKER_FLAGS_DEBUG "-fuse-ld=lld")
yaccs_update_cache_var(CMAKE_SHARED_LINKER_FLAGS_RELEASE "-fuse-ld=lld")
yaccs_update_cache_var(CMAKE_SHARED_LINKER_FLAGS_RELWITHDEBINFO "-fuse-ld=lld")
yaccs_update_cache_var(CMAKE_SHARED_LINKER_FLAGS_MINSIZEREL "-fuse-ld=lld")
