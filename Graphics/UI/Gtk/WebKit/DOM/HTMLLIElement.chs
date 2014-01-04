module Graphics.UI.Gtk.WebKit.DOM.HTMLLIElement
       (htmlliElementSetValue, htmlliElementGetValue, HTMLLIElement,
        HTMLLIElementClass, castToHTMLLIElement, gTypeHTMLLIElement,
        toHTMLLIElement)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
htmlliElementSetValue ::
                      (HTMLLIElementClass self) => self -> Int -> IO ()
htmlliElementSetValue self val
  = {# call webkit_dom_htmlli_element_set_value #}
      (toHTMLLIElement self)
      (fromIntegral val)
 
htmlliElementGetValue ::
                      (HTMLLIElementClass self) => self -> IO Int
htmlliElementGetValue self
  = fromIntegral <$>
      ({# call webkit_dom_htmlli_element_get_value #}
         (toHTMLLIElement self))
