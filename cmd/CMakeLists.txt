add_executable(aksu aksu.c)

target_include_directories(aksu PUBLIC ${LIBEVENT_INCLUDE_DIRS})

target_link_libraries(aksu event_core_static event_openssl_static)
