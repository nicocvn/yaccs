# ---------------------------------------------------------------------------- #
# yaccs / utils / common functions
#
# Nicolas Clauvelin (n.clauvelin+code@gmail.com)
# nicocvn.com, 2019
#
#
# MODULE:   yaccs
#
# ---------------------------------------------------------------------------- #


# Guard.
if(DEFINED __yaccs_common)
    return()
endif()
set(__yaccs_common 1)


# Store script location.
set(_yaccs_common_dir "${CMAKE_CURRENT_LIST_DIR}")


# Function to print yaccs messages.
function(yaccs_status_message message)
    message(STATUS "(yaccs) ${message}")
endfunction()
function(yaccs_warning_message message)
    message(WARNING "(yaccs) ${message}")
endfunction()
function(yaccs_error_message message)
    message(SEND_ERROR "(yaccs) ${message}")
endfunction()
function(yaccs_fatal_error_message message)
    message(STATUS "(yaccs) ==== yaccs fatal error ====")
    message(STATUS "(yaccs) ${message}")
    message(STATUS "(yaccs) ===========================")
    message(FATAL_ERROR "${message}")
endfunction()

