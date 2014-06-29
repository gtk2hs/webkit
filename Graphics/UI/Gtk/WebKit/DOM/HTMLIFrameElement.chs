module Graphics.UI.Gtk.WebKit.DOM.HTMLIFrameElement
       (htmliFrameElementSetAlign, htmliFrameElementGetAlign,
        htmliFrameElementSetFrameBorder, htmliFrameElementGetFrameBorder,
        htmliFrameElementSetHeight, htmliFrameElementGetHeight,
        htmliFrameElementSetLongDesc, htmliFrameElementGetLongDesc,
        htmliFrameElementSetMarginHeight, htmliFrameElementGetMarginHeight,
        htmliFrameElementSetMarginWidth, htmliFrameElementGetMarginWidth,
        htmliFrameElementSetName, htmliFrameElementGetName,
        htmliFrameElementSetSandbox, htmliFrameElementGetSandbox,
#if WEBKIT_CHECK_VERSION(1,10,0)
        htmliFrameElementSetSeamless, htmliFrameElementGetSeamless,
#endif
        htmliFrameElementSetScrolling, htmliFrameElementGetScrolling,
        htmliFrameElementSetSrc, htmliFrameElementGetSrc,
#if WEBKIT_CHECK_VERSION(1,10,0)
        htmliFrameElementSetSrcdoc, htmliFrameElementGetSrcdoc,
#endif
        htmliFrameElementSetWidth, htmliFrameElementGetWidth,
        htmliFrameElementGetContentDocument,
        htmliFrameElementGetContentWindow, HTMLIFrameElement,
        HTMLIFrameElementClass, castToHTMLIFrameElement,
        gTypeHTMLIFrameElement, toHTMLIFrameElement)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
htmliFrameElementSetAlign ::
                          (HTMLIFrameElementClass self, GlibString string) =>
                            self -> string -> IO ()
htmliFrameElementSetAlign self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_iframe_element_set_align #}
          (toHTMLIFrameElement self)
          valPtr
 
htmliFrameElementGetAlign ::
                          (HTMLIFrameElementClass self, GlibString string) =>
                            self -> IO string
