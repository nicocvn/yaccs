# ---------------------------------------------------------------------------- #
# yaccs / platform / windows
#
# Nicolas Clauvelin (n.clauvelin+code@gmail.com)
# nicocvn.com, 2019
#
#
# MODULE:   yaccs
#
# MANIFEST:
#   Settings for windows platforms.
#
# ---------------------------------------------------------------------------- #


# Set system version and platform target for MSVC.
set(CMAKE_SYSTEM_VERSION "${yaccs_VS_SYSTEM_VERSION}"
    CACHE STRING "Windows system version for MSVC" FORCE)
set(CMAKE_VS_WINDOWS_TARGET_PLATFORM_VERSION "${yaccs_VS_WINDOWS_TARGET}"
    CACHE STRING "Windows MSVC platform target" FORCE)

# Set platform architecture if using the Visual Studio generator.
if(CMAKE_GENERATOR MATCHES "Visual Studio*")
    set(CMAKE_GENERATOR_PLATFORM "${yaccs_VS_PLATFORM}"
       CACHE STRING "Windows MSVC platform architecture" FORCE)
endif()
