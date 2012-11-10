module Graphics.UI.Gtk.WebKit.DOM.HTMLParagraphElement
       (htmlParagraphElementSetAlign, htmlParagraphElementGetAlign) where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
htmlParagraphElementSetAlign ::
                             (HTMLParagraphElementClass self) => self -> String -> IO ()
htmlParagraphElementSetAlign self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_paragraph_element_set_align #}
          (toHTMLParagraphElement self)
          valPtr
 
htmlParagraphElementGetAlign ::
                             (HTMLParagraphElementClass self) => self -> IO String
htmlParagraphElementGetAlign self
  = ({# call webkit_dom_html_paragraph_element_get_align #}
       (toHTMLParagraphElement self))
      >>=
      readUTFString
