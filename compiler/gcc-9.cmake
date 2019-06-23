# ---------------------------------------------------------------------------- #
# yaccs / compiler / gcc-9
#
# Nicolas Clauvelin (n.clauvelin+code@gmail.com)
# nicocvn.com, 2019
#
#
# MODULE:   yaccs
#
# MANIFEST:
#   This is configuration file for gcc-9.
#
# ---------------------------------------------------------------------------- #


# Guard.
if(DEFINED __yaccs_compilers_gcc-9)
    return()
endif()
set(__yaccs_compilers_gcc-9 1)


# Look for GCC executables.
find_program(_gcc_9_c_compiler gcc-9
             PATHS ${yaccs_compiler_paths})
find_program(_gcc_9_cxx_compiler g++-9
             PATHS ${yaccs_compiler_paths})

# If executables cannot be located this is a fatal error.
if((NOT _gcc_9_c_compiler) OR (NOT _gcc_9_cxx_compiler))
    yaccs_fatal_error_message("Cannot locate gcc-9 executables")
endif()


# Register the compilers.
set(CMAKE_C_COMPILER "${_gcc_9_c_compiler}"
    CACHE STRING "C compiler" FORCE)
set(CMAKE_CXX_COMPILER "${_gcc_9_cxx_compiler}"
    CACHE STRING "C++ compiler" FORCE)
