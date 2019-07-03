# yaccs: Windows support #



## Supported configurations ##
Yaccs provides Windows configurations for the following compilers:

* MinGW GCC (version 8 or later),
* clang-cl (Clang-8) *[experimental]*,
* MSVC cl (version 15 or 16).

List of configurations:

* [windows_clang-cl_cxx11](../windows_clang-cl_cxx11.cmake) *[experimental]*
* [windows_clang-cl_cxx14](../windows_clang-cl_cxx14.cmake) *[experimental]*
* [windows_clang-cl_cxx17](../windows_clang-cl_cxx17.cmake) *[experimental]*
* [windows_mingw-gcc_cxx11](../windows_mingw-gcc_cxx11.cmake)
* [windows_mingw-gcc_cxx14](../windows_mingw-gcc_cxx14.cmake)
* [windows_mingw-gcc_cxx17](../windows_mingw-gcc_cxx17.cmake)
* [windows_msvc-cl_cxx11](../windows_msvc-cl_cxx11.cmake)
* [windows_msvc-cl_cxx14](../windows_msvc-cl_cxx14.cmake)
* [windows_msvc-cl_cxx17](../windows_msvc-cl_cxx17.cmake)


## User configuration ##
The following variables can be defined in the user configuration file (yaccs-user-config.cmake):

* `yaccs_VS_SYSTEM_VERSION`: variable used to define the system version which is used by Visual Studio to select the Windows SDK  (default is 8.1); this sets the CMake variable `CMAKE_SYSTEM_VERSION`.
* `yaccs_VS_WINDOWS_TARGET`: variable used to define the Windows version targeted by Visual Studio (default is 8.1); this sets the CMake variable `CMAKE_VS_WINDOWS_TARGET_PLATFORM_VERSION`.
* `yaccs_VS_PLATFORM`: variable used to define the platform for Visual Studio (default is x64); this sets the CMake variable `CMAKE_GENERATOR_PLATFORM`.


## Remarks ##
* MinGW GCC binaries do not include the version number so the configuration will only look for GCC binaries without checking if the version is correct.
* When running CMake from the command line for MinGW builds it is necessary to force the generator to `MinGW Makefiles` (by default it will use the Visual Studio generator).
* Clang Windows binaries do not include the version number so the configuration will only look for the clang-cl binary without checking if the version is correct.
* The MSVC and clang-cl configurations do not define any specific configuration for the `/MD[d]` and/or `/MT[d]` flags. This should be done within the project.
* The clang-cl configurations do not support the Visual Studio generators and should be used with an alternative generator (e.g. Ninja, MinGW Makefiles, ...).
* The MSVC cl configurations only support the Visual Studio generators.
