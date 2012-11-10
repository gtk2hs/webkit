module Graphics.UI.Gtk.WebKit.DOM.HTMLUListElement
       (htmluListElementSetCompact, htmluListElementGetCompact) where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
htmluListElementSetCompact ::
                           (HTMLUListElementClass self) => self -> Bool -> IO ()
htmluListElementSetCompact self val
  = {# call webkit_dom_htmlu_list_element_set_compact #}
      (toHTMLUListElement self)
      (fromBool val)
 
htmluListElementGetCompact ::
                           (HTMLUListElementClass self) => self -> IO Bool
htmluListElementGetCompact self
  = toBool <$>
      ({# call webkit_dom_htmlu_list_element_get_compact #}
         (toHTMLUListElement self))
