# yaccs: Linux support #


## Supported configurations ##
Yaccs provides Linux configurations for the following compilers:

* GCC-8 and GCC-9,
* Clang-8.

List of configurations:

* [linux_clang-8_cxx11](../linux_clang-8_cxx11.cmake)
* [linux_clang-8_cxx11_rtlib](../linux_clang-8_cxx11_rtlib.cmake)
* [linux_clang-8_cxx11_static](../linux_clang-8_cxx11_static.cmake)
* [linux_clang-8_cxx11_static_rtlib](../linux_clang-8_cxx11_static_rtlib.cmake)
* [linux_clang-8_cxx14](../linux_clang-8_cxx14.cmake)
* [linux_clang-8_cxx14_rtlib](../linux_clang-8_cxx14_rtlib.cmake)
* [linux_clang-8_cxx14_static](../linux_clang-8_cxx14_static.cmake)
* [linux_clang-8_cxx14_static_rtlib](../linux_clang-8_cxx14_static_rtlib.cmake)
* [linux_gcc-8_cxx11](../linux_gcc-8_cxx11.cmake)
* [linux_gcc-8_cxx11_static](../linux_gcc-8_cxx11_static.cmake)
* [linux_gcc-8_cxx14](../linux_gcc-8_cxx14.cmake)
* [linux_gcc-8_cxx14_static](../linux_gcc-8_cxx14_static.cmake)
* [linux_gcc-9_cxx11](../linux_gcc-9_cxx11.cmake)
* [linux_gcc-9_cxx11_static](../linux_gcc-9_cxx11_static.cmake)
* [linux_gcc-9_cxx14](../linux_gcc-9_cxx14.cmake)
* [linux_gcc-9_cxx14_static](../linux_gcc-9_cxx14_static.cmake)


## Remarks ##
* When using static configurations, the Debug build type will fail to compile (for both GCC and Clang) due to the fact that the sanitizers libraries are only available as shared libraries (in typical installations).
* When building with clang (in non static mode), it might be required to set `LD_LIBRARY_PATH` to the location of the shared libraries of the clang toolchain (or to adjust the build products rpath).
* In general, when using static builds and static linking it might be required to adjust the libraries being linked (to account for all the dependencies).
