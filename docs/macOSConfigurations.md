# yaccs: macOS support #


## Supported configurations ##
Yaccs provides macOS configurations for the following compilers:

* GCC-8 and GCC-9 (typically installed via Homebrew),
* AppleClang (system compiler),
* Clang-8.

List of configurations:

* [macos_apple-clang_cxx11](../macos_apple-clang_cxx11.cmake)
* [macos_apple-clang_cxx14](../macos_apple-clang_cxx14.cmake)
* [macos_clang-8_cxx11](../macos_clang-8_cxx11.cmake)
* [macos_clang-8_cxx14](../macos_clang-8_cxx14.cmake)
* [macos_gcc-8_cxx11](../macos_gcc-8_cxx11.cmake)
* [macos_gcc-8_cxx11_static](../macos_gcc-8_cxx11_static.cmake)
* [macos_gcc-8_cxx14](../macos_gcc-8_cxx14.cmake)
* [macos_gcc-8_cxx14_static](../macos_gcc-8_cxx14_static.cmake)
* [macos_gcc-9_cxx11](../macos_gcc-9_cxx11.cmake)
* [macos_gcc-9_cxx11_static](../macos_gcc-9_cxx11_static.cmake)
* [macos_gcc-9_cxx14](../macos_gcc-9_cxx14.cmake)
* [macos_gcc-9_cxx14_static](../macos_gcc-9_cxx14_static.cmake)


## User configuration ##
The following variables can be defined in the user configuration file (yaccs-user-config.cmake):

* `yaccs_OSX_TARGET`: variable used to define the macOS version to target for deployment (default is 10.13); this sets the CMake variable `CMAKE_OSX_DEPLOYMENT_TARGET`.


## Remarks ##
When building with GCC compilers, the resulting build products will be linked against the GCC libraries (e.g. libstdc++) in addition to the macOS system libraries. It is possible to use a static build configuration to avoid linking against the GCC libraries, however, in the Debug configurations the build products will still be linked against the sanitizers shared libraries (e.g. ASAN).
