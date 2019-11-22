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


if(NOT _clang_path)
    message(FATAL_ERROR "(clang-cov) Clang coverage module requires a yaccs Clang configuration")
endif()


# Add the Coverage build type.
set(CMAKE_CONFIGURATION_TYPES "${CMAKE_CONFIGURATION_TYPES};Coverage"
    CACHE STRING "" FORCE)


set(BuildType "DEBUG")
if(ClangCoverageBuildType)
  string(TOUPPER ${ClangCoverageBuildType} BuildType)
endif()
message(STATUS "(clang-cov) Using build type ${BuildType} for coverage")


# Set flags for the Coverage type using the current Debug flags.
yaccs_set_cache_var_from_list(CMAKE_C_FLAGS_COVERAGE
                              "${CMAKE_C_FLAGS_${BuildType}}")
yaccs_set_cache_var_from_list(CMAKE_CXX_FLAGS_COVERAGE
                              "${CMAKE_CXX_FLAGS_${BuildType}}")
yaccs_set_cache_var_from_list(CMAKE_EXE_LINKER_FLAGS_COVERAGE
                              "${CMAKE_EXE_LINKER_FLAGS_${BuildType}}")
yaccs_set_cache_var_from_list(CMAKE_STATIC_LINKER_FLAGS_COVERAGE
                              "${CMAKE_STATIC_LINKER_FLAGS_${BuildType}}")
yaccs_set_cache_var_from_list(CMAKE_SHARED_LINKER_FLAGS_COVERAGE
                              "${CMAKE_SHARED_LINKER_FLAGS_${BuildType}}")


# Add the clang coverage flags for compilers.
yaccs_update_cache_var(CMAKE_C_FLAGS_COVERAGE "-fprofile-instr-generate")
yaccs_update_cache_var(CMAKE_C_FLAGS_COVERAGE "-fcoverage-mapping")
yaccs_update_cache_var(CMAKE_CXX_FLAGS_COVERAGE "-fprofile-instr-generate")
yaccs_update_cache_var(CMAKE_CXX_FLAGS_COVERAGE "-fcoverage-mapping")

# Add linker flags.
yaccs_update_cache_var(CMAKE_EXE_LINKER_FLAGS_COVERAGE
                       "-fprofile-instr-generate")
yaccs_update_cache_var(CMAKE_SHARED_LINKER_FLAGS_COVERAGE
                       "-fprofile-instr-generate")


# create_clang_cov_targers_for:
#   function to update a cache variable and add a new value to it
#
# \param TARGET:            target for which to enable code coverage
# \param DEPS:              dependent targets to analyze (e.g. shared libs)
#
# This function creates the following target (XXX stands for the TARGET name:
# - XXX-cov-preprocessing:
#     run the target and collect coverage information
# - XXX-cov-show:
#     show coverage line counts stats in the console
# - XXX-cov-report:
#     show coverage report in the console
# - XXX-cov-html:
#     create HTML coverage report
function(create_clang_cov_targers_for)

    # Define function interface.
    set(options "")
    set(one_value_args TARGET HTML_DIR EXCLUDE_REGEX)
    set(multi_value_args DEPS)

    # Parse arguments.
    cmake_parse_arguments(clang_cov_args
                          "${options}"
                          "${one_value_args}"
                          "${multi_value_args}" ${ARGN})

    # Shorthands.
    set(covTarget ${clang_cov_args_TARGET})
    set(llvmBinDir ${_clang_path})  # This comes from the compiler support.
    set(htmlDir ${clang_cov_args_HTML_DIR})

    # Check if target is valid.
    if(NOT TARGET ${covTarget})
        message(FATAL_ERROR "(clang-cov) Invalid target ${clang_cov_args_TARGET}")
    endif()

    # Build dependencies list.
    set(object_opts "")
    foreach(dep IN LISTS clang_cov_args_DEPS)
        string(COMPARE EQUAL "" "${object_opts}" is_empty)
        if (is_empty)
            set(object_opts "-object $<TARGET_FILE_NAME:${dep}>")
        else()
            set(object_opts "${object_opts},$<TARGET_FILE_NAME:${dep}>")
        endif()
    endforeach(dep)

    # Build exclude list.
    set(exclude_opts "")
    string(COMPARE EQUAL "" "${clang_cov_args_EXCLUDE_REGEX}" is_empty)
    if (NOT is_empty)
        set(exclude_opts "-ignore-filename-regex=\"${clang_cov_args_EXCLUDE_REGEX}\"")
    endif()

    # Update target compile and link flags for coverage.
    set_target_properties(${covTarget}
                          PROPERTIES
                          COMPILE_FLAGS "-fprofile-instr-generate -fcoverage-mapping"
                          LINK_FLAGS "-fprofile-instr-generate")
    message(STATUS "(clang-cov) Coverage enabled for ${covTarget}")

    # Create pre-processing target.
    add_custom_target(${covTarget}-cov-preprocessing
                      COMMAND LLVM_PROFILE_FILE=${covTarget}.profraw $<TARGET_FILE:${covTarget}>
                      COMMAND ${llvmBinDir}/llvm-profdata merge -sparse ${covTarget}.profraw -o ${covTarget}.profdata
                      WORKING_DIRECTORY ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}
                      DEPENDS ${covTarget})
    message(STATUS "(clang-cov) Coverage pre-processing target ${covTarget}-cov-preprocessing created")

    # Coverage show target.
    add_custom_target(${covTarget}-cov-show
                      COMMAND ${llvmBinDir}/llvm-cov show
                      $<TARGET_FILE_NAME:${covTarget}> -instr-profile=${covTarget}.profdata -show-line-counts-or-regions ${object_opts} ${exclude_opts}
                      WORKING_DIRECTORY ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}
                      DEPENDS ${covTarget}-cov-preprocessing)
    message(STATUS "(clang-cov) Coverage show target ${covTarget}-cov-show created")

    # Coverage report target.
    add_custom_target(${covTarget}-cov-report
                      COMMAND echo ${object_opts}
                      COMMAND ${llvmBinDir}/llvm-cov report $<TARGET_FILE_NAME:${covTarget}> -instr-profile=${covTarget}.profdata ${object_opts} ${exclude_opts}
                      WORKING_DIRECTORY ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}
                      DEPENDS ${covTarget}-cov-preprocessing)
    message(STATUS "(clang-cov) Coverage report target ${covTarget}-cov-report created")

    # Coverage HTML report target.
    add_custom_target(${covTarget}-cov-html
                      COMMAND ${llvmBinDir}/llvm-cov show $<TARGET_FILE_NAME:${covTarget}> -instr-profile=${covTarget}.profdata -show-line-counts-or-regions -output-dir=${htmlDir}/${covTarget}-cov-html -format="html" ${object_opts} "${exclude_opts}"
                      WORKING_DIRECTORY ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}
                      DEPENDS ${covTarget}-cov-preprocessing)
    add_custom_command(TARGET ${covTarget}-cov-html POST_BUILD
                       COMMAND ;
                       COMMENT "Open ${htmlDir}/${covTarget}-cov-html/index.html in your browser to view the coverage report.")
    message(STATUS "(clang-cov) Coverage html report target ${covTarget}-cov-html created")

endfunction()
