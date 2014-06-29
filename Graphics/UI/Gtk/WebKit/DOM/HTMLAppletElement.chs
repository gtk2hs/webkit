module Graphics.UI.Gtk.WebKit.DOM.HTMLAppletElement
       (htmlAppletElementSetAlign, htmlAppletElementGetAlign,
        htmlAppletElementSetAlt, htmlAppletElementGetAlt,
        htmlAppletElementSetArchive, htmlAppletElementGetArchive,
        htmlAppletElementSetCode, htmlAppletElementGetCode,
        htmlAppletElementSetCodeBase, htmlAppletElementGetCodeBase,
        htmlAppletElementSetHeight, htmlAppletElementGetHeight,
        htmlAppletElementSetHspace, htmlAppletElementGetHspace,
        htmlAppletElementSetName, htmlAppletElementGetName,
        htmlAppletElementSetObject, htmlAppletElementGetObject,
        htmlAppletElementSetVspace, htmlAppletElementGetVspace,
        htmlAppletElementSetWidth, htmlAppletElementGetWidth,
        HTMLAppletElement, HTMLAppletElementClass, castToHTMLAppletElement,
        gTypeHTMLAppletElement, toHTMLAppletElement)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
htmlAppletElementSetAlign ::
                          (HTMLAppletElementClass self, GlibString string) =>
                            self -> string -> IO ()
htmlAppletElementSetAlign self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_applet_element_set_align #}
          (toHTMLAppletElement self)
          valPtr
 
htmlAppletElementGetAlign ::
                          (HTMLAppletElementClass self, GlibString string) =>
                            self -> IO string
htmlAppletElementGetAlign self
  = ({# call webkit_dom_html_applet_element_get_align #}
       (toHTMLAppletElement self))
      >>=
      readUTFString
 
htmlAppletElementSetAlt ::
                        (HTMLAppletElementClass self, GlibString string) =>
                          self -> string -> IO ()
htmlAppletElementSetAlt self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_applet_element_set_alt #}
          (toHTMLAppletElement self)
          valPtr
 
htmlAppletElementGetAlt ::
                        (HTMLAppletElementClass self, GlibString string) =>
                          self -> IO string
htmlAppletElementGetAlt self
  = ({# call webkit_dom_html_applet_element_get_alt #}
       (toHTMLAppletElement self))
      >>=
      readUTFString
 
htmlAppletElementSetArchive ::
                            (HTMLAppletElementClass self, GlibString string) =>
                              self -> string -> IO ()
htmlAppletElementSetArchive self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_applet_element_set_archive #}
          (toHTMLAppletElement self)
          valPtr
 
htmlAppletElementGetArchive ::
                            (HTMLAppletElementClass self, GlibString string) =>
                              self -> IO string
htmlAppletElementGetArchive self
  = ({# call webkit_dom_html_applet_element_get_archive #}
       (toHTMLAppletElement self))
      >>=
      readUTFString
 
htmlAppletElementSetCode ::
                         (HTMLAppletElementClass self, GlibString string) =>
                           self -> string -> IO ()
htmlAppletElementSetCode self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_applet_element_set_code #}
          (toHTMLAppletElement self)
          valPtr
 
htmlAppletElementGetCode ::
                         (HTMLAppletElementClass self, GlibString string) =>
                           self -> IO string
htmlAppletElementGetCode self
  = ({# call webkit_dom_html_applet_element_get_code #}
       (toHTMLAppletElement self))
      >>=
      readUTFString
 
htmlAppletElementSetCodeBase ::
                             (HTMLAppletElementClass self, GlibString string) =>
                               self -> string -> IO ()
htmlAppletElementSetCodeBase self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_applet_element_set_code_base #}
          (toHTMLAppletElement self)
          valPtr
 
htmlAppletElementGetCodeBase ::
                             (HTMLAppletElementClass self, GlibString string) =>
                               self -> IO string
htmlAppletElementGetCodeBase self
  = ({# call webkit_dom_html_applet_element_get_code_base #}
       (toHTMLAppletElement self))
      >>=
      readUTFString
 
htmlAppletElementSetHeight ::
                           (HTMLAppletElementClass self, GlibString string) =>
                             self -> string -> IO ()
htmlAppletElementSetHeight self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_applet_element_set_height #}
          (toHTMLAppletElement self)
          valPtr
 
htmlAppletElementGetHeight ::
                           (HTMLAppletElementClass self, GlibString string) =>
                             self -> IO string
htmlAppletElementGetHeight self
  = ({# call webkit_dom_html_applet_element_get_height #}
       (toHTMLAppletElement self))
      >>=
      readUTFString
 
htmlAppletElementSetHspace ::
                           (HTMLAppletElementClass self) => self -> Int -> IO ()
htmlAppletElementSetHspace self val
  = {# call webkit_dom_html_applet_element_set_hspace #}
      (toHTMLAppletElement self)
      (fromIntegral val)
 
htmlAppletElementGetHspace ::
                           (HTMLAppletElementClass self) => self -> IO Int
htmlAppletElementGetHspace self
  = fromIntegral <$>
      ({# call webkit_dom_html_applet_element_get_hspace #}
         (toHTMLAppletElement self))
 
htmlAppletElementSetName ::
                         (HTMLAppletElementClass self, GlibString string) =>
                           self -> string -> IO ()
htmlAppletElementSetName self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_applet_element_set_name #}
          (toHTMLAppletElement self)
          valPtr
 
htmlAppletElementGetName ::
                         (HTMLAppletElementClass self, GlibString string) =>
                           self -> IO string
htmlAppletElementGetName self
  = ({# call webkit_dom_html_applet_element_get_name #}
       (toHTMLAppletElement self))
      >>=
      readUTFString
 
htmlAppletElementSetObject ::
                           (HTMLAppletElementClass self, GlibString string) =>
                             self -> string -> IO ()
htmlAppletElementSetObject self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_applet_element_set_object #}
          (toHTMLAppletElement self)
          valPtr
 
htmlAppletElementGetObject ::
                           (HTMLAppletElementClass self, GlibString string) =>
                             self -> IO string
htmlAppletElementGetObject self
  = ({# call webkit_dom_html_applet_element_get_object #}
       (toHTMLAppletElement self))
      >>=
      readUTFString
 
htmlAppletElementSetVspace ::
                           (HTMLAppletElementClass self) => self -> Int -> IO ()
htmlAppletElementSetVspace self val
  = {# call webkit_dom_html_applet_element_set_vspace #}
      (toHTMLAppletElement self)
      (fromIntegral val)
 
htmlAppletElementGetVspace ::
                           (HTMLAppletElementClass self) => self -> IO Int
htmlAppletElementGetVspace self
  = fromIntegral <$>
      ({# call webkit_dom_html_applet_element_get_vspace #}
         (toHTMLAppletElement self))
 
htmlAppletElementSetWidth ::
                          (HTMLAppletElementClass self, GlibString string) =>
                            self -> string -> IO ()
htmlAppletElementSetWidth self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_applet_element_set_width #}
          (toHTMLAppletElement self)
          valPtr
 
htmlAppletElementGetWidth ::
                          (HTMLAppletElementClass self, GlibString string) =>
                            self -> IO string
htmlAppletElementGetWidth self
  = ({# call webkit_dom_html_applet_element_get_width #}
       (toHTMLAppletElement self))
      >>=
      readUTFString
