module Graphics.UI.Gtk.WebKit.DOM.HTMLBRElement
       (htmlbrElementSetClear, htmlbrElementGetClear, HTMLBRElement,
        HTMLBRElementClass, castToHTMLBRElement, gTypeHTMLBRElement,
        toHTMLBRElement)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
htmlbrElementSetClear ::
                      (HTMLBRElementClass self) => self -> String -> IO ()
htmlbrElementSetClear self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_htmlbr_element_set_clear #}
          (toHTMLBRElement self)
          valPtr
 
htmlbrElementGetClear ::
                      (HTMLBRElementClass self) => self -> IO String
htmlbrElementGetClear self
  = ({# call webkit_dom_htmlbr_element_get_clear #}
       (toHTMLBRElement self))
      >>=
      readUTFString
