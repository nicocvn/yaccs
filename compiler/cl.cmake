# ---------------------------------------------------------------------------- #
# yaccs / compiler / cl (MSVC)
#
# Nicolas Clauvelin (n.clauvelin+code@gmail.com)
# nicocvn.com, 2019
#
#
# MODULE:   yaccs
#
# MANIFEST:
#   This is configuration file for MSVC cl compiler.
#
# ---------------------------------------------------------------------------- #


# Guard.
if(DEFINED __yaccs_compilers_cl)
    return()
endif()
set(__yaccs_compilers_cl 1)


# Look for GCC executables.
find_program(_cl_c_compiler cl
             PATHS ${yaccs_compiler_paths})
find_program(_cl_cxx_compiler cl
             PATHS ${yaccs_compiler_paths})

# If executables cannot be located this is a fatal error.
if((NOT _cl_c_compiler) OR (NOT _cl_cxx_compiler))
    yaccs_fatal_error_message("Cannot locate MSVC cl executables")
endif()


# Register the compilers.
set(CMAKE_C_COMPILER "${_cl_c_compiler}"
    CACHE STRING "C compiler" FORCE)
set(CMAKE_CXX_COMPILER "${_cl_cxx_compiler}"
    CACHE STRING "C++ compiler" FORCE)
