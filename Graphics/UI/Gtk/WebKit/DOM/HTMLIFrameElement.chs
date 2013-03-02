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
        htmliFrameElementGetContentWindow)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
htmliFrameElementSetAlign ::
                          (HTMLIFrameElementClass self) => self -> String -> IO ()
htmliFrameElementSetAlign self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_iframe_element_set_align #}
          (toHTMLIFrameElement self)
          valPtr
 
htmliFrameElementGetAlign ::
                          (HTMLIFrameElementClass self) => self -> IO String
htmliFrameElementGetAlign self
  = ({# call webkit_dom_html_iframe_element_get_align #}
       (toHTMLIFrameElement self))
      >>=
      readUTFString
 
htmliFrameElementSetFrameBorder ::
                                (HTMLIFrameElementClass self) => self -> String -> IO ()
htmliFrameElementSetFrameBorder self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_iframe_element_set_frame_border #}
          (toHTMLIFrameElement self)
          valPtr
 
htmliFrameElementGetFrameBorder ::
                                (HTMLIFrameElementClass self) => self -> IO String
htmliFrameElementGetFrameBorder self
  = ({# call webkit_dom_html_iframe_element_get_frame_border #}
       (toHTMLIFrameElement self))
      >>=
      readUTFString
 
htmliFrameElementSetHeight ::
                           (HTMLIFrameElementClass self) => self -> String -> IO ()
htmliFrameElementSetHeight self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_iframe_element_set_height #}
          (toHTMLIFrameElement self)
          valPtr
 
htmliFrameElementGetHeight ::
                           (HTMLIFrameElementClass self) => self -> IO String
htmliFrameElementGetHeight self
  = ({# call webkit_dom_html_iframe_element_get_height #}
       (toHTMLIFrameElement self))
      >>=
      readUTFString
 
htmliFrameElementSetLongDesc ::
                             (HTMLIFrameElementClass self) => self -> String -> IO ()
htmliFrameElementSetLongDesc self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_iframe_element_set_long_desc #}
          (toHTMLIFrameElement self)
          valPtr
 
htmliFrameElementGetLongDesc ::
                             (HTMLIFrameElementClass self) => self -> IO String
htmliFrameElementGetLongDesc self
  = ({# call webkit_dom_html_iframe_element_get_long_desc #}
       (toHTMLIFrameElement self))
      >>=
      readUTFString
 
htmliFrameElementSetMarginHeight ::
                                 (HTMLIFrameElementClass self) => self -> String -> IO ()
htmliFrameElementSetMarginHeight self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_iframe_element_set_margin_height #}
          (toHTMLIFrameElement self)
          valPtr
 
htmliFrameElementGetMarginHeight ::
                                 (HTMLIFrameElementClass self) => self -> IO String
htmliFrameElementGetMarginHeight self
  = ({# call webkit_dom_html_iframe_element_get_margin_height #}
       (toHTMLIFrameElement self))
      >>=
      readUTFString
 
htmliFrameElementSetMarginWidth ::
                                (HTMLIFrameElementClass self) => self -> String -> IO ()
htmliFrameElementSetMarginWidth self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_iframe_element_set_margin_width #}
          (toHTMLIFrameElement self)
          valPtr
 
htmliFrameElementGetMarginWidth ::
                                (HTMLIFrameElementClass self) => self -> IO String
htmliFrameElementGetMarginWidth self
  = ({# call webkit_dom_html_iframe_element_get_margin_width #}
       (toHTMLIFrameElement self))
      >>=
      readUTFString
 
htmliFrameElementSetName ::
                         (HTMLIFrameElementClass self) => self -> String -> IO ()
htmliFrameElementSetName self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_iframe_element_set_name #}
          (toHTMLIFrameElement self)
          valPtr
 
htmliFrameElementGetName ::
                         (HTMLIFrameElementClass self) => self -> IO String
htmliFrameElementGetName self
  = ({# call webkit_dom_html_iframe_element_get_name #}
       (toHTMLIFrameElement self))
      >>=
      readUTFString
 
htmliFrameElementSetSandbox ::
                            (HTMLIFrameElementClass self) => self -> String -> IO ()
htmliFrameElementSetSandbox self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_iframe_element_set_sandbox #}
          (toHTMLIFrameElement self)
          valPtr
 
htmliFrameElementGetSandbox ::
                            (HTMLIFrameElementClass self) => self -> IO String
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
                              (HTMLIFrameElementClass self) => self -> String -> IO ()
htmliFrameElementSetScrolling self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_iframe_element_set_scrolling #}
          (toHTMLIFrameElement self)
          valPtr
 
htmliFrameElementGetScrolling ::
                              (HTMLIFrameElementClass self) => self -> IO String
htmliFrameElementGetScrolling self
  = ({# call webkit_dom_html_iframe_element_get_scrolling #}
       (toHTMLIFrameElement self))
      >>=
      readUTFString
 
htmliFrameElementSetSrc ::
                        (HTMLIFrameElementClass self) => self -> String -> IO ()
htmliFrameElementSetSrc self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_iframe_element_set_src #}
          (toHTMLIFrameElement self)
          valPtr
 
htmliFrameElementGetSrc ::
                        (HTMLIFrameElementClass self) => self -> IO String
htmliFrameElementGetSrc self
  = ({# call webkit_dom_html_iframe_element_get_src #}
       (toHTMLIFrameElement self))
      >>=
      readUTFString
 
#if WEBKIT_CHECK_VERSION(1,10,0)
htmliFrameElementSetSrcdoc ::
                           (HTMLIFrameElementClass self) => self -> String -> IO ()
htmliFrameElementSetSrcdoc self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_iframe_element_set_srcdoc #}
          (toHTMLIFrameElement self)
          valPtr
 
htmliFrameElementGetSrcdoc ::
                           (HTMLIFrameElementClass self) => self -> IO String
htmliFrameElementGetSrcdoc self
  = ({# call webkit_dom_html_iframe_element_get_srcdoc #}
       (toHTMLIFrameElement self))
      >>=
      readUTFString
#endif
 
htmliFrameElementSetWidth ::
                          (HTMLIFrameElementClass self) => self -> String -> IO ()
htmliFrameElementSetWidth self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_iframe_element_set_width #}
          (toHTMLIFrameElement self)
          valPtr
 
htmliFrameElementGetWidth ::
                          (HTMLIFrameElementClass self) => self -> IO String
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
