# ---------------------------------------------------------------------------- #
# yaccs / compiler / clang-cl
#
# Nicolas Clauvelin (n.clauvelin+code@gmail.com)
# nicocvn.com, 2019
#
#
# MODULE:   yaccs
#
# MANIFEST:
#   This is configuration file for clang-cl.
#   This is for Windows platform and since the binary are not named with a
#   specific version we just look for clang-cl.
#
# ---------------------------------------------------------------------------- #


# Guard.
if(DEFINED __yaccs_compilers_clang-cl)
    return()
endif()
set(__yaccs_compilers_clang-cl 1)


# Look for clang-8 main executable.
find_program(_clang_cl_compiler clang-cl
             PATHS ${yaccs_compiler_paths})

# If executable cannot be located this is a fatal error.
if(NOT _clang_cl_compiler)
    yaccs_fatal_error_message("Cannot locate clang-cl executable")
endif()


# Get path to clang-cl installation.
get_filename_component(_clang_path ${_clang_cl_compiler} DIRECTORY)


# Register the compilers and the linker.
# The linker is required to be defined for this particular configuration.
set(CMAKE_C_COMPILER "${_clang_path}/clang-cl.exe"
    CACHE STRING "C compiler" FORCE)
set(CMAKE_CXX_COMPILER "${_clang_path}/clang-cl.exe"
    CACHE STRING "C++ compiler" FORCE)
set(CMAKE_LINKER "${_clang_path}/lld-link.exe"
    CACHE STRING "Linker" FORCE)
