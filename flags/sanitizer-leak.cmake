# ---------------------------------------------------------------------------- #
# yaccs / flags / leak sanitizer
#
# Nicolas Clauvelin (n.clauvelin+code@gmail.com)
# nicocvn.com, 2019
#
#
# MODULE:   yaccs
#
# MANIFEST:
#   Enable sanitizer for memory leaks.
#
# ---------------------------------------------------------------------------- #


# Guard.
if(DEFINED __yaccs_sanitizer_leak)
    return()
endif()
set(__yaccs_sanitizer_leak 1)


# Enable sanitizers for Debug build type only.
yaccs_update_cache_var(CMAKE_C_FLAGS_DEBUG "-fsanitize=leak")
#
yaccs_update_cache_var(CMAKE_CXX_FLAGS_DEBUG "-fsanitize=leak")
