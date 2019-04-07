# ---------------------------------------------------------------------------- #
# yaccs / flags / address sanitizer
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
if(DEFINED __yaccs_sanitizer_addr)
    return()
endif()
set(__yaccs_sanitizer_addr 1)


# Enable sanitizers for Debug build type only.
yaccs_update_cache_var(CMAKE_C_FLAGS_DEBUG "-fsanitize=address")
#
yaccs_update_cache_var(CMAKE_CXX_FLAGS_DEBUG "-fsanitize=address")
