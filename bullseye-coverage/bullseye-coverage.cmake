# ---------------------------------------------------------------------------- #
# CMake module for Bullseye Coverage support.
#
# Nicolas Clauvelin (n.clauvelin+code@gmail.com)
# nicocvn.com, 2022
#
#
# MODULE:   yaccs
#
# MANIFEST:
#   - Functions to enable code coverage report using Bullseye coverage
#
# This module will register a new build type, BullseyeCoverage, which provides
# specific targets to perform coverage analysis of selected targets.
#
# ---------------------------------------------------------------------------- #


# Find bullseye command line tools.
# These tools must be accessible in the PATH.
find_program(COVC_PROGRAM covc
             REQUIRED)
find_program(COVSELECT_PROGRAM covselect
             REQUIRED)
if(COVC_PROGRAM-NOTFOUND)
    message(FATAL_ERROR "...")
endif()
if(COVSELECT_PROGRAM-NOTFOUND)
    message(FATAL_ERROR "...")
endif()
get_filename_component(BullseyeCov_DIR "${COVC_PROGRAM}" PATH)
get_filename_component(BullseyeCov_DIR "${BullseyeCov_DIR}" PATH)
message(STATUS
        "(bullseye-cov) Bullseye installation directory: ${BullseyeCov_DIR}")


# Add the BullseyeCoverage build type.
set(CMAKE_CONFIGURATION_TYPES "${CMAKE_CONFIGURATION_TYPES};BullseyeCoverage"
    CACHE STRING "" FORCE)


# BAse build type to perform coverage.
set(BuildType "DEBUG")
if(BullseyeCoverageBuildType)
    string(TOUPPER ${BullseyeCoverageBuildType} BuildType)
endif()
message(STATUS "(bullseye-cov) Using build type ${BuildType} for coverage")


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


# _set_target_for_bullseye:
#   function to configure a target for bullseye coverage
#
# \param TARGET:            target to configure
# \param COVILE:            path to the Bullseye coverage file
# \param HOOK:              hook target for coverage file management
#
# This function is called automatically.
function(_set_target_for_bullseye)

    # Define function interface.
    set(options "")
    set(one_value_args TARGET COVFILE HOOK)

    # Parse arguments.
    cmake_parse_arguments(args
                          "${options}"
                          "${one_value_args}"
                          "${multi_value_args}" ${ARGN})

    # Log.
    message(STATUS
            "(bullseye-cov) Enabling coverage for target ${args_TARGET}")

    # Set precompiler.
    set_target_properties(${args_TARGET}
                          PROPERTIES
                          C_COMPILER_LAUNCHER
                          "${COVC_PROGRAM};--file;${args_COVFILE};--no-banner"
                          CXX_COMPILER_LAUNCHER
                          "${COVC_PROGRAM};--file;${args_COVFILE};--no-banner")

    # Link against bullseye coverage library.
    target_link_libraries(${args_TARGET}
                          ${BullseyeCov_DIR}/lib/libcov.a)

    # Inject hook.
    add_dependencies(${args_TARGET} ${args_HOOK})

endfunction()


# enable_bullseye_coverage_for_target:
#   function to enable and configure target for Bullseye coverage
#
# \param TARGET:            target for which to enable coverage analysis
# \param COV_SRC_DIR:       base directory for source files to analyze
# \param HTML_DIR:          output directory for HTML report
# \param DEPS:              list of dependent targets to analyze (optional)
#
# This function creates the following targets (XXX stands for the TARGET name):
# - XXX-bullseye-preprocessing:
#     run the target and collect coverage information
# - XXX-bullseye-report:
#     show coverage report in the console
# - XXX-bullseye-html-report:
#     create HTML coverage report
#
# Configuring a target for Bullseye coverage with this function will
# automatically manage the coverage file (named XXX_bullseye.cov).
function(enable_bullseye_coverage_for_target)

    # Define function interface.
    set(options "")
    set(one_value_args TARGET COV_SRC_DIR HTML_DIR)
    set(multi_value_args DEPS)

    # Parse arguments.
    cmake_parse_arguments(cov_args
                          "${options}"
                          "${one_value_args}"
                          "${multi_value_args}" ${ARGN})

    # Coverage file.
    set(bullseye_COVFILE ${CMAKE_SOURCE_DIR}/${cov_args_TARGET}_bullseye.cov)

    # Get relative path for coverage source directory.
    file(RELATIVE_PATH region_DIR ${CMAKE_SOURCE_DIR} ${cov_args_COV_SRC_DIR})

    # Custom target for regions management.
    add_custom_target(${cov-args_TARGET}-bullseye-regions
                      COMMAND ${CMAKE_COMMAND} -E rm -f ${bullseye_COVFILE}
                      COMMAND ${COVSELECT_PROGRAM} --file ${bullseye_COVFILE} --deleteAll --no-banner
                      COMMAND ${COVSELECT_PROGRAM} --no-banner --file ${bullseye_COVFILE} --add "${region_DIR}/"
                      COMMAND ${COVSELECT_PROGRAM} --file ${bullseye_COVFILE} --list --no-banner
                      WORKING_DIRECTORY ${CMAKE_SOURCE_DIR})

    # Set bullseye coverage pre-compiler for main target and dependencies.
    _set_target_for_bullseye(TARGET ${cov_args_TARGET}
                             COVFILE ${bullseye_COVFILE}
                             HOOK ${cov-args_TARGET}-bullseye-regions)
    foreach(dep IN LISTS cov_args_DEPS)
        _set_target_for_bullseye(TARGET ${dep}
                                 COVFILE ${bullseye_COVFILE}
                                 HOOK ${cov-args_TARGET}-bullseye-regions)
    endforeach(dep)

    # Pre-processing target.
    # This target essentially builds and run the executable generating
    # coverage data.
    add_custom_target(${cov_args_TARGET}-bullseye-preprocessing
                      COMMAND ${CMAKE_COMMAND} -E env COVFILE=${bullseye_COVFILE} $<TARGET_FILE:${cov_args_TARGET}>
                      WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
                      DEPENDS ${cov_args_TARGET})
    message(STATUS
            "(bullseye-cov) Bullseye coverage pre-processing target ${cov_args_TARGET}-bullseye-preprocessing created")

    # Coverage report target.
    add_custom_target(${cov_args_TARGET}-bullseye-report
                      COMMAND ${BullseyeCov_DIR}/bin/covsrc --file ${bullseye_COVFILE} --no-banner
                      WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
                      DEPENDS ${cov_args_TARGET}-bullseye-preprocessing)
    message(STATUS
            "(bullseye-cov) Bullseye coverage report target ${cov_args_TARGET}-bullseye-report created")

    # Coverage HTML report.
    add_custom_target(${cov_args_TARGET}-bullseye-html-report
                      COMMAND ${BullseyeCov_DIR}/bin/covhtml --file ${bullseye_COVFILE} ${cov_args_HTML_DIR} --no-banner
                      COMMAND ${CMAKE_COMMAND} -E echo "report generated in ${cov_args_HTML_DIR}"
                      WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
                      DEPENDS ${cov_args_TARGET}-bullseye-preprocessing)
    add_custom_command(TARGET ${cov_args_TARGET}-bullseye-html-report POST_BUILD
                       COMMAND ;
                       COMMENT "Open ${cov_args_HTML_DIR}/index.html in your browser to view the coverage report.")
    message(STATUS
            "(bullseye-cov) Bullseye coverage report target ${cov_args_TARGET}-bullseye-html-report created")

endfunction()
