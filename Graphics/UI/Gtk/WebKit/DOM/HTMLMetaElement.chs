module Graphics.UI.Gtk.WebKit.DOM.HTMLMetaElement
       (htmlMetaElementSetContent, htmlMetaElementGetContent,
        htmlMetaElementSetHttpEquiv, htmlMetaElementGetHttpEquiv,
        htmlMetaElementSetName, htmlMetaElementGetName,
        htmlMetaElementSetScheme, htmlMetaElementGetScheme)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
htmlMetaElementSetContent ::
                          (HTMLMetaElementClass self) => self -> String -> IO ()
htmlMetaElementSetContent self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_meta_element_set_content #}
          (toHTMLMetaElement self)
          valPtr
 
htmlMetaElementGetContent ::
                          (HTMLMetaElementClass self) => self -> IO String
htmlMetaElementGetContent self
  = ({# call webkit_dom_html_meta_element_get_content #}
       (toHTMLMetaElement self))
      >>=
      readUTFString
 
htmlMetaElementSetHttpEquiv ::
                            (HTMLMetaElementClass self) => self -> String -> IO ()
htmlMetaElementSetHttpEquiv self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_meta_element_set_http_equiv #}
          (toHTMLMetaElement self)
          valPtr
 
htmlMetaElementGetHttpEquiv ::
                            (HTMLMetaElementClass self) => self -> IO String
htmlMetaElementGetHttpEquiv self
  = ({# call webkit_dom_html_meta_element_get_http_equiv #}
       (toHTMLMetaElement self))
      >>=
      readUTFString
 
htmlMetaElementSetName ::
                       (HTMLMetaElementClass self) => self -> String -> IO ()
htmlMetaElementSetName self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_meta_element_set_name #}
          (toHTMLMetaElement self)
          valPtr
 
htmlMetaElementGetName ::
                       (HTMLMetaElementClass self) => self -> IO String
htmlMetaElementGetName self
  = ({# call webkit_dom_html_meta_element_get_name #}
       (toHTMLMetaElement self))
      >>=
      readUTFString
 
htmlMetaElementSetScheme ::
                         (HTMLMetaElementClass self) => self -> String -> IO ()
htmlMetaElementSetScheme self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_meta_element_set_scheme #}
          (toHTMLMetaElement self)
          valPtr
 
htmlMetaElementGetScheme ::
                         (HTMLMetaElementClass self) => self -> IO String
htmlMetaElementGetScheme self
  = ({# call webkit_dom_html_meta_element_get_scheme #}
       (toHTMLMetaElement self))
      >>=
      readUTFString
