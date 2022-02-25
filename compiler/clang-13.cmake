# ---------------------------------------------------------------------------- #
# yaccs / compiler / clang-13
#
# Nicolas Clauvelin (n.clauvelin+code@gmail.com)
# nicocvn.com, 2019
#
#
# MODULE:   yaccs
#
# MANIFEST:
#   This is configuration file for clang-13.
#
# ---------------------------------------------------------------------------- #


# Guard.
if(DEFINED __yaccs_compilers_clang-13)
    return()
endif()
set(__yaccs_compilers_clang-13 1)


# Look for clang-13 main executable.
find_program(_clang_13_compiler clang-13
             PATHS ${yaccs_compiler_paths})

# If executable cannot be located this is a fatal error.
if(NOT _clang_13_compiler)
    yaccs_fatal_error_message("Cannot locate clang-13 executable")
endif()


# Get path to clang-13 installation.
# By design, clang-13 lives next to clang and clang++ which are the C and C++
# compilers.
get_filename_component(_clang_path ${_clang_13_compiler} DIRECTORY)


# Register the compilers.
set(CMAKE_C_COMPILER "${_clang_path}/clang"
    CACHE STRING "C compiler" FORCE)
set(CMAKE_CXX_COMPILER "${_clang_path}/clang++"
    CACHE STRING "C++ compiler" FORCE)
