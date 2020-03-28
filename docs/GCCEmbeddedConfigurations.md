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


## Disabling LTO ##
By default LTO is enabled for Release and MinSizeRel build types. It can be disabled by defining the CMake option `yaccs_gcc_arm_disable_lto` to `ON`. This option can be defined in the configuration user file (yaccs-user-config.cmake) or pass to CMake directly. For example, adding the following to yaccs-user-config.cmake will disable LTO:

```
set(yaccs_gcc_arm_disable_lto ON)
```


## Enabling semi-hosting ##
Semi-hosting can be enabled for all configurations supporting the GCC ARM Embedded toolchain. To enable semi-hosting the option `yaccs_gcc_arm_enable_semihosting` must be defined and set to `ON`. By default it is disabled.

Note that, semi-hosting capabilities depend on the debug probe and targeted hardware, and that semi-hosting generally impact runtime performance. In addition, specifics software elements might be required for semi-hosting to function properly (see compiler documentation).


## Remarks ##
* These configurations are designed for bare metal projects.
