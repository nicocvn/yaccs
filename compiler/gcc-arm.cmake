# ---------------------------------------------------------------------------- #
# yaccs / compiler / gcc-arm
#
# Nicolas Clauvelin (n.clauvelin+code@gmail.com)
# nicocvn.com, 2019
#
#
# MODULE:   yaccs
#
# MANIFEST:
#   This is configuration file for the GCC ARM Embedded Toolchain.
#
# ---------------------------------------------------------------------------- #


# Guard.
if(DEFINED __yaccs_compilers_gcc-arm)
    return()
endif()
set(__yaccs_compilers_gcc-arm 1)


# Look for GCC executables.
find_program(_gcc_arm_c_compiler arm-none-eabi-gcc
             PATHS ${yaccs_compiler_paths})
find_program(_gcc_arm_cxx_compiler arm-none-eabi-g++
             PATHS ${yaccs_compiler_paths})

# If executables cannot be located this is a fatal error.
if((NOT _gcc_arm_c_compiler) OR (NOT _gcc_arm_cxx_compiler))
    yaccs_fatal_error_message("Cannot locate arm-none-eabi-gcc executables")
endif()


# Register the compilers.
set(CMAKE_C_COMPILER "${_gcc_arm_c_compiler}"
    CACHE STRING "C compiler" FORCE)
set(CMAKE_CXX_COMPILER "${_gcc_arm_cxx_compiler}"
    CACHE STRING "C++ compiler" FORCE)


# Get the path to binaries.
get_filename_component(arm_toolchain_path "${_gcc_arm_c_compiler}" DIRECTORY)


# Register other toolchain executables.
set(CMAKE_LINKER ${arm_toolchain_path}/arm-none-eabi-ld
    CACHE FILEPATH "Toolchain linker command" FORCE)
#
set(CMAKE_OBJCOPY ${arm_toolchain_path}/arm-none-eabi-objcopy
    CACHE FILEPATH "Toolchain objcopy command" FORCE)
#
set(CMAKE_OBJDUMP ${arm_toolchain_path}/arm-none-eabi-objdump
    CACHE FILEPATH "Toolchain objdump command" FORCE)
#
set(CMAKE_NM ${arm_toolchain_path}/arm-none-eabi-gcc-nm
    CACHE FILEPATH "Toolchain nm command" FORCE)
#
set(CMAKE_AR ${arm_toolchain_path}/arm-none-eabi-gcc-ar
    CACHE FILEPATH "Toolchain ar command" FORCE)
#
set(CMAKE_RANLIB ${arm_toolchain_path}/arm-none-eabi-gcc-ranlib
    CACHE FILEPATH "Toolchain ranlib command" FORCE)
#
set(CMAKE_STRIP ${arm_toolchain_path}/arm-none-eabi-strip
    CACHE FILEPATH "Toolchain strip command" FORCE)


# CMAKE_FIND_ROOT_PATH
set(CMAKE_FIND_ROOT_PATH ${arm_toolchain_path}/../)

# Never search for programs in the build host directories.
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)

# For libraries and headers only look in targets directory.
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
