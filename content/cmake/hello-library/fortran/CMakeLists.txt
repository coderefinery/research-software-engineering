cmake_minimum_required(VERSION 3.14)

project(example LANGUAGES Fortran)

add_executable(hello hello.f90)

add_library(greeting
  SHARED
    greeting.f90
  )

target_link_libraries(hello PRIVATE greeting)
