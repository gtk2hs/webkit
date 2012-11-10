module Graphics.UI.Gtk.WebKit.DOM.Location (locationGetOrigin)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
locationGetOrigin :: (LocationClass self) => self -> IO String
locationGetOrigin self
  = ({# call webkit_dom_location_get_origin #} (toLocation self)) >>=
      readUTFString
