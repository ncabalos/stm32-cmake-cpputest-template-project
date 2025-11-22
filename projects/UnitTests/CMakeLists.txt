cmake_minimum_required(VERSION 3.22)
enable_testing()
project(Unittests)
# third party library, do not lint
unset(CMAKE_C_CLANG_TIDY)

add_compile_options(-Werror)
add_compile_options(
    -include
    $<$<COMPILE_LANGUAGE:C>:/usr/include/CppUTest/MemoryLeakDetectorMallocMacros.h>
    $<$<COMPILE_LANGUAGE:CXX>:/usr/include/CppUTest/MemoryLeakDetectorNewMacros.h>
)

set(COMMON_SOURCE
    ${CMAKE_CURRENT_LIST_DIR}/Source/main.cpp
    ${CMAKE_CURRENT_LIST_DIR}/Source/Helpers.c
)

set(COMMON_INCLUDE_DIR
    ${CMAKE_CURRENT_LIST_DIR}/Include
)

set(CPPUTESTLIBS
    CppUTest
    CppUTestExt
)

if ("${PROJECT_ROOT}" STREQUAL "")
    # If PROJECT_ROOT is not set, use the parent directory of the current binary directory as the root.
    # Usually, the binary directory is one level up from the source directory.
    # If this is not the case, the user should set PROJECT_ROOT manually.
    set(PROJECT_ROOT ${CMAKE_CURRENT_BINARY_DIR}/..)
endif()

add_library(${PROJECT_NAME}
    ${COMMON_SOURCE}
)

target_include_directories(${PROJECT_NAME}
    SYSTEM
    PUBLIC
        ${COMMON_INCLUDE_DIR}
)

target_link_libraries(${PROJECT_NAME}
    ${CPPUTESTLIBS}
)

add_subdirectory(TestSample)

include(${PROJECT_ROOT}/cmake/user.cmake)
