# ---------------------------------------------------------------------------- #
# yaccs / flags / semihosting
#
# Nicolas Clauvelin (n.clauvelin+code@gmail.com)
# nicocvn.com, 2019
#
#
# MODULE:   yaccs
#
# MANIFEST:
#   Enable semihosting for GCC ARM
#
# ---------------------------------------------------------------------------- #


# Guard.
if(DEFINED __yaccs_gcc_arm_semihosting)
    return()
endif()
set(__yaccs_gcc_arm_semihosting 1)


# Enable newlib nano libc.
yaccs_update_cache_var(CMAKE_EXE_LINKER_FLAGS_DEBUG
                       "--specs=rdimon.specs")
yaccs_update_cache_var(CMAKE_EXE_LINKER_FLAGS_RELEASE
                       "--specs=rdimon.specs")
yaccs_update_cache_var(CMAKE_EXE_LINKER_FLAGS_RELWITHDEBINFO
                       "--specs=rdimon.specs")
yaccs_update_cache_var(CMAKE_EXE_LINKER_FLAGS_MINSIZEREL
                       "--specs=rdimon.specs")
