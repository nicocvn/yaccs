# ---------------------------------------------------------------------------- #
# yaccs / flags / no semihosting
#
# Nicolas Clauvelin (n.clauvelin+code@gmail.com)
# nicocvn.com, 2019
#
#
# MODULE:   yaccs
#
# MANIFEST:
#   Disable semihosting for GCC ARM
#
# ---------------------------------------------------------------------------- #


# Guard.
if(DEFINED __yaccs_gcc_arm_nosys)
    return()
endif()
set(__yaccs_gcc_arm_nosys 1)


# Enable newlib nano libc.
yaccs_update_cache_var(CMAKE_EXE_LINKER_FLAGS_DEBUG
                       "--specs=nosys.specs")
yaccs_update_cache_var(CMAKE_EXE_LINKER_FLAGS_RELEASE
                       "--specs=nosys.specs")
yaccs_update_cache_var(CMAKE_EXE_LINKER_FLAGS_RELWITHDEBINFO
                       "--specs=nosys.specs")
yaccs_update_cache_var(CMAKE_EXE_LINKER_FLAGS_MINSIZEREL
                       "--specs=nosys.specs")
