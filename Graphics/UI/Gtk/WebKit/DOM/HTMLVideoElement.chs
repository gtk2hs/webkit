module Graphics.UI.Gtk.WebKit.DOM.HTMLVideoElement
       (htmlVideoElementWebkitEnterFullscreen,
        htmlVideoElementWebkitExitFullscreen,
        htmlVideoElementWebkitEnterFullScreen,
        htmlVideoElementWebkitExitFullScreen, htmlVideoElementSetWidth,
        htmlVideoElementGetWidth, htmlVideoElementSetHeight,
        htmlVideoElementGetHeight, htmlVideoElementGetVideoWidth,
        htmlVideoElementGetVideoHeight, htmlVideoElementSetPoster,
        htmlVideoElementGetPoster,
        htmlVideoElementGetWebkitSupportsFullscreen,
        htmlVideoElementGetWebkitDisplayingFullscreen,
        htmlVideoElementGetWebkitDecodedFrameCount,
        htmlVideoElementGetWebkitDroppedFrameCount, HTMLVideoElement,
        HTMLVideoElementClass, castToHTMLVideoElement,
        gTypeHTMLVideoElement, toHTMLVideoElement)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
htmlVideoElementWebkitEnterFullscreen ::
                                      (HTMLVideoElementClass self) => self -> IO ()
htmlVideoElementWebkitEnterFullscreen self
  = propagateGError $
      \ errorPtr_ ->
        {# call webkit_dom_html_video_element_webkit_enter_fullscreen #}
          (toHTMLVideoElement self)
          errorPtr_
 
htmlVideoElementWebkitExitFullscreen ::
                                     (HTMLVideoElementClass self) => self -> IO ()
htmlVideoElementWebkitExitFullscreen self
  = {# call webkit_dom_html_video_element_webkit_exit_fullscreen #}
      (toHTMLVideoElement self)
 
htmlVideoElementWebkitEnterFullScreen ::
                                      (HTMLVideoElementClass self) => self -> IO ()
htmlVideoElementWebkitEnterFullScreen self
  = propagateGError $
      \ errorPtr_ ->
        {# call webkit_dom_html_video_element_webkit_enter_full_screen #}
          (toHTMLVideoElement self)
          errorPtr_
 
htmlVideoElementWebkitExitFullScreen ::
                                     (HTMLVideoElementClass self) => self -> IO ()
htmlVideoElementWebkitExitFullScreen self
  = {# call webkit_dom_html_video_element_webkit_exit_full_screen #}
      (toHTMLVideoElement self)
 
htmlVideoElementSetWidth ::
                         (HTMLVideoElementClass self) => self -> Word -> IO ()
htmlVideoElementSetWidth self val
  = {# call webkit_dom_html_video_element_set_width #}
      (toHTMLVideoElement self)
      (fromIntegral val)
 
htmlVideoElementGetWidth ::
                         (HTMLVideoElementClass self) => self -> IO Word
htmlVideoElementGetWidth self
  = fromIntegral <$>
      ({# call webkit_dom_html_video_element_get_width #}
         (toHTMLVideoElement self))
 
htmlVideoElementSetHeight ::
                          (HTMLVideoElementClass self) => self -> Word -> IO ()
htmlVideoElementSetHeight self val
  = {# call webkit_dom_html_video_element_set_height #}
      (toHTMLVideoElement self)
      (fromIntegral val)
 
htmlVideoElementGetHeight ::
                          (HTMLVideoElementClass self) => self -> IO Word
htmlVideoElementGetHeight self
  = fromIntegral <$>
      ({# call webkit_dom_html_video_element_get_height #}
         (toHTMLVideoElement self))
 
htmlVideoElementGetVideoWidth ::
                              (HTMLVideoElementClass self) => self -> IO Word
htmlVideoElementGetVideoWidth self
  = fromIntegral <$>
      ({# call webkit_dom_html_video_element_get_video_width #}
         (toHTMLVideoElement self))
 
htmlVideoElementGetVideoHeight ::
                               (HTMLVideoElementClass self) => self -> IO Word
htmlVideoElementGetVideoHeight self
  = fromIntegral <$>
      ({# call webkit_dom_html_video_element_get_video_height #}
         (toHTMLVideoElement self))
 
htmlVideoElementSetPoster ::
                          (HTMLVideoElementClass self, GlibString string) =>
                            self -> string -> IO ()
htmlVideoElementSetPoster self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_video_element_set_poster #}
          (toHTMLVideoElement self)
          valPtr
 
htmlVideoElementGetPoster ::
                          (HTMLVideoElementClass self, GlibString string) =>
                            self -> IO string
htmlVideoElementGetPoster self
  = ({# call webkit_dom_html_video_element_get_poster #}
       (toHTMLVideoElement self))
      >>=
      readUTFString
 
htmlVideoElementGetWebkitSupportsFullscreen ::
                                            (HTMLVideoElementClass self) => self -> IO Bool
htmlVideoElementGetWebkitSupportsFullscreen self
  = toBool <$>
      ({# call
         webkit_dom_html_video_element_get_webkit_supports_fullscreen
         #}
         (toHTMLVideoElement self))
 
htmlVideoElementGetWebkitDisplayingFullscreen ::
                                              (HTMLVideoElementClass self) => self -> IO Bool
htmlVideoElementGetWebkitDisplayingFullscreen self
  = toBool <$>
      ({# call
         webkit_dom_html_video_element_get_webkit_displaying_fullscreen
         #}
         (toHTMLVideoElement self))
 
htmlVideoElementGetWebkitDecodedFrameCount ::
                                           (HTMLVideoElementClass self) => self -> IO Word
htmlVideoElementGetWebkitDecodedFrameCount self
  = fromIntegral <$>
      ({# call
         webkit_dom_html_video_element_get_webkit_decoded_frame_count
         #}
         (toHTMLVideoElement self))
 
htmlVideoElementGetWebkitDroppedFrameCount ::
                                           (HTMLVideoElementClass self) => self -> IO Word
htmlVideoElementGetWebkitDroppedFrameCount self
  = fromIntegral <$>
      ({# call
         webkit_dom_html_video_element_get_webkit_dropped_frame_count
         #}
         (toHTMLVideoElement self))
