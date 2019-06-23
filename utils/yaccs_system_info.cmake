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

    # Get platform.
    identify_platform(yaccs_platform)

    yaccs_status_message("==== System Information ====")
    print_system_value(yaccs_VERSION ${yaccs_VERSION})
    print_system_value(CMAKE_SYSTEM_NAME ${CMAKE_SYSTEM_NAME})
    if(CMAKE_SYSTEM_VERSION)
        print_system_value(CMAKE_SYSTEM_VERSION ${CMAKE_SYSTEM_VERSION})
    endif()
    print_system_value(CMAKE_C_COMPILER_ID ${CMAKE_C_COMPILER_ID})
    print_system_value(CMAKE_CXX_COMPILER_ID ${CMAKE_CXX_COMPILER_ID})
    print_system_value(CMAKE_C_COMPILER_VERSION ${CMAKE_C_COMPILER_VERSION})
    print_system_value(CMAKE_CXX_COMPILER_VERSION ${CMAKE_CXX_COMPILER_VERSION})
    print_system_value(CMAKE_BUILD_TYPE ${CMAKE_BUILD_TYPE})

    # Specific to macOS.
    if(yaccs_platform STREQUAL "Darwin")
        yaccs_status_message("macOS deployment target: ${CMAKE_OSX_DEPLOYMENT_TARGET}")
    endif()

    # Specific to Windows.
    if(yaccs_platform STREQUAL "Windows")
        yaccs_status_message("CMake system version: ${CMAKE_SYSTEM_VERSION}")
        yaccs_status_message("MSCV target platform version: ${CMAKE_VS_WINDOWS_TARGET_PLATFORM_VERSION}")
    endif()

    yaccs_status_message("============================")

endfunction()

