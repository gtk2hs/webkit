module Graphics.UI.Gtk.WebKit.DOM.HTMLScriptElement
       (htmlScriptElementSetText, htmlScriptElementGetText,
        htmlScriptElementSetHtmlFor, htmlScriptElementGetHtmlFor,
        htmlScriptElementSetEvent, htmlScriptElementGetEvent,
        htmlScriptElementSetCharset, htmlScriptElementGetCharset,
        htmlScriptElementSetAsync, htmlScriptElementGetAsync,
        htmlScriptElementSetDefer, htmlScriptElementGetDefer,
        htmlScriptElementSetSrc, htmlScriptElementGetSrc,
#if WEBKIT_CHECK_VERSION(1,10,0)
        htmlScriptElementSetCrossOrigin, htmlScriptElementGetCrossOrigin,
        htmlScriptElementSetNonce, htmlScriptElementGetNonce,
#endif
        HTMLScriptElement, HTMLScriptElementClass, castToHTMLScriptElement,
        gTypeHTMLScriptElement, toHTMLScriptElement)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
htmlScriptElementSetText ::
                         (HTMLScriptElementClass self, GlibString string) =>
                           self -> string -> IO ()
htmlScriptElementSetText self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_script_element_set_text #}
          (toHTMLScriptElement self)
          valPtr
 
htmlScriptElementGetText ::
                         (HTMLScriptElementClass self, GlibString string) =>
                           self -> IO string
htmlScriptElementGetText self
  = ({# call webkit_dom_html_script_element_get_text #}
       (toHTMLScriptElement self))
      >>=
      readUTFString
 
htmlScriptElementSetHtmlFor ::
                            (HTMLScriptElementClass self, GlibString string) =>
                              self -> string -> IO ()
htmlScriptElementSetHtmlFor self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_script_element_set_html_for #}
          (toHTMLScriptElement self)
          valPtr
 
htmlScriptElementGetHtmlFor ::
                            (HTMLScriptElementClass self, GlibString string) =>
                              self -> IO string
htmlScriptElementGetHtmlFor self
  = ({# call webkit_dom_html_script_element_get_html_for #}
       (toHTMLScriptElement self))
      >>=
      readUTFString
 
htmlScriptElementSetEvent ::
                          (HTMLScriptElementClass self, GlibString string) =>
                            self -> string -> IO ()
htmlScriptElementSetEvent self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_script_element_set_event #}
          (toHTMLScriptElement self)
          valPtr
 
htmlScriptElementGetEvent ::
                          (HTMLScriptElementClass self, GlibString string) =>
                            self -> IO string
htmlScriptElementGetEvent self
  = ({# call webkit_dom_html_script_element_get_event #}
       (toHTMLScriptElement self))
      >>=
      readUTFString
 
htmlScriptElementSetCharset ::
                            (HTMLScriptElementClass self, GlibString string) =>
                              self -> string -> IO ()
htmlScriptElementSetCharset self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_script_element_set_charset #}
          (toHTMLScriptElement self)
          valPtr
 
htmlScriptElementGetCharset ::
                            (HTMLScriptElementClass self, GlibString string) =>
                              self -> IO string
htmlScriptElementGetCharset self
  = ({# call webkit_dom_html_script_element_get_charset #}
       (toHTMLScriptElement self))
      >>=
      readUTFString
 
htmlScriptElementSetAsync ::
                          (HTMLScriptElementClass self) => self -> Bool -> IO ()
htmlScriptElementSetAsync self val
  = {# call webkit_dom_html_script_element_set_async #}
      (toHTMLScriptElement self)
      (fromBool val)
 
htmlScriptElementGetAsync ::
                          (HTMLScriptElementClass self) => self -> IO Bool
htmlScriptElementGetAsync self
  = toBool <$>
      ({# call webkit_dom_html_script_element_get_async #}
         (toHTMLScriptElement self))
 
htmlScriptElementSetDefer ::
                          (HTMLScriptElementClass self) => self -> Bool -> IO ()
htmlScriptElementSetDefer self val
  = {# call webkit_dom_html_script_element_set_defer #}
      (toHTMLScriptElement self)
      (fromBool val)
 
htmlScriptElementGetDefer ::
                          (HTMLScriptElementClass self) => self -> IO Bool
htmlScriptElementGetDefer self
  = toBool <$>
      ({# call webkit_dom_html_script_element_get_defer #}
         (toHTMLScriptElement self))
 
htmlScriptElementSetSrc ::
                        (HTMLScriptElementClass self, GlibString string) =>
                          self -> string -> IO ()
htmlScriptElementSetSrc self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_script_element_set_src #}
          (toHTMLScriptElement self)
          valPtr
 
htmlScriptElementGetSrc ::
                        (HTMLScriptElementClass self, GlibString string) =>
                          self -> IO string
htmlScriptElementGetSrc self
  = ({# call webkit_dom_html_script_element_get_src #}
       (toHTMLScriptElement self))
      >>=
      readUTFString
 
#if WEBKIT_CHECK_VERSION(1,10,0)
htmlScriptElementSetCrossOrigin ::
                                (HTMLScriptElementClass self, GlibString string) =>
                                  self -> string -> IO ()
htmlScriptElementSetCrossOrigin self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_script_element_set_cross_origin #}
          (toHTMLScriptElement self)
          valPtr
 
htmlScriptElementGetCrossOrigin ::
                                (HTMLScriptElementClass self, GlibString string) =>
                                  self -> IO string
htmlScriptElementGetCrossOrigin self
  = ({# call webkit_dom_html_script_element_get_cross_origin #}
       (toHTMLScriptElement self))
      >>=
      readUTFString
 
htmlScriptElementSetNonce ::
                          (HTMLScriptElementClass self, GlibString string) =>
                            self -> string -> IO ()
htmlScriptElementSetNonce self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_script_element_set_nonce #}
          (toHTMLScriptElement self)
          valPtr
 
htmlScriptElementGetNonce ::
                          (HTMLScriptElementClass self, GlibString string) =>
                            self -> IO string
htmlScriptElementGetNonce self
  = ({# call webkit_dom_html_script_element_get_nonce #}
       (toHTMLScriptElement self))
      >>=
      readUTFString
#endif
