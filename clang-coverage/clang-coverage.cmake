# ---------------------------------------------------------------------------- #
# yaccs config file for linux / clang-8 / static linking + compiler-rt
#
# Nicolas Clauvelin (n.clauvelin+code@gmail.com)
# nicocvn.com, 2019
#
#
# MODULE:   yaccs
#
# MANIFEST:
#   - Functions to enable code coverage report using LLVM/Clang
#   - Requires LLVM-8.0.0
#
# ---------------------------------------------------------------------------- #


set(_ClangCoverageDir ${CMAKE_CURRENT_LIST_DIR})


# enable_clang_target_coverage:
#   add Clang coverage flags to a CMake target
#
# \param TARGET:            name of the CMake target
#
# This function should be used on all targets for which coverage report are
# required.
function(enable_clang_target_coverage)

    # Define function interface.
    set(options "")
    set(one_value_args TARGET)
    set(multi_value_args "")

    # Parse arguments.
    cmake_parse_arguments(clang_cov_args
                          "${options}"
                          "${one_value_args}"
                          "${multi_value_args}" ${ARGN})

    # Check if target is valid.
    if(NOT TARGET ${clang_cov_args_TARGET})
        message(FATAL_ERROR "(clang-cov) Invalid target ${clang_cov_args_TARGET}")
    endif()

    # Check if clang is the compiler.
    if(NOT CMAKE_C_COMPILER_ID STREQUAL "Clang")
        message(WARNING "(clang-cov) C Compiler is not Clang... ")
    endif()
    if(NOT CMAKE_CXX_COMPILER_ID STREQUAL "Clang")
        message(WARNING "(clang-cov) C++ Compiler is not Clang... ")
    endif()

    # Update target compile and link flags for coverage.
    set_target_properties(${clang_cov_args_TARGET}
                          PROPERTIES
                          COMPILE_FLAGS "-fprofile-instr-generate -fcoverage-mapping"
                          LINK_FLAGS "-fprofile-instr-generate")
    message(STATUS "(clang-cov) Coverage enabled for ${clang_cov_args_TARGET}")

endfunction()


# configure_clang_coverage_script:
#   create a bash script to run an executable and produce coverage report
#
# \param TARGET:            name of the CMake target
# \param LLVM_BIN_DIR:      LLVM binaries directory
function(configure_clang_coverage_script)

    # Define function interface.
    set(options "")
    set(one_value_args TARGET LLVM_BIN_DIR)
    set(multi_value_args "")

    # Parse arguments.
    cmake_parse_arguments(clang_cov_args
                          "${options}"
                          "${one_value_args}"
                          "${multi_value_args}" ${ARGN})

    # Check if target is valid.
    if(NOT TARGET ${clang_cov_args_TARGET})
        message(FATAL_ERROR "(clang-cov) Invalid target ${clang_cov_args_TARGET}")
    endif()

    # Configure script.
    set(Executable ${clang_cov_args_TARGET})
    set(llvm-dir ${clang_cov_args_LLVM_BIN_DIR})
    configure_file(${_ClangCoverageDir}/clang-cov-script.bash.in
                   ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/${clang_cov_args_TARGET}-cov-script.bash)

endfunction()
