module Graphics.UI.Gtk.WebKit.DOM.HTMLDListElement
       (htmldListElementSetCompact, htmldListElementGetCompact) where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
htmldListElementSetCompact ::
                           (HTMLDListElementClass self) => self -> Bool -> IO ()
htmldListElementSetCompact self val
  = {# call webkit_dom_htmld_list_element_set_compact #}
      (toHTMLDListElement self)
      (fromBool val)
 
htmldListElementGetCompact ::
                           (HTMLDListElementClass self) => self -> IO Bool
htmldListElementGetCompact self
  = toBool <$>
      ({# call webkit_dom_htmld_list_element_get_compact #}
         (toHTMLDListElement self))
