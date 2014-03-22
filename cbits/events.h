#include <glib-object.h>
#include <webkit/webkitversion.h>

#if WEBKIT_CHECK_VERSION(2,0,0)
  #include <webkitdom/WebKitDOMEventTarget.h>
#else
  #include <webkit/WebKitDOMEventTarget.h>
#endif

gboolean webkit_dom_event_target_add_event_listener_closure(
    WebKitDOMEventTarget *target,
    const char           *eventName,
    GClosure             *closure,
    gboolean              bubble);

gboolean webkit_dom_event_target_remove_event_listener_closure(
    WebKitDOMEventTarget *target,
    const char           *eventName,
    GClosure             *closure,
    gboolean              bubble);
