# ---------------------------------------------------------------------------- #
# yaccs / flags / clang rtlib
#
# Nicolas Clauvelin (n.clauvelin+code@gmail.com)
# nicocvn.com, 2019
#
#
# MODULE:   yaccs
#
# MANIFEST:
#   Enable compiler-rt for clang.
#
# ---------------------------------------------------------------------------- #


# Guard.
if(DEFINED __yaccs_clang_rtlib)
    return()
endif()
set(__yaccs_clang_rtlib 1)


# Enable compiler-rt; this required to link against libunwind.
yaccs_update_cache_var(CMAKE_EXE_LINKER_FLAGS_DEBUG "-rtlib=compiler-rt")
yaccs_update_cache_var(CMAKE_EXE_LINKER_FLAGS_DEBUG "-Wl,-lunwind")
#
yaccs_update_cache_var(CMAKE_EXE_LINKER_FLAGS_RELEASE "-rtlib=compiler-rt")
yaccs_update_cache_var(CMAKE_EXE_LINKER_FLAGS_RELEASE "-Wl,-lunwind")
#
yaccs_update_cache_var(CMAKE_EXE_LINKER_FLAGS_RELWITHDEBINFO "-rtlib=compiler-rt")
yaccs_update_cache_var(CMAKE_EXE_LINKER_FLAGS_RELWITHDEBINFO "-Wl,-lunwind")
#
yaccs_update_cache_var(CMAKE_EXE_LINKER_FLAGS_MINSIZEREL "-rtlib=compiler-rt")
yaccs_update_cache_var(CMAKE_EXE_LINKER_FLAGS_MINSIZEREL "-Wl,-lunwind")
