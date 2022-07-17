# ---------------------------------------------------------------------------- #
# yaccs / flags / gcc-base-flags
#
# Nicolas Clauvelin (n.clauvelin+code@gmail.com)
# nicocvn.com, 2022
#
#
# MODULE:   yaccs
#
# MANIFEST:
#   These are the minimal flags for gcc, covering all build types.
#
# ---------------------------------------------------------------------------- #


# Guard.
if(DEFINED __yaccs_gcc_base_flags)
    return()
endif()
set(__yaccs_gcc_base_flags 1)


# --- Common flags ---

# Common C flags.
set(yaccs_C_COMMON_FLAGS
    -fexceptions)                   # Enable exception handling for C code.

# Common C++ flags.
set(yaccs_CXX_COMMON_FLAGS)


# --- Debug flags ---

set(yaccs_C_DEBUG_FLAGS
    ${yaccs_C_COMMON_FLAGS}
    # Flags.
    -fno-omit-frame-pointer
    # Warnings.
    -Wall
    -Wextra
    -Wunused-value
    -Wunused
    -Wunused-parameter
    -Wunused-result
    -Wmissing-declarations
    -Wmissing-include-dirs
    -Wuninitialized
    -Wconversion
    -Wsign-conversion       # Not enabled by Wconversion
    -Wreturn-type
    )

# C++ debug flags.
set(yaccs_CXX_DEBUG_FLAGS
    ${yaccs_CXX_COMMON_FLAGS}
    # Flags.
    -fno-omit-frame-pointer
    # Warnings.
    -Wall
    -Wextra
    -Wunused-value
    -Wunused
    -Wunused-parameter
    -Wunused-result
    -Wmissing-declarations
    -Wmissing-include-dirs
    -Wuninitialized
    -Wconversion
    -Wsign-conversion       # Not enabled by Wconversion
    -Wreturn-type
    -Weffc++
    )


# --- Release flags ---

# C release flags.
set(yaccs_C_RELEASE_FLAGS
    ${yaccs_C_COMMON_FLAGS})

# C++ release flags.
set(yaccs_CXX_RELEASE_FLAGS
    ${yaccs_CXX_COMMON_FLAGS})


# --- RelWithDebInfo flags ---

# C release with debug info flags.
set(yaccs_C_RELWITHDEBINFO_FLAGS
    ${yaccs_C_COMMON_FLAGS})

# C++ release flags.
set(yaccs_CXX_RELWITHDEBINFO_FLAGS
    ${yaccs_CXX_COMMON_FLAGS})


# --- MinSizeRel flags ---

# C minimal size release flags.
set(yaccs_C_MINSIZEREL_FLAGS
    ${yaccs_C_COMMON_FLAGS})

# C++ minimal size release flags.
set(yaccs_CXX_MINSIZEREL_FLAGS
    ${yaccs_CXX_COMMON_FLAGS})


# --- Setup ---

# Debug flags.
yaccs_set_cache_var_from_list(CMAKE_C_FLAGS_DEBUG_INIT
                               "${yaccs_C_DEBUG_FLAGS}")
yaccs_set_cache_var_from_list(CMAKE_C_FLAGS_DEBUG_INIT
                               "${yaccs_CXX_DEBUG_FLAGS}")

# Release flags.
yaccs_set_cache_var_from_list(CMAKE_C_FLAGS_RELEASE_INIT
                               "${yaccs_C_RELEASE_FLAGS}")
yaccs_set_cache_var_from_list(CMAKE_CXX_FLAGS_RELEASE_INIT
                               "${yaccs_CXX_RELEASE_FLAGS}")

# RelWithDebInfo flags.
yaccs_set_cache_var_from_list(CMAKE_C_FLAGS_RELWITHDEBINFO_INIT
                               "${yaccs_C_RELWITHDEBINFO_FLAGS}")
yaccs_set_cache_var_from_list(CMAKE_CXX_FLAGS_RELWITHDEBINFO_INIT
                               "${yaccs_CXX_RELWITHDEBINFO_FLAGS}")

# MinSizeRel flags.
yaccs_set_cache_var_from_list(CMAKE_C_FLAGS_MINSIZEREL_INIT
                               "${yaccs_C_MINSIZEREL_FLAGS}")
yaccs_set_cache_var_from_list(CMAKE_CXX_FLAGS_MINSIZEREL_INIT
                               "${yaccs_CXX_MINSIZEREL_FLAGS}")

# Set visibility as hidden by default.
yaccs_set_cache_var_from_list(CMAKE_C_VISIBILITY_PRESET hidden)
yaccs_set_cache_var_from_list(CMAKE_CXX_VISIBILITY_PRESET hidden)
