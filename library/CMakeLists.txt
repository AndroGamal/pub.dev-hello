cmake_minimum_required(VERSION 3.10)
project(api LANGUAGES CXX C) 
add_library(foo
  SHARED
  ./main.cpp
)
set_target_properties(foo PROPERTIES IMPORTED_LOCATION ${CMAKE_CURRENT_SOURCE_DIR}/libfoo.so)
