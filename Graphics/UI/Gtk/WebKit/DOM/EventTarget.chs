module Graphics.UI.Gtk.WebKit.DOM.EventTarget
       (eventTargetDispatchEvent) where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
eventTargetDispatchEvent ::
                         (EventTargetClass self, EventClass event) =>
                           self -> Maybe event -> IO Bool
eventTargetDispatchEvent self event
  = toBool <$>
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_event_target_dispatch_event #}
             (toEventTarget self)
             (maybe (Event nullForeignPtr) toEvent event)
             errorPtr_)
