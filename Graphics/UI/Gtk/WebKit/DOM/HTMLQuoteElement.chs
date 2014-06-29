module Graphics.UI.Gtk.WebKit.DOM.HTMLQuoteElement
       (htmlQuoteElementSetCite, htmlQuoteElementGetCite,
        HTMLQuoteElement, HTMLQuoteElementClass, castToHTMLQuoteElement,
        gTypeHTMLQuoteElement, toHTMLQuoteElement)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
htmlQuoteElementSetCite ::
                        (HTMLQuoteElementClass self, GlibString string) =>
                          self -> string -> IO ()
htmlQuoteElementSetCite self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_quote_element_set_cite #}
          (toHTMLQuoteElement self)
          valPtr
 
htmlQuoteElementGetCite ::
                        (HTMLQuoteElementClass self, GlibString string) =>
                          self -> IO string
htmlQuoteElementGetCite self
  = ({# call webkit_dom_html_quote_element_get_cite #}
       (toHTMLQuoteElement self))
      >>=
      readUTFString
