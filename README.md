# yaccs: yet another collection of CMake scripts #


## Manifest ##
For C and C++ projects CMake is one of the most complete tool (if not the *de facto* standard tool) to manage the build and install process across various platforms and compilers. Properly configuring and structuring a CMake project can, however, be cumbersome and error-prone.

Here comes *yet another collection of CMake scripts* or yaccs for short. Yaccs provides pre-defined settings for a list of platforms and compilers which makes it possible to:

* use consistent configurations across projects,
* focus on the project rather than its configuration,
* easily use non-standard compilers,
* avoid (as much as possible) messy CMake code to deal with compilers, flags, and other stuff.


## How to use yaccs ##
Yaccs provides ready-to-use CMake configurations for various platforms and compilers (the full list is accessible below). Look at the [commented example](docs/Example.md) to see how yaccs should be used in a CMake project.


## Supported configurations ##
The yaccs configurations are CMake file named as `platform_compiler_feature.cmake` with:

* `platform` indicates the target platform, e.g. macos or linux (this can also be a hardware platform, for example, cortex-m),
* `compiler` indicates the compiler, e.g. gcc-8 or msvc,
* `feature` is optional and can a combination of features (`feat1_feat2_...`), for example, `cxx11_static` indicates a configuration using C++11 standard and static builds.

The supported configurations files are all located at the root of this repository and more information is available for each of the supported platforms:

* [GCC ARM Embedded configurations](docs/GCCEmbeddedConfigurations.md)
* [Linux configurations](docs/LinuxConfigurations.md)
* [macOS configurations](docs/macOSConfigurations.md)
* [Windows configurations](docs/WindowsConfigurations.md)


## Yaccs and CMake build types ##
Yaccs defines the four traditional CMake build types (Debug, Release, RelWithDebInfo, and MinSizeReal) and set the Debug type as default if none is explicitly selected (by setting CMAKE_BUILD_TYPE). Specific compiler flags and options are defined for these build types: for example, configurations that support sanitizers only enable them for the Debug build type. Note that, for some CMake generator the build type is not applicable during generation (e.g. Visual Studio or XCode generator) and should be selected at build time (using the `--config` option of CMake).

### Build directories ###
As show in the [example](docs/Example.md), yaccs provides the `yaccs_init_build_tree` function. This function will automatically defines the build directories based on the build type.


## User-defined options ##
Several options can be customized by the user in the yaccs-user-config.cmake file (see the [example](docs/Example.md). In particular:

* `yaccs_compiler_paths` can be set to a list of paths that will be searched to find the requested compiler (useful if the compiler is not in a standard location),
* `yaccs_DEFAULT_ARCH [STRING]` controls the target architecture used for the build process for GCC and Clang; it is by default set to `nehalem`.
* `yaccs_APPLE_M1 [BOOL]` enables support for Apple M1 in Clang configurations (it is OFF by default).

Other options are available for [macOS](docs/macOSConfigurations.md) and [Windows](docs/WindowsConfigurations.md) configurations


## Notes about compiler support ##
* Yaccs support for Clang is limited to Clang 8.0.0 and it is recommended to install the pre-built binaries from the LLVM project; it might work with other versions and/or custom installations but it has not been tested.
* Yaccs support for GCC is limited to GCC-8 and GCC-9.
* Yaccs support for MSVC (Visual Studio) is limited to version 15 and 16.


## Clang-based coverage ##
Yaccs provides an easy to use CMake module to enable Clang-based code coverage analysis. [More information](clang-coverage/ClangCoverageDoc.md)
