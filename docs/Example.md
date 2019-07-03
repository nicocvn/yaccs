# yaccs: CMakeLists example #

This page shows a full example on how to use yaccs in a C/C++ CMake project. We assume that the project is organized as follows:

```console
project/
    +-- CMakeLists.txt
    +-- cmake
    |   +-- yaccs
    +-- sources
    +-- tests
    +-- yaccs-user-config.cmake
```

The CMakeLists.txt file should look like:

```console
# This is required with modern version of CMake.
cmake_minimum_required(VERSION 3.10)

# Include yaccs main CMake file.
# This will automatically look and load the user-config file.
# This has to be done before calling the project() command!
include(cmake/yaccs/yaccs.cmake)

# Define the project.
project(SomethingAwesome C CXX)

# This is optional but useful to get a sense of what is happening.
# This command will print various information about the build configuration.
yaccs_system_info()

# This is also optional but it helps by neatly organizing the build tree.
yaccs_init_build_tree()

# Add stuff from the sources directory.
add_subdirectory(sources/)

# Add stuff for testing.
add_subdirectory(tests/)
```

The user configuration file yaccs-user-config.cmake is as follows:

```console
# yaccs user config file.

# If the compiler is not in the PATH we need to tell yaccs where to find it.
set(yaccs_compiler_paths
    /usr/local/llvm-8.0.0/bin)

# We can also adjust other options (some are configuration dependent; refer to the documentation).
# This, for example, will use march=native.
set(yaccs_DEFAULT_ARCH native)

# Load the configuration.
include(cmake/yaccs/linux_clang-8_cxx14.cmake)
```

It is usually a good idea to list the user config file in the Git ignore file so that users can customize the configuration based on their systems.

