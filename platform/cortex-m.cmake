# ---------------------------------------------------------------------------- #
# yaccs / platform / cortex-m
#
# Nicolas Clauvelin (n.clauvelin+code@gmail.com)
# nicocvn.com, 2022
#
#
# MODULE:   yaccs
#
# MANIFEST:
#   Settings for ARM Cortex-M platforms.
#
# ---------------------------------------------------------------------------- #


# CMAKE_SYSTEM_NAME
# For bare metal it is recommended to use Generic.
set(CMAKE_SYSTEM_NAME Generic)

# CMAKE_SYSTEM_PROCESSOR
set(CMAKE_SYSTEM_PROCESSOR arm-cortex-${yaccs_cortex_variant})

# Indicate that we are cross-compiling (executables cannot run on the host)
set(CMAKE_CROSSCOMPILING TRUE)         # executables cannot run on the host

# Do not check compilers.
set(CMAKE_C_COMPILER_WORKS TRUE)       # do not check the C compiler
set(CMAKE_CXX_COMPILER_WORKS TRUE)     # do not check the CXX compiler
