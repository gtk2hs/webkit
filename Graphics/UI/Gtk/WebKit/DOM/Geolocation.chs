module Graphics.UI.Gtk.WebKit.DOM.Geolocation
       (geolocationClearWatch) where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
geolocationClearWatch ::
                      (GeolocationClass self) => self -> Int -> IO ()
geolocationClearWatch self watchId
  = {# call webkit_dom_geolocation_clear_watch #}
      (toGeolocation self)
      (fromIntegral watchId)
