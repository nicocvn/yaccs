# ---------------------------------------------------------------------------- #
# yaccs / compiler / apple-clang
#
# Nicolas Clauvelin (n.clauvelin+code@gmail.com)
# nicocvn.com, 2022
#
#
# MODULE:   yaccs
#
# MANIFEST:
#   This is configuration file for apple-clang.
#   There is nothing particular to do because this is the default compiler on
#   macOS systems and CMake will identify it.
#
# ---------------------------------------------------------------------------- #


# Guard.
if(DEFINED __yaccs_compilers_apple-clang)
    return()
endif()
set(__yaccs_compilers_apple-clang 1)
