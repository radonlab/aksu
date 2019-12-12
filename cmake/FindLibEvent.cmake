# - Find libEvent library
# This module defines
# LIBEVENT_FOUND        - True if headers and requested libraries were found
# LIBEVENT_INCLUDE_DIRS - libEvent include dirs
# LIBEVENT_LIBRARIES    - libEvent libraries

find_path(LIBEVENT_INCLUDE_DIR NAMES event.h)
find_library(LIBEVENT_LIBRARY NAMES event)

if(LIBEVENT_INCLUDE_DIR AND LIBEVENT_LIBRARY)
  set(LIBEVENT_FOUND TRUE)
  set(LIBEVENT_INCLUDE_DIRS ${LIBEVENT_INCLUDE_DIR})
  set(LIBEVENT_LIBRARIES ${LIBEVENT_LIBRARY})
else()
  set(LIBEVENT_FOUND FALSE)
endif()

mark_as_advanced(LIBEVENT_INCLUDE_DIRS LIBEVENT_LIBRARIES)
