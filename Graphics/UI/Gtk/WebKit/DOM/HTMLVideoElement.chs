module Graphics.UI.Gtk.WebKit.DOM.HTMLVideoElement(
webkitEnterFullscreen,
webkitExitFullscreen,
webkitEnterFullScreen,
webkitExitFullScreen,
#if WEBKIT_CHECK_VERSION(99,0,0)
webkitSupportsPresentationMode,
webkitSetPresentationMode,
#endif
setWidth,
getWidth,
setHeight,
getHeight,
getVideoWidth,
getVideoHeight,
setPoster,
getPoster,
getWebkitSupportsFullscreen,
getWebkitDisplayingFullscreen,
#if WEBKIT_CHECK_VERSION(2,4,0)
setWebkitWirelessVideoPlaybackDisabled,
getWebkitWirelessVideoPlaybackDisabled,
#endif
getWebkitDecodedFrameCount,
getWebkitDroppedFrameCount,
#if WEBKIT_CHECK_VERSION(99,0,0)
getWebkitPresentationMode,
#endif
webKitPresentationModeChanged,
HTMLVideoElement,
castToHTMLVideoElement,
gTypeHTMLVideoElement,
HTMLVideoElementClass,
toHTMLVideoElement,
) where
import Prelude hiding (drop, error, print)
import Data.Typeable (Typeable)
import Foreign.Marshal (maybePeek, maybeWith)
import System.Glib.FFI (maybeNull, withForeignPtr, nullForeignPtr, Ptr, nullPtr, castPtr, Word, Int64, Word64, CChar(..), CInt(..), CUInt(..), CLong(..), CULong(..), CLLong(..), CULLong(..), CShort(..), CUShort(..), CFloat(..), CDouble(..), toBool, fromBool)
import System.Glib.UTFString (GlibString(..), readUTFString)
import Control.Applicative ((<$>))
import Control.Monad (void)
import Control.Monad.IO.Class (MonadIO(..))
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventTargetClosures
import Graphics.UI.Gtk.WebKit.DOM.EventM
{#import Graphics.UI.Gtk.WebKit.Types#}
import Graphics.UI.Gtk.WebKit.DOM.Enums

 
webkitEnterFullscreen ::
                      (MonadIO m, HTMLVideoElementClass self) => self -> m ()
webkitEnterFullscreen self
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_html_video_element_webkit_enter_fullscreen #}
             (toHTMLVideoElement self)
             errorPtr_)
 
webkitExitFullscreen ::
                     (MonadIO m, HTMLVideoElementClass self) => self -> m ()
webkitExitFullscreen self
  = liftIO
      ({# call webkit_dom_html_video_element_webkit_exit_fullscreen #}
         (toHTMLVideoElement self))
 
webkitEnterFullScreen ::
                      (MonadIO m, HTMLVideoElementClass self) => self -> m ()
webkitEnterFullScreen self
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_html_video_element_webkit_enter_full_screen #}
             (toHTMLVideoElement self)
             errorPtr_)
 
webkitExitFullScreen ::
                     (MonadIO m, HTMLVideoElementClass self) => self -> m ()
webkitExitFullScreen self
  = liftIO
      ({# call webkit_dom_html_video_element_webkit_exit_full_screen #}
         (toHTMLVideoElement self))

#if WEBKIT_CHECK_VERSION(99,0,0) 
webkitSupportsPresentationMode ::
                               (MonadIO m, HTMLVideoElementClass self) =>
                                 self -> VideoPresentationMode -> m Bool
webkitSupportsPresentationMode self mode
  = liftIO
      (toBool <$>
         (withUTFString (enumToString mode) $
            \ modePtr ->
              {# call
                webkit_dom_html_video_element_webkit_supports_presentation_mode
                #}
                (toHTMLVideoElement self)
                modePtr))
 
webkitSetPresentationMode ::
                          (MonadIO m, HTMLVideoElementClass self) =>
                            self -> VideoPresentationMode -> m ()
webkitSetPresentationMode self mode
  = liftIO
      (withUTFString (enumToString mode) $
         \ modePtr ->
           {# call webkit_dom_html_video_element_webkit_set_presentation_mode
             #}
             (toHTMLVideoElement self)
             modePtr)
#endif
 
setWidth ::
         (MonadIO m, HTMLVideoElementClass self) => self -> Word -> m ()
setWidth self val
  = liftIO
      ({# call webkit_dom_html_video_element_set_width #}
         (toHTMLVideoElement self)
         (fromIntegral val))
 
getWidth ::
         (MonadIO m, HTMLVideoElementClass self) => self -> m Word
getWidth self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_html_video_element_get_width #}
            (toHTMLVideoElement self)))
 
setHeight ::
          (MonadIO m, HTMLVideoElementClass self) => self -> Word -> m ()
setHeight self val
  = liftIO
      ({# call webkit_dom_html_video_element_set_height #}
         (toHTMLVideoElement self)
         (fromIntegral val))
 
getHeight ::
          (MonadIO m, HTMLVideoElementClass self) => self -> m Word
getHeight self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_html_video_element_get_height #}
            (toHTMLVideoElement self)))
 
getVideoWidth ::
              (MonadIO m, HTMLVideoElementClass self) => self -> m Word
getVideoWidth self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_html_video_element_get_video_width #}
            (toHTMLVideoElement self)))
 
