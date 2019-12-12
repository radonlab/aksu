cmake_minimum_required(VERSION 3.5)

if(${CMAKE_SOURCE_DIR} STREQUAL ${CMAKE_BINARY_DIR})
  message(FATAL_ERROR "In-source builds are not allowed.")
endif()

project(AKSU VERSION 0.0.1 LANGUAGES C)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

find_package(LibEvent REQUIRED)

include_directories(${CMAKE_CURRENT_SOURCE_DIR}
  ${LIBEVENT_INCLUDE_DIRS}
)

set(AKSU_SOURCES)

add_executable(aksu cmd/aksu.c ${AKSU_SOURCES})

target_link_libraries(aksu
  ${LIBEVENT_LIBRARIES}
)
