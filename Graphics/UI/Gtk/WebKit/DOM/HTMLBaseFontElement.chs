module Graphics.UI.Gtk.WebKit.DOM.HTMLBaseFontElement
       (htmlBaseFontElementSetColor, htmlBaseFontElementGetColor,
        htmlBaseFontElementSetFace, htmlBaseFontElementGetFace,
        htmlBaseFontElementSetSize, htmlBaseFontElementGetSize,
        HTMLBaseFontElement, HTMLBaseFontElementClass,
        castToHTMLBaseFontElement, gTypeHTMLBaseFontElement,
        toHTMLBaseFontElement)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
htmlBaseFontElementSetColor ::
                            (HTMLBaseFontElementClass self, GlibString string) =>
                              self -> string -> IO ()
htmlBaseFontElementSetColor self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_base_font_element_set_color #}
          (toHTMLBaseFontElement self)
          valPtr
 
htmlBaseFontElementGetColor ::
                            (HTMLBaseFontElementClass self, GlibString string) =>
                              self -> IO string
htmlBaseFontElementGetColor self
  = ({# call webkit_dom_html_base_font_element_get_color #}
       (toHTMLBaseFontElement self))
      >>=
      readUTFString
 
htmlBaseFontElementSetFace ::
                           (HTMLBaseFontElementClass self, GlibString string) =>
                             self -> string -> IO ()
htmlBaseFontElementSetFace self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_base_font_element_set_face #}
          (toHTMLBaseFontElement self)
          valPtr
 
htmlBaseFontElementGetFace ::
                           (HTMLBaseFontElementClass self, GlibString string) =>
                             self -> IO string
htmlBaseFontElementGetFace self
  = ({# call webkit_dom_html_base_font_element_get_face #}
       (toHTMLBaseFontElement self))
      >>=
      readUTFString
 
htmlBaseFontElementSetSize ::
                           (HTMLBaseFontElementClass self) => self -> Int -> IO ()
htmlBaseFontElementSetSize self val
  = {# call webkit_dom_html_base_font_element_set_size #}
      (toHTMLBaseFontElement self)
      (fromIntegral val)
 
htmlBaseFontElementGetSize ::
                           (HTMLBaseFontElementClass self) => self -> IO Int
htmlBaseFontElementGetSize self
  = fromIntegral <$>
      ({# call webkit_dom_html_base_font_element_get_size #}
         (toHTMLBaseFontElement self))