getVideoHeight ::
               (MonadIO m, HTMLVideoElementClass self) => self -> m Word
getVideoHeight self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_html_video_element_get_video_height #}
            (toHTMLVideoElement self)))
 
setPoster ::
          (MonadIO m, HTMLVideoElementClass self, GlibString string) =>
            self -> string -> m ()
setPoster self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_video_element_set_poster #}
             (toHTMLVideoElement self)
             valPtr)
 
getPoster ::
          (MonadIO m, HTMLVideoElementClass self, GlibString string) =>
            self -> m string
getPoster self
  = liftIO
      (({# call webkit_dom_html_video_element_get_poster #}
          (toHTMLVideoElement self))
         >>=
         readUTFString)
 
getWebkitSupportsFullscreen ::
                            (MonadIO m, HTMLVideoElementClass self) => self -> m Bool
getWebkitSupportsFullscreen self
  = liftIO
      (toBool <$>
         ({# call
            webkit_dom_html_video_element_get_webkit_supports_fullscreen
            #}
            (toHTMLVideoElement self)))
 
getWebkitDisplayingFullscreen ::
                              (MonadIO m, HTMLVideoElementClass self) => self -> m Bool
getWebkitDisplayingFullscreen self
  = liftIO
      (toBool <$>
         ({# call
            webkit_dom_html_video_element_get_webkit_displaying_fullscreen
            #}
            (toHTMLVideoElement self)))

#if WEBKIT_CHECK_VERSION(2,4,0) 
setWebkitWirelessVideoPlaybackDisabled ::
                                       (MonadIO m, HTMLVideoElementClass self) =>
                                         self -> Bool -> m ()
setWebkitWirelessVideoPlaybackDisabled self val
  = liftIO
      ({# call
         webkit_dom_html_video_element_set_webkit_wireless_video_playback_disabled
         #}
         (toHTMLVideoElement self)
         (fromBool val))
 
getWebkitWirelessVideoPlaybackDisabled ::
                                       (MonadIO m, HTMLVideoElementClass self) => self -> m Bool
getWebkitWirelessVideoPlaybackDisabled self
  = liftIO
      (toBool <$>
         ({# call
            webkit_dom_html_video_element_get_webkit_wireless_video_playback_disabled
            #}
            (toHTMLVideoElement self)))
#endif
 
getWebkitDecodedFrameCount ::
                           (MonadIO m, HTMLVideoElementClass self) => self -> m Word
getWebkitDecodedFrameCount self
  = liftIO
      (fromIntegral <$>
         ({# call
            webkit_dom_html_video_element_get_webkit_decoded_frame_count
            #}
            (toHTMLVideoElement self)))
 
getWebkitDroppedFrameCount ::
                           (MonadIO m, HTMLVideoElementClass self) => self -> m Word
getWebkitDroppedFrameCount self
  = liftIO
      (fromIntegral <$>
         ({# call
            webkit_dom_html_video_element_get_webkit_dropped_frame_count
            #}
            (toHTMLVideoElement self)))

#if WEBKIT_CHECK_VERSION(99,0,0) 
getWebkitPresentationMode ::
                          (MonadIO m, HTMLVideoElementClass self) =>
                            self -> m VideoPresentationMode
getWebkitPresentationMode self
  = liftIO
      (stringToEnum <$>
         (({# call
             webkit_dom_html_video_element_get_webkit_presentation_mode
             #}
             (toHTMLVideoElement self))
            >>=
            readUTFString))
#endif
 
webKitPresentationModeChanged ::
                              (HTMLVideoElementClass self) => EventName self Event
webKitPresentationModeChanged
  = EventName "webkitpresentationmodechanged"
