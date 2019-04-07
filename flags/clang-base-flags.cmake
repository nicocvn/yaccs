# ---------------------------------------------------------------------------- #
# yaccs / flags / clang-base-flags
#
# Nicolas Clauvelin (n.clauvelin+code@gmail.com)
# nicocvn.com, 2019
#
#
# MODULE:   yaccs
#
# MANIFEST:
#   These are the minimal flags for clang, covering all build types.
#
# ---------------------------------------------------------------------------- #


# Guard.
if(DEFINED __yaccs_clang_base_flags)
    return()
endif()
set(__yaccs_clang_base_flags 1)


# --- Common flags ---

# Common C flags.
set(yaccs_C_COMMON_FLAGS
    -fvisibility=hidden             # Symbols hidden by default.
    -fexceptions                    # Enable exception handling for C code.
    -march=${yaccs_DEFAULT_ARCH}    # Default architecture.
    )

# Common C++ flags.
set(yaccs_CXX_COMMON_FLAGS
    -fvisibility=hidden             # Symbols hidden by default.
    -march=${yaccs_DEFAULT_ARCH}    # Default architecture.
    )


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
    -Wreturn-type
    # Optimization.
    -O1
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
    -Wreturn-type
    -Weffc++
    # Optimization.
    -O1
    )

# Linker debug flags.
set(yaccs_LINKER_DEBUG_FLAGS
    )


# --- Release flags ---

# C release flags.
set(yaccs_C_RELEASE_FLAGS
    ${yaccs_C_COMMON_FLAGS}
    # Architecture.
    -mfpmath=sse
    # Optimization.
    -O2
    -DNDEBUG
    )

# C++ release flags.
set(yaccs_CXX_RELEASE_FLAGS
    ${yaccs_CXX_COMMON_FLAGS}
    # Architecture.
    -mfpmath=sse
    # Optimization.
    -O2
    -DNDEBUG
    )


# --- RelWithDebInfo flags ---

# C release with debug info flags.
set(yaccs_C_RELWITHDEBINFO_FLAGS
    ${yaccs_C_COMMON_FLAGS}
    # Architecture
    -mfpmath=sse
    # Optimization with debug symbols.
    -O2
    -DNDEBUG
    )

# C++ release flags.
set(yaccs_CXX_RELWITHDEBINFO_FLAGS
    ${yaccs_CXX_COMMON_FLAGS}
    # Architecture.
    -mfpmath=sse
    # Optimization with debug symbols.
    -O2
    -DNDEBUG
    )


# --- MinSizeRel flags ---

# C minimal size release flags.
set(yaccs_C_MINSIZEREL_FLAGS
    ${yaccs_C_COMMON_FLAGS}
    # Architecture.
    -mfpmath=sse
    # Optimization.
    -Os
    -DNDEBUG
    )

# C++ minimal size release flags.
set(yaccs_CXX_MINSIZEREL_FLAGS
    ${yaccs_CXX_COMMON_FLAGS}
    # Architecture.
    -mfpmath=sse
    # Optimization.
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
