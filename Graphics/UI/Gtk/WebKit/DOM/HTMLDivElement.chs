module Graphics.UI.Gtk.WebKit.DOM.HTMLDivElement
       (htmlDivElementSetAlign, htmlDivElementGetAlign) where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
htmlDivElementSetAlign ::
                       (HTMLDivElementClass self) => self -> String -> IO ()
htmlDivElementSetAlign self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_div_element_set_align #}
          (toHTMLDivElement self)
          valPtr
 
htmlDivElementGetAlign ::
                       (HTMLDivElementClass self) => self -> IO String
htmlDivElementGetAlign self
  = ({# call webkit_dom_html_div_element_get_align #}
       (toHTMLDivElement self))
      >>=
      readUTFString
