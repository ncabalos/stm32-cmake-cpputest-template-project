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

### Download and Install STM32CubeMX

1. Download STM32CubeMX from the [STMicroelectronics website](https://www.st.com/en/development-tools/stm32cubemx.html).
2. Install STM32CubeMX following the provided instructions for your operating system.

### Create a New STM32CubeIDE Project using STM32CubeMX

1. Open STM32CubeMX and create a new project.
2. Select your target STM32 microcontroller or development board.
3. Configure the peripherals and middleware as needed.
4. In the Project Manager, specify the name of your project in `Project Name`.
   For `Project Location`, make sure the path is set to the `projects/` directory of this template project.
   For `Toolchain / IDE`, select `CMake`.
5. Generate the project for STM32CubeIDE.

### Building the Project using CMake

Configure for Debug build:

    cmake -S ./projects/<your-project-name>/ -B debug-<your-project-name> -DCMAKE_BUILD_TYPE=Debug -DCMAKE_TOOLCHAIN_FILE=./cmake/gcc-arm-none-eabi.cmake

    cmake --build debug-<your-project-name>

Configure for Release build:

    cmake -S ./projects/<your-project-name>/ -B release-<your-project-name> -DCMAKE_BUILD_TYPE=Release -DCMAKE_TOOLCHAIN_FILE=./cmake/gcc-arm-none-eabi.cmake

    cmake --build release-<your-project-name>

Important: Make sure the `-DCMAKE_TOOLCHAIN_FILE` path points to the appropriate toolchain file for your environment. When STM32CubeMX generates the project, it should always generate the project with the correct toolchain file at `cmake/gcc-arm-none-eabi.cmake`.

## Configure and Build

### Unit Test

    cmake -S ./projects/UnitTests/ -B debug-unittests
    cmake --build debug-unittests

#### Run Unit Tests

    ctest --test-dir debug-unittests --output-on-failure
