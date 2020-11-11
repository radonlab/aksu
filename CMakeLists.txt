cmake_minimum_required(VERSION 3.5)

if(${CMAKE_SOURCE_DIR} STREQUAL ${CMAKE_BINARY_DIR})
  message(FATAL_ERROR "In-source builds are not allowed.")
endif()

project(aksu VERSION 0.0.1 LANGUAGES C)

include(ExternalProject)

option(AKSU_WITH_SYSTEM_SSL "Build with system OpenSSL" OFF)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

set(AKSU_THIRD_PARTY_DIR "${CMAKE_CURRENT_SOURCE_DIR}/third_party")

if(AKSU_WITH_SYSTEM_SSL)
  find_package(OpenSSL REQUIRED)
else()
  ExternalProject_Add(boringssl
    SOURCE_DIR "${AKSU_THIRD_PARTY_DIR}/boringssl/src"
    INSTALL_COMMAND python "${AKSU_THIRD_PARTY_DIR}/boringssl/install.py" --prefix "${CMAKE_BINARY_DIR}"
  )
endif()

ExternalProject_Add(libevent
  SOURCE_DIR "${AKSU_THIRD_PARTY_DIR}/libevent/src"
)

include_directories(
  ${CMAKE_CURRENT_SOURCE_DIR}
  ${LIBEVENT_INCLUDE_DIRS}
)

set(AKSU_SOURCES)

add_subdirectory(cmd)
