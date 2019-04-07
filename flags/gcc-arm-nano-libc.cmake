# ---------------------------------------------------------------------------- #
# yaccs / flags / nano libc
#
# Nicolas Clauvelin (n.clauvelin+code@gmail.com)
# nicocvn.com, 2019
#
#
# MODULE:   yaccs
#
# MANIFEST:
#   Enable the use of nano libc (newlib) for GCC ARM.
#
# ---------------------------------------------------------------------------- #


# Guard.
if(DEFINED __yaccs_gcc_arm_nano_libc)
    return()
endif()
set(__yaccs_gcc_arm_nano_libc 1)


# Enable newlib nano libc.
yaccs_update_cache_var(CMAKE_EXE_LINKER_FLAGS_DEBUG
                       "--specs=nano.specs")
yaccs_update_cache_var(CMAKE_EXE_LINKER_FLAGS_RELEASE
                       "--specs=nano.specs")
yaccs_update_cache_var(CMAKE_EXE_LINKER_FLAGS_RELWITHDEBINFO
                       "--specs=nano.specs")
yaccs_update_cache_var(CMAKE_EXE_LINKER_FLAGS_MINSIZEREL
                       "--specs=nano.specs")
