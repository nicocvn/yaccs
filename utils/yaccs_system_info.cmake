# ---------------------------------------------------------------------------- #
# yaccs / utils / system info
#
# Nicolas Clauvelin (n.clauvelin+code@gmail.com)
# nicocvn.com, 2019
#
#
# MODULE:   yaccs
#
# ---------------------------------------------------------------------------- #


# Guard.
if(DEFINED __yaccs_system_info)
    return()
endif()
set(__yaccs_system_info 1)


macro(print_system_value key value)
    yaccs_status_message("${key} = ${value}")
endmacro()


# yaccs_system_info:
#   function to output target system details
function(yaccs_system_info)

    yaccs_status_message("==== System Information ====")
    print_system_value(CMAKE_SYSTEM ${CMAKE_SYSTEM})
    print_system_value(CMAKE_SYSTEM_NAME ${CMAKE_SYSTEM_NAME})
    print_system_value(CMAKE_C_COMPILER_ID ${CMAKE_C_COMPILER_ID})
    print_system_value(CMAKE_CXX_COMPILER_ID ${CMAKE_CXX_COMPILER_ID})
    print_system_value(CMAKE_C_COMPILER_VERSION ${CMAKE_C_COMPILER_VERSION})
    print_system_value(CMAKE_CXX_COMPILER_VERSION ${CMAKE_CXX_COMPILER_VERSION})
    print_system_value(CMAKE_BUILD_TYPE ${CMAKE_BUILD_TYPE})
    yaccs_status_message("============================")

endfunction()

