# ---------------------------------------------------------------------------- #
# yaccs / flags / macos code size flags
#
# Nicolas Clauvelin (n.clauvelin+code@gmail.com)
# nicocvn.com, 2022
#
#
# MODULE:   yaccs
#
# MANIFEST:
#   Enable settings for code size optimization for macos builds.
#   These settings are the equivalent of the function, data, and gc sections
#   flags.
#
# ---------------------------------------------------------------------------- #


# Enable all debugging symbols for all build types.
yaccs_update_cache_var(CMAKE_C_FLAGS_DEBUG_INIT "-gfull")
yaccs_update_cache_var(CMAKE_CXX_FLAGS_DEBUG_INIT "-gfull")
#
yaccs_update_cache_var(CMAKE_C_FLAGS_RELEASE_INIT "-gfull")
yaccs_update_cache_var(CMAKE_CXX_FLAGS_RELEASE_INIT "-gfull")
#
yaccs_update_cache_var(CMAKE_C_FLAGS_RELWITHDEBINFO_INIT "-gfull")
yaccs_update_cache_var(CMAKE_CXX_FLAGS_RELWITHDEBINFO_INIT "-gfull")
#
yaccs_update_cache_var(CMAKE_C_FLAGS_MINSIZEREL_INIT "-gfull")
yaccs_update_cache_var(CMAKE_CXX_FLAGS_MINSIZEREL_INIT "-gfull")


# Enable dead code stripping except for Debug.
yaccs_update_cache_var(CMAKE_EXE_LINKER_FLAGS_RELEASE
                        "-dead_strip")
#
yaccs_update_cache_var(CMAKE_EXE_LINKER_FLAGS_RELWITHDEBINFO
                        "-dead_strip")
#
yaccs_update_cache_var(CMAKE_EXE_LINKER_FLAGS_MINSIZEREL
                        "-dead_strip")
