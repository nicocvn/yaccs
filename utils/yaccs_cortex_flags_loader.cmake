# ---------------------------------------------------------------------------- #
# yaccs / utils / cortex flags loader
#
# Nicolas Clauvelin (n.clauvelin+code@gmail.com)
# nicocvn.com, 2019
#
#
# MODULE:   yaccs
#
# ---------------------------------------------------------------------------- #


# Guard.
if(DEFINED __yaccs_cortex_flags_loader)
    return()
endif()
set(__yaccs_cortex_flags_loader 1)


# Store script location.
set(__yaccs_cortex_flags_loader_dir "${CMAKE_CURRENT_LIST_DIR}")


# yaccs_load_cortex_flags:
#   function to load the relevant mcpu flags based on a config filename.
#
# \arg filename:            config filename
function(yaccs_load_cortex_flags filename)

    # Check filename against cxxYY patterns.
    string(REGEX MATCH "m0+" load_m0p "${filename}")
    string(REGEX MATCH "m3" load_m3 "${filename}")
    string(REGEX MATCH "m4" load_m4 "${filename}")

    # Load relevant flags.
    if(load_m0p)
        include(${_yaccs_std_cxx_loader_dir}/../flags/cortex-m0+.cmake)
    endif()
    if(load_m3)
        include(${_yaccs_std_cxx_loader_dir}/../flags/cortex-m3.cmake)
    endif()
    if(load_m4)
        include(${_yaccs_std_cxx_loader_dir}/../flags/cortex-m4.cmake)
    endif()

endfunction()
