# ---------------------------------------------------------------------------- #
# yaccs / utils / cxx standard loader
#
# Nicolas Clauvelin (n.clauvelin+code@gmail.com)
# nicocvn.com, 2019
#
#
# MODULE:   yaccs
#
# ---------------------------------------------------------------------------- #


# Guard.
if(DEFINED __yaccs_std_cxx_loader)
    return()
endif()
set(__yaccs_std_cxx_loader 1)


# Store script location.
set(_yaccs_std_cxx_loader_dir "${CMAKE_CURRENT_LIST_DIR}")


# yaccs_load_std_cxx:
#   function to load the relevant C++ standard flags based on a config filename.
#
# \arg filename:            config filename (e.g. macos_clang-8_cxx11.cmake)
function(yaccs_load_std_cxx filename)

    # Check filename against cxxYY patterns.
    string(REGEX MATCH "cxx11" load_cxx11 "${filename}")
    string(REGEX MATCH "cxx14" load_cxx14 "${filename}")
    string(REGEX MATCH "cxx17" load_cxx17 "${filename}")

    # Load relevant flags.
    if(load_cxx11)
        include(${_yaccs_std_cxx_loader_dir}/../flags/std-cxx11.cmake)
    endif()
    if(load_cxx14)
        include(${_yaccs_std_cxx_loader_dir}/../flags/std-cxx14.cmake)
    endif()
    if(load_cxx17)
        include(${_yaccs_std_cxx_loader_dir}/../flags/std-cxx17.cmake)
    endif()

endfunction()
