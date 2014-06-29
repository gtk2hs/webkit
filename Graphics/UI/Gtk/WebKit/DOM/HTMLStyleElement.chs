module Graphics.UI.Gtk.WebKit.DOM.HTMLStyleElement
       (htmlStyleElementSetDisabled, htmlStyleElementGetDisabled,
        htmlStyleElementSetScoped, htmlStyleElementGetScoped,
        htmlStyleElementSetMedia, htmlStyleElementGetMedia,
        htmlStyleElementGetSheet, HTMLStyleElement, HTMLStyleElementClass,
        castToHTMLStyleElement, gTypeHTMLStyleElement, toHTMLStyleElement)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
htmlStyleElementSetDisabled ::
                            (HTMLStyleElementClass self) => self -> Bool -> IO ()
htmlStyleElementSetDisabled self val
  = {# call webkit_dom_html_style_element_set_disabled #}
      (toHTMLStyleElement self)
      (fromBool val)
 
htmlStyleElementGetDisabled ::
                            (HTMLStyleElementClass self) => self -> IO Bool
htmlStyleElementGetDisabled self
  = toBool <$>
      ({# call webkit_dom_html_style_element_get_disabled #}
         (toHTMLStyleElement self))
 
htmlStyleElementSetScoped ::
                          (HTMLStyleElementClass self) => self -> Bool -> IO ()
htmlStyleElementSetScoped self val
  = {# call webkit_dom_html_style_element_set_scoped #}
      (toHTMLStyleElement self)
      (fromBool val)
 
htmlStyleElementGetScoped ::
                          (HTMLStyleElementClass self) => self -> IO Bool
htmlStyleElementGetScoped self
  = toBool <$>
      ({# call webkit_dom_html_style_element_get_scoped #}
         (toHTMLStyleElement self))
 
htmlStyleElementSetMedia ::
                         (HTMLStyleElementClass self, GlibString string) =>
                           self -> string -> IO ()
htmlStyleElementSetMedia self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_style_element_set_media #}
          (toHTMLStyleElement self)
          valPtr
 
htmlStyleElementGetMedia ::
                         (HTMLStyleElementClass self, GlibString string) =>
                           self -> IO string
htmlStyleElementGetMedia self
  = ({# call webkit_dom_html_style_element_get_media #}
       (toHTMLStyleElement self))
      >>=
      readUTFString
 
htmlStyleElementGetSheet ::
                         (HTMLStyleElementClass self) => self -> IO (Maybe StyleSheet)
htmlStyleElementGetSheet self
  = maybeNull (makeNewGObject mkStyleSheet)
      ({# call webkit_dom_html_style_element_get_sheet #}
         (toHTMLStyleElement self))
