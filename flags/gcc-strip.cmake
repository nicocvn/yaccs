# ---------------------------------------------------------------------------- #
# yaccs / flags / gcc strip
#
# Nicolas Clauvelin (n.clauvelin+code@gmail.com)
# nicocvn.com, 2019
#
#
# MODULE:   yaccs
#
# MANIFEST:
#   Enable stripping for Release and MinSizeRel build types.
#
# ---------------------------------------------------------------------------- #


# Enable garbage collection in the linker.
yaccs_update_cache_var(CMAKE_EXE_LINKER_FLAGS_RELEASE
                       "-Wl,-s")
#
yaccs_update_cache_var(CMAKE_EXE_LINKER_FLAGS_MINSIZEREL
                       "-Wl,-s")
