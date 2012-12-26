module Graphics.UI.Gtk.WebKit.DOM.HTMLDetailsElement
       (htmlDetailsElementSetOpen, htmlDetailsElementGetOpen) where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
htmlDetailsElementSetOpen ::
                          (HTMLDetailsElementClass self) => self -> Bool -> IO ()
htmlDetailsElementSetOpen self val
  = {# call webkit_dom_html_details_element_set_open #}
      (toHTMLDetailsElement self)
      (fromBool val)
 
htmlDetailsElementGetOpen ::
                          (HTMLDetailsElementClass self) => self -> IO Bool
htmlDetailsElementGetOpen self
  = toBool <$>
      ({# call webkit_dom_html_details_element_get_open #}
         (toHTMLDetailsElement self))
