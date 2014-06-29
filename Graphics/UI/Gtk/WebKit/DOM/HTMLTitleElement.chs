module Graphics.UI.Gtk.WebKit.DOM.HTMLTitleElement
       (htmlTitleElementSetText, htmlTitleElementGetText,
        HTMLTitleElement, HTMLTitleElementClass, castToHTMLTitleElement,
        gTypeHTMLTitleElement, toHTMLTitleElement)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
htmlTitleElementSetText ::
                        (HTMLTitleElementClass self, GlibString string) =>
                          self -> string -> IO ()
htmlTitleElementSetText self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_title_element_set_text #}
          (toHTMLTitleElement self)
          valPtr
 
htmlTitleElementGetText ::
                        (HTMLTitleElementClass self, GlibString string) =>
                          self -> IO string
htmlTitleElementGetText self
  = ({# call webkit_dom_html_title_element_get_text #}
       (toHTMLTitleElement self))
      >>=
      readUTFString
