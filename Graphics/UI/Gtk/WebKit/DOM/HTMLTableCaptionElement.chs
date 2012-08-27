module Graphics.UI.Gtk.WebKit.DOM.HTMLTableCaptionElement
       (htmlTableCaptionElementSetAlign, htmlTableCaptionElementGetAlign)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
htmlTableCaptionElementSetAlign ::
                                (HTMLTableCaptionElementClass self) => self -> String -> IO ()
htmlTableCaptionElementSetAlign self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_table_caption_element_set_align #}
          (toHTMLTableCaptionElement self)
          valPtr
 
htmlTableCaptionElementGetAlign ::
                                (HTMLTableCaptionElementClass self) => self -> IO String
htmlTableCaptionElementGetAlign self
  = ({# call webkit_dom_html_table_caption_element_get_align #}
       (toHTMLTableCaptionElement self))
      >>=
      readUTFString
