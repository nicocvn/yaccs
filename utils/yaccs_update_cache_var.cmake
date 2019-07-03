# ---------------------------------------------------------------------------- #
# yaccs / utils / update cache variable
#
# Nicolas Clauvelin (n.clauvelin+code@gmail.com)
# nicocvn.com, 2019
#
#
# MODULE:   yaccs
#
# ---------------------------------------------------------------------------- #


# Guard.
if(DEFINED __yaccs_update_cache_var)
    return()
endif()
set(__yaccs_update_cache_var 1)


# yaccs_update_cache_var:
#   function to update a cache variable and add a new value to it
#
# \arg var_name:            name of the cache variable to update
# \arg value:               value to add to the cache variable
#
# If the value is already present in the variable the function will simply
# return.
# This function should not be called with lists! The proper way to use that
# function is, for example:
# yaccs_update_cache_var(CMAKE_C_FLAGS "-compiler-opt")
function(yaccs_update_cache_var var_name value)

    # Check if the value is already within the variable value.
    string(FIND "${${var_name}}" "${value}" value_index)

    # If they value is already stored we return.
    if(NOT value_index EQUAL -1)
        return()
    endif()

    # Store the value in the variable.
    # If the variable currently holds nothing we avoid the extra whitespace.
    string(COMPARE EQUAL "" "${${var_name}}" is_empty)
    if(is_empty)
        set("${var_name}" "${value}" CACHE STRING "" FORCE)
    else()
        set("${var_name}" "${${var_name}} ${value}" CACHE STRING "" FORCE)
    endif()

endfunction()


# yaccs_set_cache_var_from_list:
#   set a cache variable from a list
#
# \arg var_name:            name of the cache variable to set
# \arg value_list:          list of values
#
# This function is only here to manage initialization of compiler flags.
function(yaccs_set_cache_var_from_list var_name value_list)

    # Convert the list to spaced strings.
    string(REPLACE ";" " " spaced_list "${value_list}")

    set("${var_name}" "${spaced_list}" CACHE STRING "" FORCE)

endfunction()
