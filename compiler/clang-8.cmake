# ---------------------------------------------------------------------------- #
# yaccs / compiler / clang-8
#
# Nicolas Clauvelin (n.clauvelin+code@gmail.com)
# nicocvn.com, 2019
#
#
# MODULE:   yaccs
#
# MANIFEST:
#   This is configuration file for clang-8.
#
# ---------------------------------------------------------------------------- #


# Guard.
if(DEFINED __yaccs_compilers_clang-8)
    return()
endif()
set(__yaccs_compilers_clang-8 1)


# Look for clang-8 main executable.
find_program(_clang_8_compiler clang-8
             PATHS ${yaccs_compiler_paths})

# If executable cannot be located this is a fatal error.
if(NOT _clang_8_compiler)
    yaccs_fatal_error_message("Cannot locate clang-8 executable")
endif()


# Get path to clang-8 installation.
# By design, clang-8 lives next to clang and clang++ which are the C and C++
# compilers.
get_filename_component(_clang_path ${_clang_8_compiler} DIRECTORY)


# Register the compilers.
set(CMAKE_C_COMPILER "${_clang_path}/clang"
    CACHE STRING "C compiler" FORCE)
set(CMAKE_CXX_COMPILER "${_clang_path}/clang++"
    CACHE STRING "C++ compiler" FORCE)
