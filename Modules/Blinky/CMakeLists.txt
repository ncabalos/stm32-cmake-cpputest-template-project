project(Blinky)

add_library(${PROJECT_NAME} 
    ${CMAKE_CURRENT_LIST_DIR}/Source/Blinky.c
)

target_include_directories(${PROJECT_NAME}
    PUBLIC
        ${CMAKE_CURRENT_LIST_DIR}/Include
)

target_link_libraries(${PROJECT_NAME}
    PUBLIC
)

if(CMAKE_TESTING_ENABLED)
    # Test executable
    add_executable(Test${PROJECT_NAME}
        Test/BlinkyTests.cpp
    )

    target_include_directories(Test${PROJECT_NAME}
        PUBLIC
    )

    target_link_libraries(Test${PROJECT_NAME}
        Unittests
        ${PROJECT_NAME}
    )

    add_test(NAME Test${PROJECT_NAME} COMMAND Test${PROJECT_NAME})
endif()
