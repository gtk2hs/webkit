module Graphics.UI.Gtk.WebKit.DOM.HTMLFontElement
       (htmlFontElementSetColor, htmlFontElementGetColor,
        htmlFontElementSetFace, htmlFontElementGetFace,
        htmlFontElementSetSize, htmlFontElementGetSize, HTMLFontElement,
        HTMLFontElementClass, castToHTMLFontElement, gTypeHTMLFontElement,
        toHTMLFontElement)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
htmlFontElementSetColor ::
                        (HTMLFontElementClass self, GlibString string) =>
                          self -> string -> IO ()
htmlFontElementSetColor self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_font_element_set_color #}
          (toHTMLFontElement self)
          valPtr
 
htmlFontElementGetColor ::
                        (HTMLFontElementClass self, GlibString string) => self -> IO string
htmlFontElementGetColor self
  = ({# call webkit_dom_html_font_element_get_color #}
       (toHTMLFontElement self))
      >>=
      readUTFString
 
htmlFontElementSetFace ::
                       (HTMLFontElementClass self, GlibString string) =>
                         self -> string -> IO ()
htmlFontElementSetFace self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_font_element_set_face #}
          (toHTMLFontElement self)
          valPtr
 
htmlFontElementGetFace ::
                       (HTMLFontElementClass self, GlibString string) => self -> IO string
htmlFontElementGetFace self
  = ({# call webkit_dom_html_font_element_get_face #}
       (toHTMLFontElement self))
      >>=
      readUTFString
 
htmlFontElementSetSize ::
                       (HTMLFontElementClass self, GlibString string) =>
                         self -> string -> IO ()
htmlFontElementSetSize self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_font_element_set_size #}
          (toHTMLFontElement self)
          valPtr
 
htmlFontElementGetSize ::
                       (HTMLFontElementClass self, GlibString string) => self -> IO string
htmlFontElementGetSize self
  = ({# call webkit_dom_html_font_element_get_size #}
       (toHTMLFontElement self))
      >>=
      readUTFString
