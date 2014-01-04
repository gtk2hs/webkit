module Graphics.UI.Gtk.WebKit.DOM.HTMLEmbedElement
       (htmlEmbedElementSetAlign, htmlEmbedElementGetAlign,
        htmlEmbedElementSetHeight, htmlEmbedElementGetHeight,
        htmlEmbedElementSetName, htmlEmbedElementGetName,
        htmlEmbedElementSetSrc, htmlEmbedElementGetSrc,
        htmlEmbedElementSetWidth, htmlEmbedElementGetWidth,
        HTMLEmbedElement, HTMLEmbedElementClass, castToHTMLEmbedElement,
        gTypeHTMLEmbedElement, toHTMLEmbedElement)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
htmlEmbedElementSetAlign ::
                         (HTMLEmbedElementClass self) => self -> String -> IO ()
htmlEmbedElementSetAlign self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_embed_element_set_align #}
          (toHTMLEmbedElement self)
          valPtr
 
htmlEmbedElementGetAlign ::
                         (HTMLEmbedElementClass self) => self -> IO String
htmlEmbedElementGetAlign self
  = ({# call webkit_dom_html_embed_element_get_align #}
       (toHTMLEmbedElement self))
      >>=
      readUTFString
 
htmlEmbedElementSetHeight ::
                          (HTMLEmbedElementClass self) => self -> Int -> IO ()
htmlEmbedElementSetHeight self val
  = {# call webkit_dom_html_embed_element_set_height #}
      (toHTMLEmbedElement self)
      (fromIntegral val)
 
htmlEmbedElementGetHeight ::
                          (HTMLEmbedElementClass self) => self -> IO Int
htmlEmbedElementGetHeight self
  = fromIntegral <$>
      ({# call webkit_dom_html_embed_element_get_height #}
         (toHTMLEmbedElement self))
 
htmlEmbedElementSetName ::
                        (HTMLEmbedElementClass self) => self -> String -> IO ()
htmlEmbedElementSetName self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_embed_element_set_name #}
          (toHTMLEmbedElement self)
          valPtr
 
htmlEmbedElementGetName ::
                        (HTMLEmbedElementClass self) => self -> IO String
htmlEmbedElementGetName self
  = ({# call webkit_dom_html_embed_element_get_name #}
       (toHTMLEmbedElement self))
      >>=
      readUTFString
 
htmlEmbedElementSetSrc ::
                       (HTMLEmbedElementClass self) => self -> String -> IO ()
htmlEmbedElementSetSrc self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_embed_element_set_src #}
          (toHTMLEmbedElement self)
          valPtr
 
htmlEmbedElementGetSrc ::
                       (HTMLEmbedElementClass self) => self -> IO String
htmlEmbedElementGetSrc self
  = ({# call webkit_dom_html_embed_element_get_src #}
       (toHTMLEmbedElement self))
      >>=
      readUTFString
 
htmlEmbedElementSetWidth ::
                         (HTMLEmbedElementClass self) => self -> Int -> IO ()
htmlEmbedElementSetWidth self val
  = {# call webkit_dom_html_embed_element_set_width #}
      (toHTMLEmbedElement self)
      (fromIntegral val)
 
htmlEmbedElementGetWidth ::
                         (HTMLEmbedElementClass self) => self -> IO Int
htmlEmbedElementGetWidth self
  = fromIntegral <$>
      ({# call webkit_dom_html_embed_element_get_width #}
         (toHTMLEmbedElement self))
