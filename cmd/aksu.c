#include <stdio.h>

#include "event2/event.h"
#include "event2/buffer.h"

int main(int argc, const char** argv) {
  struct event_base* base = event_base_new();
  evhttp_bind_socket(serv, "0.0.0.0", 8080);
  event_base_dispatch(base);
  event_base_free(base);
  return 0;
}
