module Graphics.UI.Gtk.WebKit.DOM.HTMLDocument
       (htmlDocumentClose, htmlDocumentClear, htmlDocumentCaptureEvents,
        htmlDocumentReleaseEvents, htmlDocumentHasFocus,
        htmlDocumentGetEmbeds, htmlDocumentGetPlugins,
        htmlDocumentGetScripts, htmlDocumentGetWidth,
        htmlDocumentGetHeight, htmlDocumentSetDir, htmlDocumentGetDir,
        htmlDocumentSetDesignMode, htmlDocumentGetDesignMode,
        htmlDocumentGetCompatMode, htmlDocumentGetActiveElement,
        htmlDocumentSetBgColor, htmlDocumentGetBgColor,
        htmlDocumentSetFgColor, htmlDocumentGetFgColor,
        htmlDocumentSetAlinkColor, htmlDocumentGetAlinkColor,
        htmlDocumentSetLinkColor, htmlDocumentGetLinkColor,
        htmlDocumentSetVlinkColor, htmlDocumentGetVlinkColor)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
htmlDocumentClose :: (HTMLDocumentClass self) => self -> IO ()
htmlDocumentClose self
  = {# call webkit_dom_html_document_close #} (toHTMLDocument self)
 
htmlDocumentClear :: (HTMLDocumentClass self) => self -> IO ()
htmlDocumentClear self
  = {# call webkit_dom_html_document_clear #} (toHTMLDocument self)
 
htmlDocumentCaptureEvents ::
                          (HTMLDocumentClass self) => self -> IO ()
htmlDocumentCaptureEvents self
  = {# call webkit_dom_html_document_capture_events #}
      (toHTMLDocument self)
 
htmlDocumentReleaseEvents ::
                          (HTMLDocumentClass self) => self -> IO ()
htmlDocumentReleaseEvents self
  = {# call webkit_dom_html_document_release_events #}
      (toHTMLDocument self)
 
htmlDocumentHasFocus :: (HTMLDocumentClass self) => self -> IO Bool
htmlDocumentHasFocus self
  = toBool <$>
      ({# call webkit_dom_html_document_has_focus #}
         (toHTMLDocument self))
 
htmlDocumentGetEmbeds ::
                      (HTMLDocumentClass self) => self -> IO (Maybe HTMLCollection)
htmlDocumentGetEmbeds self
  = maybeNull (makeNewGObject mkHTMLCollection)
      ({# call webkit_dom_html_document_get_embeds #}
         (toHTMLDocument self))
 
htmlDocumentGetPlugins ::
                       (HTMLDocumentClass self) => self -> IO (Maybe HTMLCollection)
htmlDocumentGetPlugins self
  = maybeNull (makeNewGObject mkHTMLCollection)
      ({# call webkit_dom_html_document_get_plugins #}
         (toHTMLDocument self))
 
htmlDocumentGetScripts ::
                       (HTMLDocumentClass self) => self -> IO (Maybe HTMLCollection)
htmlDocumentGetScripts self
  = maybeNull (makeNewGObject mkHTMLCollection)
      ({# call webkit_dom_html_document_get_scripts #}
         (toHTMLDocument self))
 
htmlDocumentGetWidth :: (HTMLDocumentClass self) => self -> IO Int
htmlDocumentGetWidth self
  = fromIntegral <$>
      ({# call webkit_dom_html_document_get_width #}
         (toHTMLDocument self))
 
htmlDocumentGetHeight :: (HTMLDocumentClass self) => self -> IO Int
htmlDocumentGetHeight self
  = fromIntegral <$>
      ({# call webkit_dom_html_document_get_height #}
         (toHTMLDocument self))
 
htmlDocumentSetDir ::
                   (HTMLDocumentClass self) => self -> String -> IO ()
htmlDocumentSetDir self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_document_set_dir #} (toHTMLDocument self)
          valPtr
 
htmlDocumentGetDir :: (HTMLDocumentClass self) => self -> IO String
htmlDocumentGetDir self
  = ({# call webkit_dom_html_document_get_dir #}
       (toHTMLDocument self))
      >>=
      readUTFString
 
htmlDocumentSetDesignMode ::
                          (HTMLDocumentClass self) => self -> String -> IO ()
htmlDocumentSetDesignMode self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_document_set_design_mode #}
          (toHTMLDocument self)
          valPtr
 
htmlDocumentGetDesignMode ::
                          (HTMLDocumentClass self) => self -> IO String
htmlDocumentGetDesignMode self
  = ({# call webkit_dom_html_document_get_design_mode #}
       (toHTMLDocument self))
      >>=
      readUTFString
 
htmlDocumentGetCompatMode ::
                          (HTMLDocumentClass self) => self -> IO String
htmlDocumentGetCompatMode self
  = ({# call webkit_dom_html_document_get_compat_mode #}
       (toHTMLDocument self))
      >>=
      readUTFString
 
htmlDocumentGetActiveElement ::
                             (HTMLDocumentClass self) => self -> IO (Maybe Element)
htmlDocumentGetActiveElement self
  = maybeNull (makeNewGObject mkElement)
      ({# call webkit_dom_html_document_get_active_element #}
         (toHTMLDocument self))
 
htmlDocumentSetBgColor ::
                       (HTMLDocumentClass self) => self -> String -> IO ()
htmlDocumentSetBgColor self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_document_set_bg_color #}
          (toHTMLDocument self)
          valPtr
 
htmlDocumentGetBgColor ::
                       (HTMLDocumentClass self) => self -> IO String
htmlDocumentGetBgColor self
  = ({# call webkit_dom_html_document_get_bg_color #}
       (toHTMLDocument self))
      >>=
      readUTFString
 
htmlDocumentSetFgColor ::
                       (HTMLDocumentClass self) => self -> String -> IO ()
htmlDocumentSetFgColor self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_document_set_fg_color #}
          (toHTMLDocument self)
          valPtr
 
htmlDocumentGetFgColor ::
                       (HTMLDocumentClass self) => self -> IO String
htmlDocumentGetFgColor self
  = ({# call webkit_dom_html_document_get_fg_color #}
       (toHTMLDocument self))
      >>=
      readUTFString
 
htmlDocumentSetAlinkColor ::
                          (HTMLDocumentClass self) => self -> String -> IO ()
htmlDocumentSetAlinkColor self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_document_set_alink_color #}
          (toHTMLDocument self)
          valPtr
 
htmlDocumentGetAlinkColor ::
                          (HTMLDocumentClass self) => self -> IO String
htmlDocumentGetAlinkColor self
  = ({# call webkit_dom_html_document_get_alink_color #}
       (toHTMLDocument self))
      >>=
      readUTFString
 
htmlDocumentSetLinkColor ::
                         (HTMLDocumentClass self) => self -> String -> IO ()
htmlDocumentSetLinkColor self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_document_set_link_color #}
          (toHTMLDocument self)
          valPtr
 
htmlDocumentGetLinkColor ::
                         (HTMLDocumentClass self) => self -> IO String
htmlDocumentGetLinkColor self
  = ({# call webkit_dom_html_document_get_link_color #}
       (toHTMLDocument self))
      >>=
      readUTFString
 
htmlDocumentSetVlinkColor ::
                          (HTMLDocumentClass self) => self -> String -> IO ()
htmlDocumentSetVlinkColor self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_document_set_vlink_color #}
          (toHTMLDocument self)
          valPtr
 
htmlDocumentGetVlinkColor ::
                          (HTMLDocumentClass self) => self -> IO String
htmlDocumentGetVlinkColor self
  = ({# call webkit_dom_html_document_get_vlink_color #}
       (toHTMLDocument self))
      >>=
      readUTFString
