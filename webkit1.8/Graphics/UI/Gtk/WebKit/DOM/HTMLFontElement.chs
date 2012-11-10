module Graphics.UI.Gtk.WebKit.DOM.HTMLFontElement
       (htmlFontElementSetColor, htmlFontElementGetColor,
        htmlFontElementSetFace, htmlFontElementGetFace,
        htmlFontElementSetSize, htmlFontElementGetSize)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
htmlFontElementSetColor ::
                        (HTMLFontElementClass self) => self -> String -> IO ()
htmlFontElementSetColor self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_font_element_set_color #}
          (toHTMLFontElement self)
          valPtr
 
htmlFontElementGetColor ::
                        (HTMLFontElementClass self) => self -> IO String
htmlFontElementGetColor self
  = ({# call webkit_dom_html_font_element_get_color #}
       (toHTMLFontElement self))
      >>=
      readUTFString
 
htmlFontElementSetFace ::
                       (HTMLFontElementClass self) => self -> String -> IO ()
htmlFontElementSetFace self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_font_element_set_face #}
          (toHTMLFontElement self)
          valPtr
 
htmlFontElementGetFace ::
                       (HTMLFontElementClass self) => self -> IO String
htmlFontElementGetFace self
  = ({# call webkit_dom_html_font_element_get_face #}
       (toHTMLFontElement self))
      >>=
      readUTFString
 
htmlFontElementSetSize ::
                       (HTMLFontElementClass self) => self -> String -> IO ()
htmlFontElementSetSize self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_font_element_set_size #}
          (toHTMLFontElement self)
          valPtr
 
htmlFontElementGetSize ::
                       (HTMLFontElementClass self) => self -> IO String
htmlFontElementGetSize self
  = ({# call webkit_dom_html_font_element_get_size #}
       (toHTMLFontElement self))
      >>=
      readUTFString
