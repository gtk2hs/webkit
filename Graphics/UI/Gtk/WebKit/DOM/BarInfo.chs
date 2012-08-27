module Graphics.UI.Gtk.WebKit.DOM.BarInfo (barInfoGetVisible) where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
barInfoGetVisible :: (BarInfoClass self) => self -> IO Bool
barInfoGetVisible self
  = toBool <$>
      ({# call webkit_dom_bar_info_get_visible #} (toBarInfo self))
