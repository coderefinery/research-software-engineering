cmake_minimum_required(VERSION 3.14)

project(example LANGUAGES CXX)

add_executable(example example.cpp)

find_package(OpenMP REQUIRED COMPONENTS CXX)

target_link_libraries(example PRIVATE OpenMP::OpenMP_CXX)
