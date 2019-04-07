# ---------------------------------------------------------------------------- #
# yaccs / flags / dead-code
#
# Nicolas Clauvelin (n.clauvelin+code@gmail.com)
# nicocvn.com, 2019
#
#
# MODULE:   yaccs
#
# MANIFEST:
#   Enable dead-code optimization for clang and gcc (this comes on top of LTO),
#   This not apply to the Debug build type.
#
# ---------------------------------------------------------------------------- #


# Enable function and data sections for all build types except Debug.
yaccs_update_cache_var(CMAKE_C_FLAGS_RELEASE "-ffunction-sections")
yaccs_update_cache_var(CMAKE_C_FLAGS_RELEASE "-fdata-sections")
yaccs_update_cache_var(CMAKE_CXX_FLAGS_RELEASE "-ffunction-sections")
yaccs_update_cache_var(CMAKE_CXX_FLAGS_RELEASE "-fdata-sections")
#
yaccs_update_cache_var(CMAKE_C_FLAGS_RELWITHDEBINFO "-ffunction-sections")
yaccs_update_cache_var(CMAKE_C_FLAGS_RELWITHDEBINFO "-fdata-sections")
yaccs_update_cache_var(CMAKE_CXX_FLAGS_RELWITHDEBINFO "-ffunction-sections")
yaccs_update_cache_var(CMAKE_CXX_FLAGS_RELWITHDEBINFO "-fdata-sections")
#
yaccs_update_cache_var(CMAKE_C_FLAGS_MINSIZEREL "-ffunction-sections")
yaccs_update_cache_var(CMAKE_C_FLAGS_MINSIZEREL "-fdata-sections")
yaccs_update_cache_var(CMAKE_CXX_FLAGS_MINSIZEREL "-ffunction-sections")
yaccs_update_cache_var(CMAKE_CXX_FLAGS_MINSIZEREL "-fdata-sections")


# Enable garbage collection in the linker.
yaccs_update_cache_var(CMAKE_EXE_LINKER_FLAGS_RELEASE
                       "-Wl,--gc-sections")
#
yaccs_update_cache_var(CMAKE_EXE_LINKER_FLAGS_RELWITHDEBINFO
                       "-Wl,--gc-sections")
#
yaccs_update_cache_var(CMAKE_EXE_LINKER_FLAGS_MINSIZEREL
                       "-Wl,--gc-sections")
