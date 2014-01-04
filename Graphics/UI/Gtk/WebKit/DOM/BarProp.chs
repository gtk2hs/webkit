module Graphics.UI.Gtk.WebKit.DOM.BarProp (
#if WEBKIT_CHECK_VERSION(2,2,2)
        barPropGetVisible, BarProp, BarPropClass, castToBarProp,
        gTypeBarProp, toBarProp
#endif
    ) where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
#if WEBKIT_CHECK_VERSION(2,2,2)
barPropGetVisible :: (BarPropClass self) => self -> IO Bool
barPropGetVisible self
  = toBool <$>
      ({# call webkit_dom_bar_prop_get_visible #} (toBarProp self))
#endif