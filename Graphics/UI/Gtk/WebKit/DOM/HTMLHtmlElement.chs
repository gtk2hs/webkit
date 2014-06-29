module Graphics.UI.Gtk.WebKit.DOM.HTMLHtmlElement
       (htmlHtmlElementSetVersion, htmlHtmlElementGetVersion,
        htmlHtmlElementSetManifest, htmlHtmlElementGetManifest,
        HTMLHtmlElement, HTMLHtmlElementClass, castToHTMLHtmlElement,
        gTypeHTMLHtmlElement, toHTMLHtmlElement)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
htmlHtmlElementSetVersion ::
                          (HTMLHtmlElementClass self, GlibString string) =>
                            self -> string -> IO ()
htmlHtmlElementSetVersion self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_html_element_set_version #}
          (toHTMLHtmlElement self)
          valPtr
 
htmlHtmlElementGetVersion ::
                          (HTMLHtmlElementClass self, GlibString string) => self -> IO string
htmlHtmlElementGetVersion self
  = ({# call webkit_dom_html_html_element_get_version #}
       (toHTMLHtmlElement self))
      >>=
      readUTFString
 
htmlHtmlElementSetManifest ::
                           (HTMLHtmlElementClass self, GlibString string) =>
                             self -> string -> IO ()
htmlHtmlElementSetManifest self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_html_element_set_manifest #}
          (toHTMLHtmlElement self)
          valPtr
 
htmlHtmlElementGetManifest ::
                           (HTMLHtmlElementClass self, GlibString string) => self -> IO string
htmlHtmlElementGetManifest self
  = ({# call webkit_dom_html_html_element_get_manifest #}
       (toHTMLHtmlElement self))
      >>=
      readUTFString
