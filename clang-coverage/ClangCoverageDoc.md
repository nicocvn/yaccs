# yaccs: CMake module for Clang-based coverage analysis #

The [enable-clang-coverage.cmake](enable-clang-coverage.cmake) CMake module can be included in a project to simplify code coverage analysis.

For example:

```console
cmake_minimum_required(VERSION 3.10)
include(cmake/yaccs/yaccs.cmake)

project(SomethingAwesome C CXX)
yaccs_system_info()
yaccs_init_build_tree()

# The coverage module should be loaded after the project declaration.
include(cmake/yaccs/clang-coverage/enable-clang-coverage.cmake)

add_executable(my_exec some.cpp)
create_clang_cov_targets_for(TARGET my_exec HTML_DIR ${CMAKE_BINARY_DIR})
```

The CMake module will add the Coverage build type using the settings of the Debug type (this can be change by setting `ClangCoverageBuildType` to the desired build type).
This additional build type enables code coverage based on Clang.
The function `create_clang_cov_targets_for(TARGET target)` can then be used to create the following targets:

* `target`-cov-preprocessing: internal target that will run the target build product and collect coverage information,
* `target`-cov-show: target that will output coverage line counts in the console side-by-side with analyzed source files,
* `target`-cov-report: target that will output the code coverage statistics for all file,
* `target`-cov-html: target that will create a HTML coverage report (the `HTML_DIR` parameter controls where the HTML report is generated).

If the target depends on shared libraries and coverage analysis is needed for these as well the `DEPS` parameter should be used:

```console
add_library(my_lib SHARED lib1.cpp lib2.cpp)
add_executable(my_exec some.cpp)
target_link_libraries(my_exec my_lib)
create_clang_cov_targets_for(TARGET my_exec DEPS my_lib)
```

Finally, the parameter `EXCLUDE_REGEX` can be used to pass a regular expression that matches directories and files to be excluded from the coverage analysis.
