module Graphics.UI.Gtk.WebKit.DOM.HTMLTableCaptionElement
       (htmlTableCaptionElementSetAlign, htmlTableCaptionElementGetAlign,
        HTMLTableCaptionElement, HTMLTableCaptionElementClass,
        castToHTMLTableCaptionElement, gTypeHTMLTableCaptionElement,
        toHTMLTableCaptionElement)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
htmlTableCaptionElementSetAlign ::
                                (HTMLTableCaptionElementClass self, GlibString string) =>
                                  self -> string -> IO ()
htmlTableCaptionElementSetAlign self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_table_caption_element_set_align #}
          (toHTMLTableCaptionElement self)
          valPtr
 
htmlTableCaptionElementGetAlign ::
                                (HTMLTableCaptionElementClass self, GlibString string) =>
                                  self -> IO string
htmlTableCaptionElementGetAlign self
  = ({# call webkit_dom_html_table_caption_element_get_align #}
       (toHTMLTableCaptionElement self))
      >>=
      readUTFString
