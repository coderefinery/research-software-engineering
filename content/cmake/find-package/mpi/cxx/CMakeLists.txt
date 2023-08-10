cmake_minimum_required(VERSION 3.14)

project(example LANGUAGES CXX)

add_executable(example example.cpp)

find_package(MPI REQUIRED COMPONENTS CXX)

target_link_libraries(example PRIVATE MPI::MPI_CXX)
