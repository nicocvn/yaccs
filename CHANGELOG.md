# Changelog #
This is the changelog for the yaccs project. All notable changes to the project should be documented here.


## Unreleased
### Added
- Add a CMake option to disable LTO for GCC ARM Embedded configurations.

### Changed
### Deprecated
### Removed
### Fixed
### Security


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
