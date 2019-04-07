# ---------------------------------------------------------------------------- #
# yaccs / utils / build tree setup
#
# Nicolas Clauvelin (n.clauvelin+code@gmail.com)
# nicocvn.com, 2019
#
#
# MODULE:   yaccs
#
# ---------------------------------------------------------------------------- #


# yaccs_init_build_tree:
#   function to initialize the CMake build tree
#
# BUILD_DIR and INSTALL_DIR can be defined by the user to use custom locations.
function(yaccs_init_build_tree)

    # Set configuration types.
    set(CMAKE_CONFIGURATION_TYPES "Debug;Release;RelWithDebInfo;MinSizeRel"
        CACHE STRING "" FORCE)

    # Default build type is Debug.
    if(NOT CMAKE_BUILD_TYPE)
        yaccs_status_message("Defaulting build type to Debug")
        set(CMAKE_BUILD_TYPE "Debug" CACHE STRING "" FORCE)
    endif()

    # Set some helper text for the GUI.
    set_property(CACHE CMAKE_BUILD_TYPE
                 PROPERTY HELPSTRING "Choose the type of build")
    set_property(CACHE CMAKE_BUILD_TYPE
                 PROPERTY STRINGS "Debug;Release;RelWithDebInfo;MinSizeRel")

    # Set the build location.
    # The double set calls are required due to some global/local conflicts.
    if(BUILD_DIR)
        get_filename_component(BUILD_DIR_FULL ${BUILD_DIR}
                               ABSOLUTE)
        set(CMAKE_BINARY_DIR "${BUILD_DIR_FULL}"
            CACHE PATH "Build products location." FORCE)
        set(CMAKE_BINARY_DIR "${BUILD_DIR_FULL}" PARENT_SCOPE)
    else()
        set(CMAKE_BINARY_DIR "${CMAKE_SOURCE_DIR}/build"
            CACHE PATH "Build products location." FORCE)
        set(CMAKE_BINARY_DIR "${CMAKE_SOURCE_DIR}/build" PARENT_SCOPE)
    endif()

    # Configure products directories depending on the build type.
    # Executables are in bin/, libraries in lib/.
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY
        "${CMAKE_BINARY_DIR}/${CMAKE_BUILD_TYPE}/bin"
        PARENT_SCOPE)
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY
        "${CMAKE_BINARY_DIR}/${CMAKE_BUILD_TYPE}/lib"
        PARENT_SCOPE)
    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY
        "${CMAKE_BINARY_DIR}/${CMAKE_BUILD_TYPE}/lib"
        PARENT_SCOPE)

    # Logging.
    yaccs_status_message("Build products location: ${CMAKE_BINARY_DIR}")

    # Set the install location.
    # The double set calls are required due to some global/local conflicts.
    if(INSTALL_DIR)
        get_filename_component(INSTALL_DIR_FULL ${INSTALL_DIR}
                               ABSOLUTE CACHE)
        set(CMAKE_INSTALL_PREFIX
            "${INSTALL_DIR_FULL}/${CMAKE_BUILD_TYPE}"
            CACHE PATH "Install location." FORCE)
    else() # PT_ARGS_PROJ_INSTALL_DIR
        set(CMAKE_INSTALL_PREFIX 
            "${CMAKE_SOURCE_DIR}/install/${CMAKE_BUILD_TYPE}"
            CACHE PATH "Install location." FORCE)
        set(CMAKE_INSTALL_PREFIX
            "${CMAKE_SOURCE_DIR}/install/${CMAKE_BUILD_TYPE}"
            PARENT_SCOPE)
    endif()

    # Sum up message.
    yaccs_status_message("Install location: ${CMAKE_INSTALL_PREFIX}")

endfunction()
