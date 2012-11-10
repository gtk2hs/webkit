module Graphics.UI.Gtk.WebKit.DOM.HTMLMenuElement
       (htmlMenuElementSetCompact, htmlMenuElementGetCompact) where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
htmlMenuElementSetCompact ::
                          (HTMLMenuElementClass self) => self -> Bool -> IO ()
htmlMenuElementSetCompact self val
  = {# call webkit_dom_html_menu_element_set_compact #}
      (toHTMLMenuElement self)
      (fromBool val)
 
htmlMenuElementGetCompact ::
                          (HTMLMenuElementClass self) => self -> IO Bool
htmlMenuElementGetCompact self
  = toBool <$>
      ({# call webkit_dom_html_menu_element_get_compact #}
         (toHTMLMenuElement self))
