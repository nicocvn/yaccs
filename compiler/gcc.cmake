# ---------------------------------------------------------------------------- #
# yaccs / compiler / GCC
#
# Nicolas Clauvelin (n.clauvelin+code@gmail.com)
# nicocvn.com, 2022
#
#
# MODULE:   yaccs
#
# MANIFEST:
#   This is configuration file for GCC.
#
# ---------------------------------------------------------------------------- #


# Guard.
if(DEFINED __yaccs_compilers_gcc)
    return()
endif()
set(__yaccs_compilers_gcc 1)


# By default yaccs will look for gcc and g++ executables; if the option
# `yaccs_compiler_version_suffix` is defined then it will look for:
# gcc-${yaccs_compiler_version_suffix} and g++-{yaccs_compiler_version_suffix}.


# Executables.
set(_gcc_c_compiler_executable gcc)
set(_gcc_cxx_compiler_executable g++)
if(DEFINED yaccs_compiler_version_suffix)
    set(_gcc_c_compiler_executable gcc-${yaccs_compiler_version_suffix})
    set(_gcc_cxx_compiler_executable g++-${yaccs_compiler_version_suffix})
endif()


# Look for GCC executables.
find_program(_gcc_c_compiler ${_gcc_c_compiler_executable}
             PATHS ${yaccs_compiler_paths})
find_program(_gcc_cxx_compiler ${_gcc_cxx_compiler_executable}
             PATHS ${yaccs_compiler_paths})

# If executables cannot be located this is a fatal error.
if((NOT _gcc_c_compiler) OR (NOT _gcc_cxx_compiler))
    yaccs_fatal_error_message("Cannot locate gcc executables")
else()
    yaccs_status_message("GCC C compiler: ${_gcc_c_compiler}")
    yaccs_status_message("GCC C++ compiler: ${_gcc_cxx_compiler}")
endif()


# Register the compilers.
set(CMAKE_C_COMPILER "${_gcc_c_compiler}"
    CACHE STRING "C compiler" FORCE)
set(CMAKE_CXX_COMPILER "${_gcc_cxx_compiler}"
    CACHE STRING "C++ compiler" FORCE)
