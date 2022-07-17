# ---------------------------------------------------------------------------- #
# yaccs / flags / debug-levels
#
# Nicolas Clauvelin (n.clauvelin+code@gmail.com)
# nicocvn.com, 2022
#
#
# MODULE:   yaccs
#
# MANIFEST:
#   Set debug levels for the various build types.
#
# ---------------------------------------------------------------------------- #


# Enable all debugging symbols for all build types.
yaccs_update_cache_var(CMAKE_C_FLAGS_DEBUG_INIT "-g3")
yaccs_update_cache_var(CMAKE_CXX_FLAGS_DEBUG_INIT "-g3")
#
yaccs_update_cache_var(CMAKE_C_FLAGS_RELEASE_INIT "-g1")
yaccs_update_cache_var(CMAKE_CXX_FLAGS_RELEASE_INIT "-g1")
#
yaccs_update_cache_var(CMAKE_C_FLAGS_RELWITHDEBINFO_INIT "-g3")
yaccs_update_cache_var(CMAKE_CXX_FLAGS_RELWITHDEBINFO_INIT "-g3")
#
yaccs_update_cache_var(CMAKE_C_FLAGS_MINSIZEREL_INIT "-g0")
yaccs_update_cache_var(CMAKE_CXX_FLAGS_MINSIZEREL_INIT "-g0")
