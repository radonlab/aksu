cmake_minimum_required(VERSION 3.5)

if(${CMAKE_SOURCE_DIR} STREQUAL ${CMAKE_BINARY_DIR})
  message(FATAL_ERROR "In-source builds are not allowed.")
endif()

project(aksu VERSION 0.0.1 LANGUAGES C)

option(AKSU_WITH_SYSTEM_SSL "Build with system OpenSSL" OFF)
option(AKSU_WITH_SYSTEM_EVENT "Build with system LibEvent" OFF)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

if(AKSU_WITH_SYSTEM_SSL)
  find_package(OpenSSL REQUIRED)
else()
  add_subdirectory(third_party/boringssl)
endif()

if(AKSU_WITH_SYSTEM_EVENT)
  find_package(LibEvent REQUIRED)
else()
  add_subdirectory(third_party/libevent)
endif()

include_directories(
  ${CMAKE_CURRENT_SOURCE_DIR}
  ${LIBEVENT_INCLUDE_DIRS}
)

set(AKSU_SOURCES)

add_subdirectory(cmd)
