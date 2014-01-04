module Graphics.UI.Gtk.WebKit.DOM.HTMLFrameElement
       (htmlFrameElementSetFrameBorder, htmlFrameElementGetFrameBorder,
        htmlFrameElementSetLongDesc, htmlFrameElementGetLongDesc,
        htmlFrameElementSetMarginHeight, htmlFrameElementGetMarginHeight,
        htmlFrameElementSetMarginWidth, htmlFrameElementGetMarginWidth,
        htmlFrameElementSetName, htmlFrameElementGetName,
        htmlFrameElementSetNoResize, htmlFrameElementGetNoResize,
        htmlFrameElementSetScrolling, htmlFrameElementGetScrolling,
        htmlFrameElementSetSrc, htmlFrameElementGetSrc,
        htmlFrameElementGetContentDocument,
        htmlFrameElementGetContentWindow, htmlFrameElementGetWidth,
        htmlFrameElementGetHeight, HTMLFrameElement, HTMLFrameElementClass,
        castToHTMLFrameElement, gTypeHTMLFrameElement, toHTMLFrameElement)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
htmlFrameElementSetFrameBorder ::
                               (HTMLFrameElementClass self) => self -> String -> IO ()
htmlFrameElementSetFrameBorder self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_frame_element_set_frame_border #}
          (toHTMLFrameElement self)
          valPtr
 
htmlFrameElementGetFrameBorder ::
                               (HTMLFrameElementClass self) => self -> IO String
htmlFrameElementGetFrameBorder self
  = ({# call webkit_dom_html_frame_element_get_frame_border #}
       (toHTMLFrameElement self))
      >>=
      readUTFString
 
htmlFrameElementSetLongDesc ::
                            (HTMLFrameElementClass self) => self -> String -> IO ()
htmlFrameElementSetLongDesc self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_frame_element_set_long_desc #}
          (toHTMLFrameElement self)
          valPtr
 
htmlFrameElementGetLongDesc ::
                            (HTMLFrameElementClass self) => self -> IO String
htmlFrameElementGetLongDesc self
  = ({# call webkit_dom_html_frame_element_get_long_desc #}
       (toHTMLFrameElement self))
      >>=
      readUTFString
 
htmlFrameElementSetMarginHeight ::
                                (HTMLFrameElementClass self) => self -> String -> IO ()
htmlFrameElementSetMarginHeight self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_frame_element_set_margin_height #}
          (toHTMLFrameElement self)
          valPtr
 
htmlFrameElementGetMarginHeight ::
                                (HTMLFrameElementClass self) => self -> IO String
htmlFrameElementGetMarginHeight self
  = ({# call webkit_dom_html_frame_element_get_margin_height #}
       (toHTMLFrameElement self))
      >>=
      readUTFString
 
htmlFrameElementSetMarginWidth ::
                               (HTMLFrameElementClass self) => self -> String -> IO ()
htmlFrameElementSetMarginWidth self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_frame_element_set_margin_width #}
          (toHTMLFrameElement self)
          valPtr
 
htmlFrameElementGetMarginWidth ::
                               (HTMLFrameElementClass self) => self -> IO String
htmlFrameElementGetMarginWidth self
  = ({# call webkit_dom_html_frame_element_get_margin_width #}
       (toHTMLFrameElement self))
      >>=
      readUTFString
 
htmlFrameElementSetName ::
                        (HTMLFrameElementClass self) => self -> String -> IO ()
htmlFrameElementSetName self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_frame_element_set_name #}
          (toHTMLFrameElement self)
          valPtr
 
htmlFrameElementGetName ::
                        (HTMLFrameElementClass self) => self -> IO String
htmlFrameElementGetName self
  = ({# call webkit_dom_html_frame_element_get_name #}
       (toHTMLFrameElement self))
      >>=
      readUTFString
 
htmlFrameElementSetNoResize ::
                            (HTMLFrameElementClass self) => self -> Bool -> IO ()
htmlFrameElementSetNoResize self val
  = {# call webkit_dom_html_frame_element_set_no_resize #}
      (toHTMLFrameElement self)
      (fromBool val)
 
htmlFrameElementGetNoResize ::
                            (HTMLFrameElementClass self) => self -> IO Bool
htmlFrameElementGetNoResize self
  = toBool <$>
      ({# call webkit_dom_html_frame_element_get_no_resize #}
         (toHTMLFrameElement self))
 
htmlFrameElementSetScrolling ::
                             (HTMLFrameElementClass self) => self -> String -> IO ()
htmlFrameElementSetScrolling self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_frame_element_set_scrolling #}
          (toHTMLFrameElement self)
          valPtr
 
htmlFrameElementGetScrolling ::
                             (HTMLFrameElementClass self) => self -> IO String
htmlFrameElementGetScrolling self
  = ({# call webkit_dom_html_frame_element_get_scrolling #}
       (toHTMLFrameElement self))
      >>=
      readUTFString
 
htmlFrameElementSetSrc ::
                       (HTMLFrameElementClass self) => self -> String -> IO ()
htmlFrameElementSetSrc self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_frame_element_set_src #}
          (toHTMLFrameElement self)
          valPtr
 
htmlFrameElementGetSrc ::
                       (HTMLFrameElementClass self) => self -> IO String
htmlFrameElementGetSrc self
  = ({# call webkit_dom_html_frame_element_get_src #}
       (toHTMLFrameElement self))
      >>=
      readUTFString
 
htmlFrameElementGetContentDocument ::
                                   (HTMLFrameElementClass self) => self -> IO (Maybe Document)
htmlFrameElementGetContentDocument self
  = maybeNull (makeNewGObject mkDocument)
      ({# call webkit_dom_html_frame_element_get_content_document #}
         (toHTMLFrameElement self))
 
htmlFrameElementGetContentWindow ::
                                 (HTMLFrameElementClass self) => self -> IO (Maybe DOMWindow)
htmlFrameElementGetContentWindow self
  = maybeNull (makeNewGObject mkDOMWindow)
      ({# call webkit_dom_html_frame_element_get_content_window #}
         (toHTMLFrameElement self))
 
htmlFrameElementGetWidth ::
                         (HTMLFrameElementClass self) => self -> IO Int
htmlFrameElementGetWidth self
  = fromIntegral <$>
      ({# call webkit_dom_html_frame_element_get_width #}
         (toHTMLFrameElement self))
 
htmlFrameElementGetHeight ::
                          (HTMLFrameElementClass self) => self -> IO Int
htmlFrameElementGetHeight self
  = fromIntegral <$>
      ({# call webkit_dom_html_frame_element_get_height #}
         (toHTMLFrameElement self))
