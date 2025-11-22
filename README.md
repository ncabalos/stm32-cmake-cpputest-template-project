# Blinky Template Project

This is a template project for embedded systems development using CMake, CppUTest, STM32CubeIDE and STM32CubeMX.
It includes configurations for unit testing and building for Nucleo boards or custom boards.

## Project Structure

- `Modules/`: Contains reusable modules and their tests.
- `projects/`: Contains project configurations for different targets (e.g., UnitTests, blinky-nucleo).
- `cmake/`: Contains user-defined CMake toolchain files and settings.
- `README.md`: This file.
- `.devcontainer/`: Configuration for development containers.

## Creating a New STM32CubeIDE Project using STM32CubeMX

todo: Add instructions for creating a new STM32CubeIDE project using STM32CubeMX. This creates a CMake project and a STM32CubeIDE project.

## Configure and Build

### Unit Test

    cmake -S ./projects/UnitTests/ -B debug-unittests
    cmake --build debug-unittests

#### Run Unit Tests

    ctest --test-dir debug-unittests --output-on-failure

### Project for Nucleo Board

    cmake -S ./projects/blinky-nucleo/ -B debug-blinky-nucleo -DCMAKE_BUILD_TYPE=Debug -DCMAKE_TOOLCHAIN_FILE=./cmake/gcc-arm-none-eabi.cmake
    cmake --build debug-blinky-nucleo

