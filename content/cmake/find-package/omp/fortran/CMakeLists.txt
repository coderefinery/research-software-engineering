cmake_minimum_required(VERSION 3.14)

project(example LANGUAGES Fortran)

add_executable(example example.f90)

find_package(OpenMP REQUIRED COMPONENTS Fortran)

target_link_libraries(example PRIVATE OpenMP::OpenMP_Fortran)
