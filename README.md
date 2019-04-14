# yaccs: yet another collection of CMake scripts #


## Manifest ##
For C and C++ projects CMake is one of the most complete tool (if not the *de facto* standard tool) to manage the build and install process across various platforms and compilers. Properly configuring and structuring a CMake project can, however, be cumbersome and error-prone.

Here comes *yet another collection of CMake scripts* or yaccs for short. Yaccs provides pre-defined settings for a list of platforms and compilers which makes it possible to:

* use consistent configurations across projects,
* focus on the project rather than its configuration,
* easily use non-standard compilers.


## How to use yaccs ##
Yaccs provides various configuration files (see below for a list of supported configurations) that defines all settings related to compilers and compiler flags, as well as some other platform-dependent settings.

There are mainly two ways to use yaccs:

* make the project depends explicitly on it and directly include a yaccs configuration file from within the project CMakeLists.txt,
* load a yaccs configuration file using the `CMAKE_TOOLCHAIN_FILE` variable.

### Using yaccs directly ###
This is the recommended and simplest way and to use yaccs:

1. Create the file yaccs-user-config.cmake next to the project main CMakeLists.cmake,
2. In this file indicate the configuration file to be loaded:

    ```
    # Adjust user-defined options.
    # more details below

    # Linux / gcc-8 / C++11.
    include(/path/to/yaccs/linux_gcc-8_cxx11.cmake)
    ```

3. In the project main CMakeLists.txt add:

    ```
    # This has to be included before the call to project()
    include(/path/to/yaccs/yaccs.cmake)
    ```

It is often easier to include yaccs within the project (e.g. as a Git submodule) so that a relative path can be used in the CMakeLists.txt file; for example, if yaccs is available in a cmake directory at the root of the project it is enough to use:

```
include(cmake/yaccs/linux_gcc-8_cxx11.cmake)
```

In addition, the file yaccs-user-config.cmake can be added to the Git ignore file so that developers can decide which configuration they want to use.

### Toolchain file method ###
The other way to use yaccs is to load a configuration file as a toolchain file:

```
cmake -DCMAKE_TOOLCHAIN_FILE=/path/to/yaccs/linux_gcc-8_cxx11.cmake \
    /path/to/project/
    ...
```

This method is useful when building third-party projects directly but comes with the limitation that user-defined options cannot be used (see below).

### User-defined options ###
Several options can be customized by the user (the options are listed in the table below). To customize any of these options the user should create a yaccs-user-config.cmake next to the project CMakeLists.txt. This file will be automatically loaded by yaccs.

In particular, the `yaccs_compiler_paths` can be used to define a list of paths in which CMake will look to find compiler executables.

| Option                    | Description                   | Default       |
|:--------------------------|:------------------------------|:-------------:|
| `yaccs_compiler_paths`    | Search paths for compilers    | empty         |
| `yaccs_DEFAULT_ARCH`      | CPU architecture (GCC, Clang) | nehalem       |
| `yaccs_OSX_TARGET`        | macOS deployment target       | 10.13         |
| `yaccs_VS_SYSTEM_VERSION` | Windows VS deployment target  | 8.1           |
| `yaccs_VS_WINDOWS_TARGET` | Windows deployment target     | 8.1           |


## Typical CMakeLists ##
```
# CMake minimal version.
cmake_minimum_required(VERSION 3.13)

# Yaccs.
include(cmake/yaccs/yaccs.cmake)

# Define project.
project(AwesomeProj C CXX)

# Set up build tree.
yaccs_init_build_tree()

# Show configuration.
yaccs_system_info()

# ...

```

## Supported configurations ##
Configuration filenames are defined as `platform_compiler_feature.cmake` where:

* `platform` indicates the target platform, e.g. macos or linux (this can also be a hardware platform, for example, cortex-m),
* `compiler` indicates the compiler, e.g. gcc-8 or msvc,
* `feature` is optional and can a combination of features (`feat1_feat2_...`), for example, `cxx11_static` indicates a configuration using C++11 standard and static builds.

### GCC ARM Embedded Toolchain ###
Yaccs provides configurations for the GCC ARM Embedded Toolchain and supports Cortex-M0+, Cortex-M3, and Cortex-M4.

* [cortex-m_gcc-arm_m0+_cxx11](cortex-m_gcc-arm_m0+_cxx11.cmake)
* [cortex-m_gcc-arm_m0+_cxx14](cortex-m_gcc-arm_m0+_cxx14.cmake)
* [cortex-m_gcc-arm_m3_cxx11](cortex-m_gcc-arm_m3_cxx11.cmake)
* [cortex-m_gcc-arm_m3_cxx14](cortex-m_gcc-arm_m3_cxx14.cmake)
* [cortex-m_gcc-arm_m4_cxx11](cortex-m_gcc-arm_m4_cxx11.cmake)
* [cortex-m_gcc-arm_m4_cxx14](cortex-m_gcc-arm_m4_cxx14.cmake)

### macOS ###
Yaccs provides configurations for macOS that supports AppleClang, GCC-8, and Clang-8.

* [macos_apple-clang_cxx11](macos_apple-clang_cxx11.cmake)
* [macos_apple-clang_cxx14](macos_apple-clang_cxx14.cmake)
* [macos_clang-8_cxx11](macos_clang-8_cxx11.cmake)
* [macos_clang-8_cxx14](macos_clang-8_cxx14.cmake)
* [macos_gcc-8_cxx11](macos_gcc-8_cxx11.cmake)
* [macos_gcc-8_cxx11_static](macos_gcc-8_cxx11_static.cmake)
* [macos_gcc-8_cxx14](macos_gcc-8_cxx14.cmake)
* [macos_gcc-8_cxx14_static](macos_gcc-8_cxx14_static.cmake)

### Linux ###
Yaccs provides configurations for macOS that supports GCC-8, and Clang-8.

* [linux_clang-8_cxx11](linux_clang-8_cxx11.cmake)
* [linux_clang-8_cxx11_rtlib](linux_clang-8_cxx11_rtlib.cmake)
* [linux_clang-8_cxx11_static](linux_clang-8_cxx11_static.cmake)
* [linux_clang-8_cxx11_static_rtlib](linux_clang-8_cxx11_static_rtlib.cmake)
* [linux_clang-8_cxx14](linux_clang-8_cxx14.cmake)
* [linux_clang-8_cxx14_rtlib](linux_clang-8_cxx14_rtlib.cmake)
* [linux_clang-8_cxx14_static](linux_clang-8_cxx14_static.cmake)
* [linux_clang-8_cxx14_static_rtlib](linux_clang-8_cxx14_static_rtlib.cmake)
* [linux_gcc-8_cxx11](linux_gcc-8_cxx11.cmake)
* [linux_gcc-8_cxx11_static](linux_gcc-8_cxx11_static.cmake)
* [linux_gcc-8_cxx14](linux_gcc-8_cxx14.cmake)
* [linux_gcc-8_cxx14_static](linux_gcc-8_cxx14_static.cmake)

#### Remarks ####

* When using static build with gcc-8, the Debug build type will fail to compile due to the presence of the sanitizers options (which are not available as static libraries).
* When building with clang (in non static mode), it is required to set `LD_LIBRARY_PATH` to the location of the shared libraries of the clang toolchain (or to adjust the build products rpath).
* In general, when using static build and static linking it might be required to adjust the libraries being linked.
