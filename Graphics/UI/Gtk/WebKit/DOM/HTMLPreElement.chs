module Graphics.UI.Gtk.WebKit.DOM.HTMLPreElement
       (htmlPreElementSetWidth, htmlPreElementGetWidth,
        htmlPreElementSetWrap, htmlPreElementGetWrap, HTMLPreElement,
        HTMLPreElementClass, castToHTMLPreElement, gTypeHTMLPreElement,
        toHTMLPreElement)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
htmlPreElementSetWidth ::
                       (HTMLPreElementClass self) => self -> Int -> IO ()
htmlPreElementSetWidth self val
  = {# call webkit_dom_html_pre_element_set_width #}
      (toHTMLPreElement self)
      (fromIntegral val)
 
htmlPreElementGetWidth ::
                       (HTMLPreElementClass self) => self -> IO Int
htmlPreElementGetWidth self
  = fromIntegral <$>
      ({# call webkit_dom_html_pre_element_get_width #}
         (toHTMLPreElement self))
 
htmlPreElementSetWrap ::
                      (HTMLPreElementClass self) => self -> Bool -> IO ()
htmlPreElementSetWrap self val
  = {# call webkit_dom_html_pre_element_set_wrap #}
      (toHTMLPreElement self)
      (fromBool val)
 
htmlPreElementGetWrap ::
                      (HTMLPreElementClass self) => self -> IO Bool
htmlPreElementGetWrap self
  = toBool <$>
      ({# call webkit_dom_html_pre_element_get_wrap #}
         (toHTMLPreElement self))
