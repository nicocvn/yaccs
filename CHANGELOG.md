# Changelog
This is the changelog for the yaccs project. All notable changes to the project should be documented here.


## Unreleased
### Added
### Changed
### Deprecated
### Removed
### Fixed
### Security


# 2.5.1 - 2022-04-06

### Fixed

- Fix typo in Bullseye region target.


# 2.5.0 - 2022-04-06

### Added

- Add CMake module to support coverage analysis using BullseyeCoverage tool.

### Fixed

- Fix typo in Clang coverage CMake module: `create_clang_cov_targers_for` is now replaced by `create_clang_cov_targets_for` (original function is still available).

### Deprecated

- `create_clang_cov_targers_for` in the CMake Clang coverage module; use `create_clang_cov_targets_for` instead.


# 2.4.1 - 2022-04-06

### Fixed

- Fix issues with SSE in Clang configurations for Apple M1.


## 2.4.0 - 2022-04-01

### Added

- Add configuration flag to support Apple M1 in Clang configurations.


## 2.3.0 - 2022-02-24

### Added

- Add configurations to support LLVM Clang 13.0.0 compiler.


## 2.2.4 - 2022-01-25

### Added
- Add Linux and macOS configurations with C++17 support.


## 2.2.3 - 2022-01-21

### Added
- Add support for Cortex-M configurations with C++17 support.


## 2.2.2 - 2020-03-28

### Added
- Add a CMake option to enable semi-hosting for GCC ARM Embedded configurations.


## 2.2.1 - 2020-01-16

### Added
- Add a CMake option to disable LTO for GCC ARM Embedded configurations.
- Add `-fstack-usage` to C and C++ compiler flags for GCC ARM Embedded configurations.


## 2.2.0 - 2019-11-22

### Added
- Add an option to define the CMake build type for the Clang-based coverage analysis.

### Changed
- Change handling of LTO settings and only enable LTO for Release and MinSizeRel CMake build types (mitigate issues during debugging in Debug mode).


## 2.1 - 2019-07-10

### Added
- Add regex option in CMake module for Clang-based coverage analysis to exclude specific files from analysis.

### Fixed
- Fix issue with linker flags in the CMake module for Clang-based coverage analysis.


## 2.0 - 2019-07-03

### Added
- Add Windows platform support for MSVC, Clang-cl, and GCC compilers.
- Add documentation for the available yaccs configurations.


## 1.1 - 2019-04-27
Add CMake module for Clang-based coverage analysis.


## 1.0 - 2019-04-14
Initial release of the project with support for GCC and Clang on macOS and Linux platforms.
