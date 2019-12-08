cmake_minimum_required(VERSION 3.5)

if(${CMAKE_SOURCE_DIR} STREQUAL ${CMAKE_BINARY_DIR})
  message(FATAL_ERROR "In-source builds are not allowed.")
endif()

project(AKSU VERSION 0.0.1 LANGUAGES C)

include_directories(${CMAKE_CURRENT_SOURCE_DIR})

set(AKSU_SOURCES)

add_executable(aksu cmd/aksu.c ${AKSU_SOURCES})
