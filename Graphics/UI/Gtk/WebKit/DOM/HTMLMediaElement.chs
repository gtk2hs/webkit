module Graphics.UI.Gtk.WebKit.DOM.HTMLMediaElement
       (htmlMediaElementLoad, htmlMediaElementCanPlayType,
        htmlMediaElementPlay, htmlMediaElementPause, cNETWORK_EMPTY,
        cNETWORK_IDLE, cNETWORK_LOADING, cNETWORK_NO_SOURCE, cHAVE_NOTHING,
        cHAVE_METADATA, cHAVE_CURRENT_DATA, cHAVE_FUTURE_DATA,
        cHAVE_ENOUGH_DATA, htmlMediaElementGetError,
        htmlMediaElementSetSrc, htmlMediaElementGetSrc,
        htmlMediaElementGetCurrentSrc, htmlMediaElementGetNetworkState,
        htmlMediaElementSetPreload, htmlMediaElementGetPreload,
        htmlMediaElementGetBuffered, htmlMediaElementGetReadyState,
        htmlMediaElementGetSeeking, htmlMediaElementSetCurrentTime,
        htmlMediaElementGetCurrentTime, htmlMediaElementGetInitialTime,
        htmlMediaElementGetStartTime, htmlMediaElementGetDuration,
        htmlMediaElementGetPaused, htmlMediaElementSetDefaultPlaybackRate,
        htmlMediaElementGetDefaultPlaybackRate,
        htmlMediaElementSetPlaybackRate, htmlMediaElementGetPlaybackRate,
        htmlMediaElementGetPlayed, htmlMediaElementGetSeekable,
        htmlMediaElementGetEnded, htmlMediaElementSetAutoplay,
        htmlMediaElementGetAutoplay, htmlMediaElementSetLoop,
        htmlMediaElementGetLoop, htmlMediaElementSetControls,
        htmlMediaElementGetControls, htmlMediaElementSetVolume,
        htmlMediaElementGetVolume, htmlMediaElementSetMuted,
        htmlMediaElementGetMuted, htmlMediaElementSetDefaultMuted,
        htmlMediaElementGetDefaultMuted,
        htmlMediaElementSetWebkitPreservesPitch,
        htmlMediaElementGetWebkitPreservesPitch,
        htmlMediaElementGetWebkitHasClosedCaptions,
        htmlMediaElementSetWebkitClosedCaptionsVisible,
        htmlMediaElementGetWebkitClosedCaptionsVisible,
        htmlMediaElementGetWebkitAudioDecodedByteCount,
        htmlMediaElementGetWebkitVideoDecodedByteCount,
#if WEBKIT_CHECK_VERSION(2,2,2)
        htmlMediaElementOnwebkitneedkey,
#endif
        htmlMediaElementSetMediaGroup, htmlMediaElementGetMediaGroup,
        HTMLMediaElement, HTMLMediaElementClass, castToHTMLMediaElement,
        gTypeHTMLMediaElement, toHTMLMediaElement)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM

