# ---------------------------------------------------------------------------- #
# yaccs / flags / gcc-arm-base-flags
#
# Nicolas Clauvelin (n.clauvelin+code@gmail.com)
# nicocvn.com, 2019
#
#
# MODULE:   yaccs
#
# MANIFEST:
#   These are the minimal flags for GCC ARM, covering all build types.
#
# ---------------------------------------------------------------------------- #


# Guard.
if(DEFINED __yaccs_gcc_arm_base_flags)
    return()
endif()
set(__yaccs_gcc_arm_base_flags 1)


# --- Common flags ---

# Common C flags.
set(yaccs_C_COMMON_FLAGS
    -mthumb
    -g3
    -ffreestanding
    -fno-move-loop-invariants
    -fmessage-length=0
    -funsigned-char
    -fomit-frame-pointer
    -fno-exceptions
    )

# Common C++ flags.
set(yaccs_CXX_COMMON_FLAGS
    -mthumb
    -g3
    -ffreestanding
    -fno-move-loop-invariants
    -fmessage-length=0
    -funsigned-char
    -fomit-frame-pointer
    -fno-exceptions
    -fabi-version=0
    -fno-rtti
    -fno-use-cxa-atexit
    -fno-threadsafe-statics
    )


# --- Debug flags ---

set(yaccs_C_DEBUG_FLAGS
    ${yaccs_C_COMMON_FLAGS}
    # Flags.
    -Og
    -Wall
    -Wextra
    -Wunused-value
    -Wunused
    -Wmissing-declarations
    -Wmissing-include-dirs
    -Wno-unused-parameter
    -Wuninitialized
    -Wdouble-promotion
    -Wconversion
    -Wsign-conversion       # Not enabled by Wconversion
    )

# C++ debug flags.
set(yaccs_CXX_DEBUG_FLAGS
    ${yaccs_CXX_COMMON_FLAGS}
    # Flags.
    -Og
    -Wall
    -Wextra
    -Wunused-value
    -Wunused
    -Wmissing-declarations
    -Wmissing-include-dirs
    -Wno-unused-parameter
    -Wuninitialized
    -Wdouble-promotion
    -Wconversion
    -Wsign-conversion       # Not enabled by Wconversion
    -Weffc++
    )

# Linker debug flags.
set(yaccs_LINKER_DEBUG_FLAGS
    )


# --- Release flags ---

# C release flags.
set(yaccs_C_RELEASE_FLAGS
    ${yaccs_C_COMMON_FLAGS}
    -O2
    -DNDEBUG
    )

# C++ release flags.
set(yaccs_CXX_RELEASE_FLAGS
    ${yaccs_CXX_COMMON_FLAGS}
    -O2
    -DNDEBUG
    )


# --- RelWithDebInfo flags ---

# C release with debug info flags.
set(yaccs_C_RELWITHDEBINFO_FLAGS
    ${yaccs_C_COMMON_FLAGS}
    -O2
    -DNDEBUG
    )

# C++ release flags.
set(yaccs_CXX_RELWITHDEBINFO_FLAGS
    ${yaccs_CXX_COMMON_FLAGS}
    -O2
    -DNDEBUG
    )


# --- MinSizeRel flags ---

# C minimal size release flags.
set(yaccs_C_MINSIZEREL_FLAGS
    ${yaccs_C_COMMON_FLAGS}
    -Os
    -DNDEBUG
    )

# C++ minimal size release flags.
set(yaccs_CXX_MINSIZEREL_FLAGS
    ${yaccs_CXX_COMMON_FLAGS}
    -Os
    -DNDEBUG
    )


# --- Setup ---

# Debug flags.
yaccs_set_cache_var_from_list(CMAKE_C_FLAGS_DEBUG
                               "${yaccs_C_DEBUG_FLAGS}")
yaccs_set_cache_var_from_list(CMAKE_CXX_FLAGS_DEBUG
                               "${yaccs_CXX_DEBUG_FLAGS}")

# Release flags.
yaccs_set_cache_var_from_list(CMAKE_C_FLAGS_RELEASE
                               "${yaccs_C_RELEASE_FLAGS}")
yaccs_set_cache_var_from_list(CMAKE_CXX_FLAGS_RELEASE
                               "${yaccs_CXX_RELEASE_FLAGS}")

# RelWithDebInfo flags.
yaccs_set_cache_var_from_list(CMAKE_C_FLAGS_RELWITHDEBINFO
                               "${yaccs_C_RELWITHDEBINFO_FLAGS}")
yaccs_set_cache_var_from_list(CMAKE_CXX_FLAGS_RELWITHDEBINFO
                               "${yaccs_CXX_RELWITHDEBINFO_FLAGS}")

# MinSizeRel flags.
yaccs_set_cache_var_from_list(CMAKE_C_FLAGS_MINSIZEREL
                               "${yaccs_C_MINSIZEREL_FLAGS}")
yaccs_set_cache_var_from_list(CMAKE_CXX_FLAGS_MINSIZEREL
                               "${yaccs_CXX_MINSIZEREL_FLAGS}")
