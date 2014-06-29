module Graphics.UI.Gtk.WebKit.DOM.Location
       (locationGetOrigin,
#if WEBKIT_CHECK_VERSION(1,10,0)
        locationGetAncestorOrigins,
#endif
        Location, LocationClass, castToLocation, gTypeLocation, toLocation) where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
locationGetOrigin ::
                  (LocationClass self, GlibString string) => self -> IO string
locationGetOrigin self
  = ({# call webkit_dom_location_get_origin #} (toLocation self)) >>=
      readUTFString
 
#if WEBKIT_CHECK_VERSION(1,10,0)
locationGetAncestorOrigins ::
                           (LocationClass self) => self -> IO (Maybe DOMStringList)
locationGetAncestorOrigins self
  = maybeNull (makeNewGObject mkDOMStringList)
      ({# call webkit_dom_location_get_ancestor_origins #}
         (toLocation self))
#endif
