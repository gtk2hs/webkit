module Graphics.UI.Gtk.WebKit.DOM.HTMLCanvasElement
       (htmlCanvasElementSetWidth, htmlCanvasElementGetWidth,
        htmlCanvasElementSetHeight, htmlCanvasElementGetHeight,
        HTMLCanvasElement, HTMLCanvasElementClass, castToHTMLCanvasElement,
        gTypeHTMLCanvasElement, toHTMLCanvasElement)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
htmlCanvasElementSetWidth ::
                          (HTMLCanvasElementClass self) => self -> Int -> IO ()
htmlCanvasElementSetWidth self val
  = {# call webkit_dom_html_canvas_element_set_width #}
      (toHTMLCanvasElement self)
      (fromIntegral val)
 
htmlCanvasElementGetWidth ::
                          (HTMLCanvasElementClass self) => self -> IO Int
htmlCanvasElementGetWidth self
  = fromIntegral <$>
      ({# call webkit_dom_html_canvas_element_get_width #}
         (toHTMLCanvasElement self))
 
htmlCanvasElementSetHeight ::
                           (HTMLCanvasElementClass self) => self -> Int -> IO ()
htmlCanvasElementSetHeight self val
  = {# call webkit_dom_html_canvas_element_set_height #}
      (toHTMLCanvasElement self)
      (fromIntegral val)
 
htmlCanvasElementGetHeight ::
                           (HTMLCanvasElementClass self) => self -> IO Int
htmlCanvasElementGetHeight self
  = fromIntegral <$>
      ({# call webkit_dom_html_canvas_element_get_height #}
         (toHTMLCanvasElement self))
