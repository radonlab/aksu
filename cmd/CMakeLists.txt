add_executable(aksu aksu.c ${AKSU_SOURCES})

target_link_libraries(aksu
  ${LIBEVENT_LIBRARIES}
)
