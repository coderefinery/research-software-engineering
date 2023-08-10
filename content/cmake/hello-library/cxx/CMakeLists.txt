cmake_minimum_required(VERSION 3.14)

project(example LANGUAGES CXX)

add_executable(hello hello.cpp)

add_library(greeting
  SHARED
    greeting.cpp
    greeting.hpp
  )

target_link_libraries(hello PRIVATE greeting)
