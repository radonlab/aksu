# - Find libEvent library
# This module defines
# LIBEVENT_FOUND        - True if headers and requested libraries were found
# LIBEVENT_INCLUDE_DIRS - libEvent include dirs
# LIBEVENT_LIBRARIES    - libEvent libraries

find_path(LIBEVENT_INCLUDE_DIR NAMES event.h)
find_library(LIBEVENT_LIBRARY NAMES event)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(LibEvent
  REQUIRED_VARS LIBEVENT_INCLUDE_DIR LIBEVENT_LIBRARY
)

if(LIBEVENT_FOUND)
  set(LIBEVENT_INCLUDE_DIRS ${LIBEVENT_INCLUDE_DIR})
  set(LIBEVENT_LIBRARIES ${LIBEVENT_LIBRARY})
endif()

mark_as_advanced(LIBEVENT_INCLUDE_DIR LIBEVENT_LIBRARY)
