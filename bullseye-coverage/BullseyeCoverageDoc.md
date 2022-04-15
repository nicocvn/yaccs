# yaccs: CMake module for Bullseye Coverage analysis #

The [bullseye-coverage.cmake](bullseye-coverage.cmake) CMake module can be included in a project to simplify setting up targets for coverage analysis using Bullseye.

For example:

```console
cmake_minimum_required(VERSION 3.10)
include(cmake/yaccs/yaccs.cmake)

project(SomethingAwesome C CXX)
yaccs_system_info()
yaccs_init_build_tree()

# The coverage module should be loaded after the project declaration.
include(cmake/yaccs/clang-coverage/bullseye-coverage.cmake)

add_executable(my_exec some.cpp)
enable_bullseye_coverage_for_target(
    TARGET my_exec
    COV_SRC_DIR ${CMAKE_SOURCE_DIR}/my-sources
    HTML_DIR ${CMAKE_BINARY_DIR}/my_exec-html-cov-report)
```

The CMake module will add the BullseyeCoverage build type using the settings of the Debug type (this can be change by setting `BullseyeCoverageBuildType` to the desired build type).
This additional build type enables code coverage based on Bullseye.
The function `enable_bullseye_coverage_for_target(TARGET target)` can then be used to create the following targets:

* `target`-bullseye-preprocessing: internal target that will run the target build product and collect coverage information,
* `target`-bullseye-report: target that will output the code coverage statistics for all file on the command line,
* `target`-bullseye-html-report: target that will create a HTML coverage report (the `HTML_DIR` parameter controls where the HTML report is generated).

If the target depends on shared libraries and coverage analysis is needed for these as well the `DEPS` parameter should be used:

```console
add_library(my_lib SHARED lib1.cpp lib2.cpp)
add_executable(my_exec some.cpp)
target_link_libraries(my_exec my_lib)
enable_bullseye_coverage_for_target(TARGET my_exec DEPS my_lib
                                    ...)
```
