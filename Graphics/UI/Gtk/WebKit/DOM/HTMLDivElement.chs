module Graphics.UI.Gtk.WebKit.DOM.HTMLDivElement
       (htmlDivElementSetAlign, htmlDivElementGetAlign, HTMLDivElement,
        HTMLDivElementClass, castToHTMLDivElement, gTypeHTMLDivElement,
        toHTMLDivElement)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
htmlDivElementSetAlign ::
                       (HTMLDivElementClass self, GlibString string) =>
                         self -> string -> IO ()
htmlDivElementSetAlign self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_div_element_set_align #}
          (toHTMLDivElement self)
          valPtr
 
htmlDivElementGetAlign ::
                       (HTMLDivElementClass self, GlibString string) => self -> IO string
htmlDivElementGetAlign self
  = ({# call webkit_dom_html_div_element_get_align #}
       (toHTMLDivElement self))
      >>=
      readUTFString
