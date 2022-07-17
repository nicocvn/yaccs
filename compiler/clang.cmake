# ---------------------------------------------------------------------------- #
# yaccs / compiler / clang
#
# Nicolas Clauvelin (n.clauvelin+code@gmail.com)
# nicocvn.com, 2022
#
#
# MODULE:   yaccs
#
# MANIFEST:
#   This is configuration file for clang.
#
# ---------------------------------------------------------------------------- #


# Guard.
if(DEFINED __yaccs_compilers_clang)
    return()
endif()
set(__yaccs_compilers_clang 1)


# By default yaccs will look for gcc and g++ executables; if the option
# `yaccs_compiler_version_suffix` is defined then it will look for:
# clang-${yaccs_compiler_version_suffix} and
# clang++-{yaccs_compiler_version_suffix}.


# Executables.
set(_clang_c_compiler_executable clang)
set(_clang_cxx_compiler_executable clang++)
if(DEFINED yaccs_compiler_version_suffix)
    set(_clang_c_compiler_executable clang-${yaccs_compiler_version_suffix})
    set(_clang_cxx_compiler_executable clang++-${yaccs_compiler_version_suffix})
endif()


# Look for clang executables.
find_program(_clang_c_compiler ${_clang_c_compiler_executable}
             PATHS ${yaccs_compiler_paths}
             NO_DEFAULT_PATH)
find_program(_clang_cxx_compiler ${_clang_cxx_compiler_executable}
             PATHS ${yaccs_compiler_paths}
             NO_DEFAULT_PATH)
if((NOT _clang_c_compiler) OR (NOT _clang_cxx_compiler))
    find_program(_clang_c_compiler ${_clang_c_compiler_executable}
                 PATHS ${yaccs_compiler_paths})
    find_program(_clang_cxx_compiler ${_clang_cxx_compiler_executable}
                 PATHS ${yaccs_compiler_paths})
endif()

# If executables cannot be located this is a fatal error.
if((NOT _clang_c_compiler) OR (NOT _clang_cxx_compiler))
    yaccs_fatal_error_message("Cannot locate clang executables")
else()
    yaccs_status_message("Clang C compiler: ${_clang_c_compiler}")
    yaccs_status_message("Clang C++ compiler: ${_clang_cxx_compiler}")
endif()


# Register the compilers.
set(CMAKE_C_COMPILER "${_clang_c_compiler}"
    CACHE STRING "C compiler" FORCE)
set(CMAKE_CXX_COMPILER "${_clang_cxx_compiler}"
    CACHE STRING "C++ compiler" FORCE)
