#include "event2/event.h"
#include "event2/http.h"

int main(int argc, const char** argv) {
  struct event_base* base = event_base_new();
  struct evhttp* serv = evhttp_new(base);
  evhttp_free(serv);
  event_base_free(base);
  return 0;
}
