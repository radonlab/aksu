cmake_minimum_required(VERSION 3.5)

if(${CMAKE_SOURCE_DIR} STREQUAL ${CMAKE_BINARY_DIR})
  message(FATAL_ERROR "In-source builds are not allowed.")
endif()

project(aksu VERSION 0.0.1 LANGUAGES C)

include(ExternalProject)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

set(AKSU_THIRD_PARTY_DIR "${CMAKE_CURRENT_SOURCE_DIR}/third_party")

# set(OPENSSL_USE_STATIC_LIBS TRUE)

add_subdirectory(${AKSU_THIRD_PARTY_DIR}/libevent/src)

add_subdirectory(cmd)
