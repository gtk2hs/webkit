module Graphics.UI.Gtk.WebKit.DOM.WebKitNamedFlow
       (webKitNamedFlowGetOverflow) where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
webKitNamedFlowGetOverflow ::
                           (WebKitNamedFlowClass self) => self -> IO Bool
webKitNamedFlowGetOverflow self
  = toBool <$>
      ({# call webkit_dom_webkit_named_flow_get_overflow #}
         (toWebKitNamedFlow self))
