# ---------------------------------------------------------------------------- #
# yaccs / compiler / mingw gcc for windows
#
# Nicolas Clauvelin (n.clauvelin+code@gmail.com)
# nicocvn.com, 2019
#
#
# MODULE:   yaccs
#
# MANIFEST:
#   This is configuration file for MinGW gcc on windows.
#   MinGW GCC binaries are not numbered ... so we just look for gcc.
#
# ---------------------------------------------------------------------------- #


# Guard.
if(DEFINED __yaccs_compilers_gcc-win)
    return()
endif()
set(__yaccs_compilers_gcc-win 1)


# Look for GCC executables.
find_program(_gcc_win_c_compiler gcc
             PATHS ${yaccs_compiler_paths})
find_program(_gcc_win_cxx_compiler g++
             PATHS ${yaccs_compiler_paths})

# If executables cannot be located this is a fatal error.
if((NOT _gcc_win_c_compiler) OR (NOT _gcc_win_cxx_compiler))
    yaccs_fatal_error_message("Cannot locate gcc executables")
endif()


# Register the compilers.
set(CMAKE_C_COMPILER "${_gcc_win_c_compiler}"
    CACHE STRING "C compiler" FORCE)
set(CMAKE_CXX_COMPILER "${_gcc_win_cxx_compiler}"
    CACHE STRING "C++ compiler" FORCE)
