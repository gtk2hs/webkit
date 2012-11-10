module Graphics.UI.Gtk.WebKit.DOM.HTMLOListElement
       (htmloListElementSetCompact, htmloListElementGetCompact,
        htmloListElementSetStart, htmloListElementGetStart,
        htmloListElementSetReversed, htmloListElementGetReversed)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
htmloListElementSetCompact ::
                           (HTMLOListElementClass self) => self -> Bool -> IO ()
htmloListElementSetCompact self val
  = {# call webkit_dom_htmlo_list_element_set_compact #}
      (toHTMLOListElement self)
      (fromBool val)
 
htmloListElementGetCompact ::
                           (HTMLOListElementClass self) => self -> IO Bool
htmloListElementGetCompact self
  = toBool <$>
      ({# call webkit_dom_htmlo_list_element_get_compact #}
         (toHTMLOListElement self))
 
htmloListElementSetStart ::
                         (HTMLOListElementClass self) => self -> Int -> IO ()
htmloListElementSetStart self val
  = {# call webkit_dom_htmlo_list_element_set_start #}
      (toHTMLOListElement self)
      (fromIntegral val)
 
htmloListElementGetStart ::
                         (HTMLOListElementClass self) => self -> IO Int
htmloListElementGetStart self
  = fromIntegral <$>
      ({# call webkit_dom_htmlo_list_element_get_start #}
         (toHTMLOListElement self))
 
htmloListElementSetReversed ::
                            (HTMLOListElementClass self) => self -> Bool -> IO ()
htmloListElementSetReversed self val
  = {# call webkit_dom_htmlo_list_element_set_reversed #}
      (toHTMLOListElement self)
      (fromBool val)
 
htmloListElementGetReversed ::
                            (HTMLOListElementClass self) => self -> IO Bool
htmloListElementGetReversed self
  = toBool <$>
      ({# call webkit_dom_htmlo_list_element_get_reversed #}
         (toHTMLOListElement self))
