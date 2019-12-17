#include <stdio.h>

#include "event2/event.h"
#include "event2/http.h"
#include "event2/buffer.h"

void req_handler(struct evhttp_request* req, void* data) {
  printf("request received\n");
  struct evbuffer* buf = evbuffer_new();
  evbuffer_add_printf(buf, "It works!");
  evhttp_send_reply(req, 200, "success", buf);
  evbuffer_free(buf);
}

int main(int argc, const char** argv) {
  struct event_base* base = event_base_new();
  struct evhttp* serv = evhttp_new(base);
  evhttp_set_gencb(serv, req_handler, NULL);
  evhttp_bind_socket(serv, "0.0.0.0", 8080);
  event_base_dispatch(base);
  evhttp_free(serv);
  event_base_free(base);
  return 0;
}
