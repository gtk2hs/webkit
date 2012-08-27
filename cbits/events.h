
#include <glib-object.h>
#include <webkit/WebKitDOMEventTarget.h>

gboolean webkit_dom_event_target_add_event_listener_closure(
    WebKitDOMEventTarget *target,
    const char           *eventName,
    GClosure             *closure,
    gboolean              bubble);

