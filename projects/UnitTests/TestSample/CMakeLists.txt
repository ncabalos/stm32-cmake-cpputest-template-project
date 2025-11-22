project(Sample)
set(TARGET_NAME Test${PROJECT_NAME})

add_executable(${TARGET_NAME}
    ${COMMON_SOURCE}
    Tests.cpp
)

target_include_directories(${TARGET_NAME}
    SYSTEM
    PUBLIC
        ${COMMON_INCLUDE_DIR}
)

target_link_libraries(${TARGET_NAME}
    ${CPPUTESTLIBS}
    Unittests
)

add_test(NAME ${TARGET_NAME} COMMAND ${TARGET_NAME})