htmliFrameElementGetAlign self
  = ({# call webkit_dom_html_iframe_element_get_align #}
       (toHTMLIFrameElement self))
      >>=
      readUTFString
 
htmliFrameElementSetFrameBorder ::
                                (HTMLIFrameElementClass self, GlibString string) =>
                                  self -> string -> IO ()
htmliFrameElementSetFrameBorder self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_iframe_element_set_frame_border #}
          (toHTMLIFrameElement self)
          valPtr
 
htmliFrameElementGetFrameBorder ::
                                (HTMLIFrameElementClass self, GlibString string) =>
                                  self -> IO string
htmliFrameElementGetFrameBorder self
  = ({# call webkit_dom_html_iframe_element_get_frame_border #}
       (toHTMLIFrameElement self))
      >>=
      readUTFString
 
htmliFrameElementSetHeight ::
                           (HTMLIFrameElementClass self, GlibString string) =>
                             self -> string -> IO ()
htmliFrameElementSetHeight self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_iframe_element_set_height #}
          (toHTMLIFrameElement self)
          valPtr
 
htmliFrameElementGetHeight ::
                           (HTMLIFrameElementClass self, GlibString string) =>
                             self -> IO string
htmliFrameElementGetHeight self
  = ({# call webkit_dom_html_iframe_element_get_height #}
       (toHTMLIFrameElement self))
      >>=
      readUTFString
 
htmliFrameElementSetLongDesc ::
                             (HTMLIFrameElementClass self, GlibString string) =>
                               self -> string -> IO ()
htmliFrameElementSetLongDesc self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_iframe_element_set_long_desc #}
          (toHTMLIFrameElement self)
          valPtr
 
htmliFrameElementGetLongDesc ::
                             (HTMLIFrameElementClass self, GlibString string) =>
                               self -> IO string
htmliFrameElementGetLongDesc self
  = ({# call webkit_dom_html_iframe_element_get_long_desc #}
       (toHTMLIFrameElement self))
      >>=
      readUTFString
 
htmliFrameElementSetMarginHeight ::
                                 (HTMLIFrameElementClass self, GlibString string) =>
                                   self -> string -> IO ()
htmliFrameElementSetMarginHeight self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_iframe_element_set_margin_height #}
          (toHTMLIFrameElement self)
          valPtr
 
htmliFrameElementGetMarginHeight ::
                                 (HTMLIFrameElementClass self, GlibString string) =>
                                   self -> IO string
htmliFrameElementGetMarginHeight self
  = ({# call webkit_dom_html_iframe_element_get_margin_height #}
       (toHTMLIFrameElement self))
      >>=
      readUTFString
 
htmliFrameElementSetMarginWidth ::
                                (HTMLIFrameElementClass self, GlibString string) =>
                                  self -> string -> IO ()
htmliFrameElementSetMarginWidth self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_iframe_element_set_margin_width #}
          (toHTMLIFrameElement self)
          valPtr
 
htmliFrameElementGetMarginWidth ::
                                (HTMLIFrameElementClass self, GlibString string) =>
                                  self -> IO string
htmliFrameElementGetMarginWidth self
  = ({# call webkit_dom_html_iframe_element_get_margin_width #}
       (toHTMLIFrameElement self))
      >>=
      readUTFString
 
htmliFrameElementSetName ::
                         (HTMLIFrameElementClass self, GlibString string) =>
                           self -> string -> IO ()
htmliFrameElementSetName self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_iframe_element_set_name #}
          (toHTMLIFrameElement self)
          valPtr
 
htmliFrameElementGetName ::
                         (HTMLIFrameElementClass self, GlibString string) =>
                           self -> IO string
htmliFrameElementGetName self
  = ({# call webkit_dom_html_iframe_element_get_name #}
       (toHTMLIFrameElement self))
      >>=
      readUTFString
 
htmliFrameElementSetSandbox ::
                            (HTMLIFrameElementClass self, GlibString string) =>
                              self -> string -> IO ()
htmliFrameElementSetSandbox self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_iframe_element_set_sandbox #}
          (toHTMLIFrameElement self)
          valPtr
 
htmliFrameElementGetSandbox ::
                            (HTMLIFrameElementClass self, GlibString string) =>
                              self -> IO string
htmliFrameElementGetSandbox self
  = ({# call webkit_dom_html_iframe_element_get_sandbox #}
       (toHTMLIFrameElement self))
      >>=
      readUTFString
 
#if WEBKIT_CHECK_VERSION(1,10,0)
htmliFrameElementSetSeamless ::
                             (HTMLIFrameElementClass self) => self -> Bool -> IO ()
htmliFrameElementSetSeamless self val
  = {# call webkit_dom_html_iframe_element_set_seamless #}
      (toHTMLIFrameElement self)
      (fromBool val)
 
htmliFrameElementGetSeamless ::
                             (HTMLIFrameElementClass self) => self -> IO Bool
htmliFrameElementGetSeamless self
  = toBool <$>
      ({# call webkit_dom_html_iframe_element_get_seamless #}
         (toHTMLIFrameElement self))
#endif
 
htmliFrameElementSetScrolling ::
                              (HTMLIFrameElementClass self, GlibString string) =>
                                self -> string -> IO ()
htmliFrameElementSetScrolling self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_iframe_element_set_scrolling #}
          (toHTMLIFrameElement self)
          valPtr
 
htmliFrameElementGetScrolling ::
                              (HTMLIFrameElementClass self, GlibString string) =>
                                self -> IO string
htmliFrameElementGetScrolling self
  = ({# call webkit_dom_html_iframe_element_get_scrolling #}
       (toHTMLIFrameElement self))
      >>=
      readUTFString
 
htmliFrameElementSetSrc ::
                        (HTMLIFrameElementClass self, GlibString string) =>
                          self -> string -> IO ()
htmliFrameElementSetSrc self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_iframe_element_set_src #}
          (toHTMLIFrameElement self)
          valPtr
 
htmliFrameElementGetSrc ::
                        (HTMLIFrameElementClass self, GlibString string) =>
                          self -> IO string
htmliFrameElementGetSrc self
  = ({# call webkit_dom_html_iframe_element_get_src #}
       (toHTMLIFrameElement self))
      >>=
      readUTFString
 
#if WEBKIT_CHECK_VERSION(1,10,0)
htmliFrameElementSetSrcdoc ::
                           (HTMLIFrameElementClass self, GlibString string) =>
                             self -> string -> IO ()
htmliFrameElementSetSrcdoc self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_iframe_element_set_srcdoc #}
          (toHTMLIFrameElement self)
          valPtr
 
htmliFrameElementGetSrcdoc ::
                           (HTMLIFrameElementClass self, GlibString string) =>
                             self -> IO string
htmliFrameElementGetSrcdoc self
  = ({# call webkit_dom_html_iframe_element_get_srcdoc #}
       (toHTMLIFrameElement self))
      >>=
      readUTFString
#endif
 
htmliFrameElementSetWidth ::
                          (HTMLIFrameElementClass self, GlibString string) =>
                            self -> string -> IO ()
htmliFrameElementSetWidth self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_iframe_element_set_width #}
          (toHTMLIFrameElement self)
          valPtr
 
htmliFrameElementGetWidth ::
                          (HTMLIFrameElementClass self, GlibString string) =>
                            self -> IO string
htmliFrameElementGetWidth self
  = ({# call webkit_dom_html_iframe_element_get_width #}
       (toHTMLIFrameElement self))
      >>=
      readUTFString
 
htmliFrameElementGetContentDocument ::
                                    (HTMLIFrameElementClass self) => self -> IO (Maybe Document)
htmliFrameElementGetContentDocument self
  = maybeNull (makeNewGObject mkDocument)
      ({# call webkit_dom_html_iframe_element_get_content_document #}
         (toHTMLIFrameElement self))
 
htmliFrameElementGetContentWindow ::
                                  (HTMLIFrameElementClass self) => self -> IO (Maybe DOMWindow)
htmliFrameElementGetContentWindow self
  = maybeNull (makeNewGObject mkDOMWindow)
      ({# call webkit_dom_html_iframe_element_get_content_window #}
         (toHTMLIFrameElement self))
