/*  WebKitGTK Gtk2Hs WebKitDOMEventTarget implementation
 *
 *  Author : Hamish Mackenzie
 *
 *  Created: 18 August 2012
 *
 *  Copyright (C) 2012 Hamish Mackenzie
 *
 *  This library is free software; you can redistribute it and/or
 *  modify it under the terms of the GNU Lesser General Public
 *  License as published by the Free Software Foundation; either
 *  version 2.1 of the License, or (at your option) any later version.
 *
 *  This library is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 *  Lesser General Public License for more details.
 */

/* GHC's semi-public Rts API */
#include <Rts.h>

#include "hsgclosure.h"
#include "events.h"
#include <webkit/webkitversion.h>

#if WEBKIT_CHECK_VERSION(2,0,0)
  #include <webkitdom/webkitdom.h>
#else
  #include <webkit/WebKitDOMEvent.h>
  #include <webkit/WebKitDOMHTMLInputElement.h>
#endif

#ifdef DEBUG
  #define WHEN_DEBUG(a) a
#else
  #define WHEN_DEBUG(a)
#endif

// Once the following bug is fixed we should revist this
// https://bugs.webkit.org/show_bug.cgi?id=77835

static void webkit_gtk2hs_closure_callback(GObject *target, WebKitDOMEvent *event, void *user_data)
{
    WHEN_DEBUG(g_debug("webkit_gtk2hs_closure_callback: about to run target=%p, event=%p, user_data=%p", target, event, user_data));
    // I think passing the target to the closure will allow us
    // to create call backs that do not hold a reference to
    // the target.
    GClosure *closure = (GClosure *)user_data;
    GValue params[2] = {G_VALUE_INIT, G_VALUE_INIT};
    g_value_init(&params[0], WEBKIT_TYPE_DOM_EVENT_TARGET);
    g_value_init(&params[1], WEBKIT_TYPE_DOM_EVENT);
    g_value_set_object(&params[0], WEBKIT_DOM_EVENT_TARGET (target));
    g_value_set_object(&params[1], event);
    g_closure_invoke(closure, NULL, 2, &params[0], NULL);
}

gboolean webkit_dom_event_target_add_event_listener_closure(
    WebKitDOMEventTarget *target,
    const char           *eventName,
    GClosure             *closure,
    gboolean              bubble)
{
    WHEN_DEBUG(g_debug("webkit_dom_event_target_add_event_listener_closure: about to run target %p, eventName=\"%s\", closure=%p", target, eventName, closure));
    return webkit_dom_event_target_add_event_listener(
        WEBKIT_DOM_EVENT_TARGET (target), eventName, G_CALLBACK(webkit_gtk2hs_closure_callback), bubble, closure);
}
