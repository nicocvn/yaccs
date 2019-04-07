# ---------------------------------------------------------------------------- #
# yaccs / flags / dead-code for Debug build type
#
# Nicolas Clauvelin (n.clauvelin+code@gmail.com)
# nicocvn.com, 2019
#
#
# MODULE:   yaccs
#
# MANIFEST:
#   Enable dead-code optimization for the Debug build type (clang and gcc).
#
# ---------------------------------------------------------------------------- #


# Enable function and data sections for Debug build type.
yaccs_update_cache_var(CMAKE_C_FLAGS_DEBUG "-ffunction-sections")
yaccs_update_cache_var(CMAKE_C_FLAGS_DEBUG "-fdata-sections")
yaccs_update_cache_var(CMAKE_CXX_FLAGS_DEBUG "-ffunction-sections")
yaccs_update_cache_var(CMAKE_CXX_FLAGS_DEBUG "-fdata-sections")


# Enable garbage collection in the linker.
yaccs_update_cache_var(CMAKE_EXE_LINKER_FLAGS_DEBUG
                       "-Wl,--gc-sections")
#
yaccs_update_cache_var(CMAKE_EXE_LINKER_FLAGS_DEBUG
                       "-Wl,--gc-sections")
#
yaccs_update_cache_var(CMAKE_EXE_LINKER_FLAGS_DEBUG
                       "-Wl,--gc-sections")