#if WEBKIT_CHECK_VERSION(2,0,0)
htmlMediaElementLoad :: (HTMLMediaElementClass self) => self -> IO ()
htmlMediaElementLoad = {# call webkit_dom_html_media_element_load #} . toHTMLMediaElement
#else
htmlMediaElementLoad ::
                     (HTMLMediaElementClass self) => self -> IO ()
htmlMediaElementLoad self
  = propagateGError $
      \ errorPtr_ ->
        {# call webkit_dom_html_media_element_load #}
          (toHTMLMediaElement self)
          errorPtr_
#endif

htmlMediaElementCanPlayType ::
                            (HTMLMediaElementClass self, GlibString string) =>
                              self -> string -> IO string
htmlMediaElementCanPlayType self type'
  = (withUTFString type' $
       \ typePtr ->
         {# call webkit_dom_html_media_element_can_play_type #}
           (toHTMLMediaElement self)
           typePtr)
      >>=
      readUTFString

htmlMediaElementPlay ::
                     (HTMLMediaElementClass self) => self -> IO ()
htmlMediaElementPlay self
  = {# call webkit_dom_html_media_element_play #}
      (toHTMLMediaElement self)

htmlMediaElementPause ::
                      (HTMLMediaElementClass self) => self -> IO ()
htmlMediaElementPause self
  = {# call webkit_dom_html_media_element_pause #}
      (toHTMLMediaElement self)
cNETWORK_EMPTY = 0
cNETWORK_IDLE = 1
cNETWORK_LOADING = 2
cNETWORK_NO_SOURCE = 3
cHAVE_NOTHING = 0
cHAVE_METADATA = 1
cHAVE_CURRENT_DATA = 2
cHAVE_FUTURE_DATA = 3
cHAVE_ENOUGH_DATA = 4

htmlMediaElementGetError ::
                         (HTMLMediaElementClass self) => self -> IO (Maybe MediaError)
htmlMediaElementGetError self
  = maybeNull (makeNewGObject mkMediaError)
      ({# call webkit_dom_html_media_element_get_error #}
         (toHTMLMediaElement self))

htmlMediaElementSetSrc ::
                       (HTMLMediaElementClass self, GlibString string) =>
                         self -> string -> IO ()
htmlMediaElementSetSrc self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_media_element_set_src #}
          (toHTMLMediaElement self)
          valPtr

htmlMediaElementGetSrc ::
                       (HTMLMediaElementClass self, GlibString string) =>
                         self -> IO string
htmlMediaElementGetSrc self
  = ({# call webkit_dom_html_media_element_get_src #}
       (toHTMLMediaElement self))
      >>=
      readUTFString

htmlMediaElementGetCurrentSrc ::
                              (HTMLMediaElementClass self, GlibString string) =>
                                self -> IO string
htmlMediaElementGetCurrentSrc self
  = ({# call webkit_dom_html_media_element_get_current_src #}
       (toHTMLMediaElement self))
      >>=
      readUTFString

htmlMediaElementGetNetworkState ::
                                (HTMLMediaElementClass self) => self -> IO Word
htmlMediaElementGetNetworkState self
  = fromIntegral <$>
      ({# call webkit_dom_html_media_element_get_network_state #}
         (toHTMLMediaElement self))

htmlMediaElementSetPreload ::
                           (HTMLMediaElementClass self, GlibString string) =>
                             self -> string -> IO ()
htmlMediaElementSetPreload self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_media_element_set_preload #}
          (toHTMLMediaElement self)
          valPtr

htmlMediaElementGetPreload ::
                           (HTMLMediaElementClass self, GlibString string) =>
                             self -> IO string
htmlMediaElementGetPreload self
  = ({# call webkit_dom_html_media_element_get_preload #}
       (toHTMLMediaElement self))
      >>=
      readUTFString

htmlMediaElementGetBuffered ::
                            (HTMLMediaElementClass self) => self -> IO (Maybe TimeRanges)
htmlMediaElementGetBuffered self
  = maybeNull (makeNewGObject mkTimeRanges)
      ({# call webkit_dom_html_media_element_get_buffered #}
         (toHTMLMediaElement self))

htmlMediaElementGetReadyState ::
                              (HTMLMediaElementClass self) => self -> IO Word
htmlMediaElementGetReadyState self
  = fromIntegral <$>
      ({# call webkit_dom_html_media_element_get_ready_state #}
         (toHTMLMediaElement self))

htmlMediaElementGetSeeking ::
                           (HTMLMediaElementClass self) => self -> IO Bool
htmlMediaElementGetSeeking self
  = toBool <$>
      ({# call webkit_dom_html_media_element_get_seeking #}
         (toHTMLMediaElement self))

htmlMediaElementSetCurrentTime ::
                               (HTMLMediaElementClass self) => self -> Double -> IO ()
htmlMediaElementSetCurrentTime self val
  = propagateGError $
      \ errorPtr_ ->
        {# call webkit_dom_html_media_element_set_current_time #}
          (toHTMLMediaElement self)
          (realToFrac val)
          errorPtr_

htmlMediaElementGetCurrentTime ::
                               (HTMLMediaElementClass self) => self -> IO Double
htmlMediaElementGetCurrentTime self
  = realToFrac <$>
      ({# call webkit_dom_html_media_element_get_current_time #}
         (toHTMLMediaElement self))

htmlMediaElementGetInitialTime ::
                               (HTMLMediaElementClass self) => self -> IO Double
htmlMediaElementGetInitialTime self
  = realToFrac <$>
      ({# call webkit_dom_html_media_element_get_initial_time #}
         (toHTMLMediaElement self))

htmlMediaElementGetStartTime ::
                             (HTMLMediaElementClass self) => self -> IO Double
htmlMediaElementGetStartTime self
  = realToFrac <$>
      ({# call webkit_dom_html_media_element_get_start_time #}
         (toHTMLMediaElement self))

htmlMediaElementGetDuration ::
                            (HTMLMediaElementClass self) => self -> IO Double
htmlMediaElementGetDuration self
  = realToFrac <$>
      ({# call webkit_dom_html_media_element_get_duration #}
         (toHTMLMediaElement self))

htmlMediaElementGetPaused ::
                          (HTMLMediaElementClass self) => self -> IO Bool
htmlMediaElementGetPaused self
  = toBool <$>
      ({# call webkit_dom_html_media_element_get_paused #}
         (toHTMLMediaElement self))

htmlMediaElementSetDefaultPlaybackRate ::
                                       (HTMLMediaElementClass self) => self -> Double -> IO ()
htmlMediaElementSetDefaultPlaybackRate self val
  = {# call webkit_dom_html_media_element_set_default_playback_rate
      #}
      (toHTMLMediaElement self)
      (realToFrac val)

htmlMediaElementGetDefaultPlaybackRate ::
                                       (HTMLMediaElementClass self) => self -> IO Double
htmlMediaElementGetDefaultPlaybackRate self
  = realToFrac <$>
      ({# call webkit_dom_html_media_element_get_default_playback_rate #}
         (toHTMLMediaElement self))

htmlMediaElementSetPlaybackRate ::
                                (HTMLMediaElementClass self) => self -> Double -> IO ()
htmlMediaElementSetPlaybackRate self val
  = {# call webkit_dom_html_media_element_set_playback_rate #}
      (toHTMLMediaElement self)
      (realToFrac val)

htmlMediaElementGetPlaybackRate ::
                                (HTMLMediaElementClass self) => self -> IO Double
htmlMediaElementGetPlaybackRate self
  = realToFrac <$>
      ({# call webkit_dom_html_media_element_get_playback_rate #}
         (toHTMLMediaElement self))

htmlMediaElementGetPlayed ::
                          (HTMLMediaElementClass self) => self -> IO (Maybe TimeRanges)
htmlMediaElementGetPlayed self
  = maybeNull (makeNewGObject mkTimeRanges)
      ({# call webkit_dom_html_media_element_get_played #}
         (toHTMLMediaElement self))

htmlMediaElementGetSeekable ::
                            (HTMLMediaElementClass self) => self -> IO (Maybe TimeRanges)
htmlMediaElementGetSeekable self
  = maybeNull (makeNewGObject mkTimeRanges)
      ({# call webkit_dom_html_media_element_get_seekable #}
         (toHTMLMediaElement self))

htmlMediaElementGetEnded ::
                         (HTMLMediaElementClass self) => self -> IO Bool
htmlMediaElementGetEnded self
  = toBool <$>
      ({# call webkit_dom_html_media_element_get_ended #}
         (toHTMLMediaElement self))

htmlMediaElementSetAutoplay ::
                            (HTMLMediaElementClass self) => self -> Bool -> IO ()
htmlMediaElementSetAutoplay self val
  = {# call webkit_dom_html_media_element_set_autoplay #}
      (toHTMLMediaElement self)
      (fromBool val)

htmlMediaElementGetAutoplay ::
                            (HTMLMediaElementClass self) => self -> IO Bool
htmlMediaElementGetAutoplay self
  = toBool <$>
      ({# call webkit_dom_html_media_element_get_autoplay #}
         (toHTMLMediaElement self))

htmlMediaElementSetLoop ::
                        (HTMLMediaElementClass self) => self -> Bool -> IO ()
htmlMediaElementSetLoop self val
  = {# call webkit_dom_html_media_element_set_loop #}
      (toHTMLMediaElement self)
      (fromBool val)

htmlMediaElementGetLoop ::
                        (HTMLMediaElementClass self) => self -> IO Bool
htmlMediaElementGetLoop self
  = toBool <$>
      ({# call webkit_dom_html_media_element_get_loop #}
         (toHTMLMediaElement self))

htmlMediaElementSetControls ::
                            (HTMLMediaElementClass self) => self -> Bool -> IO ()
htmlMediaElementSetControls self val
  = {# call webkit_dom_html_media_element_set_controls #}
      (toHTMLMediaElement self)
      (fromBool val)

htmlMediaElementGetControls ::
                            (HTMLMediaElementClass self) => self -> IO Bool
htmlMediaElementGetControls self
  = toBool <$>
      ({# call webkit_dom_html_media_element_get_controls #}
         (toHTMLMediaElement self))

htmlMediaElementSetVolume ::
                          (HTMLMediaElementClass self) => self -> Double -> IO ()
htmlMediaElementSetVolume self val
  = propagateGError $
      \ errorPtr_ ->
        {# call webkit_dom_html_media_element_set_volume #}
          (toHTMLMediaElement self)
          (realToFrac val)
          errorPtr_

htmlMediaElementGetVolume ::
                          (HTMLMediaElementClass self) => self -> IO Double
htmlMediaElementGetVolume self
  = realToFrac <$>
      ({# call webkit_dom_html_media_element_get_volume #}
         (toHTMLMediaElement self))

htmlMediaElementSetMuted ::
                         (HTMLMediaElementClass self) => self -> Bool -> IO ()
htmlMediaElementSetMuted self val
  = {# call webkit_dom_html_media_element_set_muted #}
      (toHTMLMediaElement self)
      (fromBool val)

htmlMediaElementGetMuted ::
                         (HTMLMediaElementClass self) => self -> IO Bool
htmlMediaElementGetMuted self
  = toBool <$>
      ({# call webkit_dom_html_media_element_get_muted #}
         (toHTMLMediaElement self))

htmlMediaElementSetDefaultMuted ::
                                (HTMLMediaElementClass self) => self -> Bool -> IO ()
htmlMediaElementSetDefaultMuted self val
  = {# call webkit_dom_html_media_element_set_default_muted #}
      (toHTMLMediaElement self)
      (fromBool val)

htmlMediaElementGetDefaultMuted ::
                                (HTMLMediaElementClass self) => self -> IO Bool
htmlMediaElementGetDefaultMuted self
  = toBool <$>
      ({# call webkit_dom_html_media_element_get_default_muted #}
         (toHTMLMediaElement self))

htmlMediaElementSetWebkitPreservesPitch ::
                                        (HTMLMediaElementClass self) => self -> Bool -> IO ()
htmlMediaElementSetWebkitPreservesPitch self val
  = {# call webkit_dom_html_media_element_set_webkit_preserves_pitch
      #}
      (toHTMLMediaElement self)
      (fromBool val)

htmlMediaElementGetWebkitPreservesPitch ::
                                        (HTMLMediaElementClass self) => self -> IO Bool
htmlMediaElementGetWebkitPreservesPitch self
  = toBool <$>
      ({# call webkit_dom_html_media_element_get_webkit_preserves_pitch
         #}
         (toHTMLMediaElement self))

htmlMediaElementGetWebkitHasClosedCaptions ::
                                           (HTMLMediaElementClass self) => self -> IO Bool
htmlMediaElementGetWebkitHasClosedCaptions self
  = toBool <$>
      ({# call
         webkit_dom_html_media_element_get_webkit_has_closed_captions
         #}
         (toHTMLMediaElement self))

htmlMediaElementSetWebkitClosedCaptionsVisible ::
                                               (HTMLMediaElementClass self) => self -> Bool -> IO ()
htmlMediaElementSetWebkitClosedCaptionsVisible self val
  = {# call
      webkit_dom_html_media_element_set_webkit_closed_captions_visible
      #}
      (toHTMLMediaElement self)
      (fromBool val)

htmlMediaElementGetWebkitClosedCaptionsVisible ::
                                               (HTMLMediaElementClass self) => self -> IO Bool
htmlMediaElementGetWebkitClosedCaptionsVisible self
  = toBool <$>
      ({# call
         webkit_dom_html_media_element_get_webkit_closed_captions_visible
         #}
         (toHTMLMediaElement self))

htmlMediaElementGetWebkitAudioDecodedByteCount ::
                                               (HTMLMediaElementClass self) => self -> IO Word
htmlMediaElementGetWebkitAudioDecodedByteCount self
  = fromIntegral <$>
      ({# call
         webkit_dom_html_media_element_get_webkit_audio_decoded_byte_count
         #}
         (toHTMLMediaElement self))

htmlMediaElementGetWebkitVideoDecodedByteCount ::
                                               (HTMLMediaElementClass self) => self -> IO Word
htmlMediaElementGetWebkitVideoDecodedByteCount self
  = fromIntegral <$>
      ({# call
         webkit_dom_html_media_element_get_webkit_video_decoded_byte_count
         #}
         (toHTMLMediaElement self))

#if WEBKIT_CHECK_VERSION(2,2,2)
htmlMediaElementOnwebkitneedkey ::
                                (HTMLMediaElementClass self) =>
                                  Signal self (EventM UIEvent self ())
htmlMediaElementOnwebkitneedkey = (connect "webkitneedkey")
#endif

htmlMediaElementSetMediaGroup ::
                              (HTMLMediaElementClass self, GlibString string) =>
                                self -> string -> IO ()
htmlMediaElementSetMediaGroup self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_media_element_set_media_group #}
          (toHTMLMediaElement self)
          valPtr

htmlMediaElementGetMediaGroup ::
                              (HTMLMediaElementClass self, GlibString string) =>
                                self -> IO string
htmlMediaElementGetMediaGroup self
  = ({# call webkit_dom_html_media_element_get_media_group #}
       (toHTMLMediaElement self))
      >>=
      readUTFString
