# yaccs: GCC ARM Embedded support #


## Supported configurations ##
List of configurations:

* [cortex-m_gcc-arm_m0+_cxx11](../cortex-m_gcc-arm_m0+_cxx11.cmake)
* [cortex-m_gcc-arm_m0+_cxx14](../cortex-m_gcc-arm_m0+_cxx14.cmake)
* [cortex-m_gcc-arm_m3_cxx11](../cortex-m_gcc-arm_m3_cxx11.cmake)
* [cortex-m_gcc-arm_m3_cxx14](../cortex-m_gcc-arm_m3_cxx14.cmake)
* [cortex-m_gcc-arm_m4_cxx11](../cortex-m_gcc-arm_m4_cxx11.cmake)
* [cortex-m_gcc-arm_m4_cxx14](../cortex-m_gcc-arm_m4_cxx14.cmake)

Note that, the GCC ARM Embedded official binaries do not include any version numbers. Therefore the selection of a version is done by selecting a specific path using the `yaccs_compiler_paths` variable.


## Remarks ##
* These configurations are designed for bare metal projects.
* The latest version of the GCC ARM Embedded toolchain (8-2018-q4) suffers from various bugs (e.g. https://bugs.launchpad.net/gcc-arm-embedded/+bug/1814397) so the previous version (7-2018-q2) is currently recommended until a new version is released.
