module Graphics.UI.Gtk.WebKit.DOM.HTMLMediaElement(
load,
#if WEBKIT_CHECK_VERSION(2,7,0)
canPlayType,
#endif
play,
pause,
#if WEBKIT_CHECK_VERSION(2,4,0)
fastSeek,
#endif
#if WEBKIT_CHECK_VERSION(99,0,0)
webkitGenerateKeyRequest,
webkitAddKey,
webkitCancelKeyRequest,
webkitSetMediaKeys,
#endif
#if WEBKIT_CHECK_VERSION(2,4,0)
addTextTrack,
#endif
#if WEBKIT_CHECK_VERSION(99,0,0)
getVideoPlaybackQuality,
#endif
#if WEBKIT_CHECK_VERSION(2,4,0)
webkitShowPlaybackTargetPicker,
#endif
pattern NETWORK_EMPTY,
pattern NETWORK_IDLE,
pattern NETWORK_LOADING,
pattern NETWORK_NO_SOURCE,
pattern HAVE_NOTHING,
pattern HAVE_METADATA,
pattern HAVE_CURRENT_DATA,
pattern HAVE_FUTURE_DATA,
pattern HAVE_ENOUGH_DATA,
getError,
setSrc,
getSrc,
getCurrentSrc,
getNetworkState,
setPreload,
getPreload,
getBuffered,
getReadyState,
getSeeking,
setCurrentTime,
getCurrentTime,
getDuration,
getPaused,
setDefaultPlaybackRate,
getDefaultPlaybackRate,
setPlaybackRate,
getPlaybackRate,
getPlayed,
getSeekable,
getEnded,
setAutoplay,
getAutoplay,
setLoop,
getLoop,
setControls,
getControls,
setVolume,
getVolume,
setMuted,
getMuted,
setDefaultMuted,
getDefaultMuted,
emptied,
loadedMetadata,
loadedData,
canPlay,
canPlayThrough,
playing,
ended,
waiting,
durationChange,
timeUpdate,
playEvent,
pauseEvent,
rateChange,
volumeChange,
setWebkitPreservesPitch,
getWebkitPreservesPitch,
getWebkitHasClosedCaptions,
setWebkitClosedCaptionsVisible,
getWebkitClosedCaptionsVisible,
getWebkitAudioDecodedByteCount,
getWebkitVideoDecodedByteCount,
webKitKeyAdded,
webKitKeyError,
webKitKeyMessage,
webKitNeedKey,
#if WEBKIT_CHECK_VERSION(99,0,0)
getWebkitKeys,
#endif
#if WEBKIT_CHECK_VERSION(2,4,0)
getAudioTracks,
getTextTracks,
getVideoTracks,
#endif
setMediaGroup,
getMediaGroup,
#if WEBKIT_CHECK_VERSION(2,4,0)
getWebkitCurrentPlaybackTargetIsWireless,
#endif
webKitCurrentPlaybackTargetIsWirelessChanged,
webKitPlaybackTargetAvailabilityChanged,
#if WEBKIT_CHECK_VERSION(99,0,0)
setSrcObject,
getSrcObject,
#endif
HTMLMediaElement,
castToHTMLMediaElement,
gTypeHTMLMediaElement,
HTMLMediaElementClass,
toHTMLMediaElement,
) where
import Prelude hiding (drop, error, print)
import Data.Typeable (Typeable)
import Foreign.Marshal (maybePeek, maybeWith)
import System.Glib.FFI (maybeNull, withForeignPtr, nullForeignPtr, Ptr, nullPtr, castPtr, Word, Int64, Word64, CChar(..), CInt(..), CUInt(..), CLong(..), CULong(..), CShort(..), CUShort(..), CFloat(..), CDouble(..), toBool, fromBool)
import System.Glib.UTFString (GlibString(..), readUTFString)
import Control.Applicative ((<$>))
import Control.Monad (void)
import Control.Monad.IO.Class (MonadIO(..))
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventTargetClosures
import Graphics.UI.Gtk.WebKit.DOM.EventM
{#import Graphics.UI.Gtk.WebKit.Types#}
import Graphics.UI.Gtk.WebKit.DOM.Enums

 
load :: (MonadIO m, HTMLMediaElementClass self) => self -> m ()
load self
  = liftIO
      ({# call webkit_dom_html_media_element_load #}
         (toHTMLMediaElement self))

#if WEBKIT_CHECK_VERSION(2,7,0) 
canPlayType ::
            (MonadIO m, HTMLMediaElementClass self, GlibString string) =>
              self -> string -> (Maybe string) -> m string
canPlayType self type' keySystem
  = liftIO
      ((maybeWith withUTFString keySystem $
          \ keySystemPtr ->
            withUTFString type' $
              \ typePtr ->
                {# call webkit_dom_html_media_element_can_play_type #}
                  (toHTMLMediaElement self)
                  typePtr
              keySystemPtr)
         >>=
         readUTFString)
#endif
 
play :: (MonadIO m, HTMLMediaElementClass self) => self -> m ()
play self
  = liftIO
      ({# call webkit_dom_html_media_element_play #}
         (toHTMLMediaElement self))
 
pause :: (MonadIO m, HTMLMediaElementClass self) => self -> m ()
pause self
  = liftIO
      ({# call webkit_dom_html_media_element_pause #}
         (toHTMLMediaElement self))

#if WEBKIT_CHECK_VERSION(2,4,0) 
fastSeek ::
         (MonadIO m, HTMLMediaElementClass self) => self -> Double -> m ()
fastSeek self time
  = liftIO
      ({# call webkit_dom_html_media_element_fast_seek #}
         (toHTMLMediaElement self)
         (realToFrac time))
#endif

#if WEBKIT_CHECK_VERSION(99,0,0) 
webkitGenerateKeyRequest ::
                         (MonadIO m, HTMLMediaElementClass self, Uint8ArrayClass initData,
                          GlibString string) =>
                           self -> (Maybe string) -> Maybe initData -> m ()
webkitGenerateKeyRequest self keySystem initData
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           maybeWith withUTFString keySystem $
             \ keySystemPtr ->
               {# call webkit_dom_html_media_element_webkit_generate_key_request
                 #}
                 (toHTMLMediaElement self)
                 keySystemPtr
             (maybe (Uint8Array nullForeignPtr) toUint8Array initData)
             errorPtr_)
 
webkitAddKey ::
             (MonadIO m, HTMLMediaElementClass self, Uint8ArrayClass key,
              Uint8ArrayClass initData, GlibString string) =>
               self ->
                 (Maybe string) -> Maybe key -> Maybe initData -> string -> m ()
webkitAddKey self keySystem key initData sessionId
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           withUTFString sessionId $
             \ sessionIdPtr ->
               maybeWith withUTFString keySystem $
                 \ keySystemPtr ->
                   {# call webkit_dom_html_media_element_webkit_add_key #}
                     (toHTMLMediaElement self)
                     keySystemPtr
                 (maybe (Uint8Array nullForeignPtr) toUint8Array key)
                 (maybe (Uint8Array nullForeignPtr) toUint8Array initData)
                 sessionIdPtr
             errorPtr_)
 
webkitCancelKeyRequest ::
                       (MonadIO m, HTMLMediaElementClass self, GlibString string) =>
                         self -> (Maybe string) -> string -> m ()
webkitCancelKeyRequest self keySystem sessionId
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           withUTFString sessionId $
             \ sessionIdPtr ->
               maybeWith withUTFString keySystem $
                 \ keySystemPtr ->
                   {# call webkit_dom_html_media_element_webkit_cancel_key_request #}
                     (toHTMLMediaElement self)
                     keySystemPtr
                 sessionIdPtr
             errorPtr_)
 
webkitSetMediaKeys ::
                   (MonadIO m, HTMLMediaElementClass self,
                    MediaKeysClass mediaKeys) =>
                     self -> Maybe mediaKeys -> m ()
webkitSetMediaKeys self mediaKeys
  = liftIO
      ({# call webkit_dom_html_media_element_webkit_set_media_keys #}
         (toHTMLMediaElement self)
         (maybe (MediaKeys nullForeignPtr) toMediaKeys mediaKeys))
#endif

#if WEBKIT_CHECK_VERSION(2,4,0) 
addTextTrack ::
             (MonadIO m, HTMLMediaElementClass self, GlibString string) =>
               self -> string -> string -> string -> m (Maybe TextTrack)
addTextTrack self kind label language
  = liftIO
      (maybeNull (makeNewGObject mkTextTrack)
         (propagateGError $
            \ errorPtr_ ->
              withUTFString language $
                \ languagePtr ->
                  withUTFString label $
                    \ labelPtr ->
                      withUTFString kind $
                        \ kindPtr ->
                          {# call webkit_dom_html_media_element_add_text_track #}
                            (toHTMLMediaElement self)
                            kindPtr
                        labelPtr
                    languagePtr
                errorPtr_))
#endif

#if WEBKIT_CHECK_VERSION(99,0,0) 
getVideoPlaybackQuality ::
                        (MonadIO m, HTMLMediaElementClass self) =>
                          self -> m (Maybe VideoPlaybackQuality)
getVideoPlaybackQuality self
  = liftIO
      (maybeNull (makeNewGObject mkVideoPlaybackQuality)
         ({# call webkit_dom_html_media_element_get_video_playback_quality
            #}
            (toHTMLMediaElement self)))
#endif

#if WEBKIT_CHECK_VERSION(2,4,0) 
webkitShowPlaybackTargetPicker ::
                               (MonadIO m, HTMLMediaElementClass self) => self -> m ()
webkitShowPlaybackTargetPicker self
  = liftIO
      ({# call
         webkit_dom_html_media_element_webkit_show_playback_target_picker
         #}
         (toHTMLMediaElement self))
#endif
pattern NETWORK_EMPTY = 0
pattern NETWORK_IDLE = 1
pattern NETWORK_LOADING = 2
pattern NETWORK_NO_SOURCE = 3
pattern HAVE_NOTHING = 0
pattern HAVE_METADATA = 1
pattern HAVE_CURRENT_DATA = 2
pattern HAVE_FUTURE_DATA = 3
pattern HAVE_ENOUGH_DATA = 4
 
getError ::
         (MonadIO m, HTMLMediaElementClass self) =>
           self -> m (Maybe MediaError)
getError self
  = liftIO
      (maybeNull (makeNewGObject mkMediaError)
         ({# call webkit_dom_html_media_element_get_error #}
            (toHTMLMediaElement self)))
 
setSrc ::
       (MonadIO m, HTMLMediaElementClass self, GlibString string) =>
         self -> string -> m ()
setSrc self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_media_element_set_src #}
             (toHTMLMediaElement self)
             valPtr)
 
getSrc ::
       (MonadIO m, HTMLMediaElementClass self, GlibString string) =>
         self -> m string
getSrc self
  = liftIO
      (({# call webkit_dom_html_media_element_get_src #}
          (toHTMLMediaElement self))
         >>=
         readUTFString)
 
getCurrentSrc ::
              (MonadIO m, HTMLMediaElementClass self, GlibString string) =>
                self -> m string
getCurrentSrc self
  = liftIO
      (({# call webkit_dom_html_media_element_get_current_src #}
          (toHTMLMediaElement self))
         >>=
         readUTFString)
 
getNetworkState ::
                (MonadIO m, HTMLMediaElementClass self) => self -> m Word
getNetworkState self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_html_media_element_get_network_state #}
            (toHTMLMediaElement self)))
 
setPreload ::
           (MonadIO m, HTMLMediaElementClass self, GlibString string) =>
             self -> string -> m ()
setPreload self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_media_element_set_preload #}
             (toHTMLMediaElement self)
             valPtr)
 
getPreload ::
           (MonadIO m, HTMLMediaElementClass self, GlibString string) =>
             self -> m string
getPreload self
  = liftIO
      (({# call webkit_dom_html_media_element_get_preload #}
          (toHTMLMediaElement self))
         >>=
         readUTFString)
 
getBuffered ::
            (MonadIO m, HTMLMediaElementClass self) =>
              self -> m (Maybe TimeRanges)
getBuffered self
  = liftIO
      (maybeNull (makeNewGObject mkTimeRanges)
         ({# call webkit_dom_html_media_element_get_buffered #}
            (toHTMLMediaElement self)))
 
getReadyState ::
              (MonadIO m, HTMLMediaElementClass self) => self -> m Word
getReadyState self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_html_media_element_get_ready_state #}
            (toHTMLMediaElement self)))
 
getSeeking ::
           (MonadIO m, HTMLMediaElementClass self) => self -> m Bool
getSeeking self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_html_media_element_get_seeking #}
            (toHTMLMediaElement self)))
 
setCurrentTime ::
               (MonadIO m, HTMLMediaElementClass self) => self -> Double -> m ()
setCurrentTime self val
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_html_media_element_set_current_time #}
             (toHTMLMediaElement self)
             (realToFrac val)
             errorPtr_)
 
getCurrentTime ::
               (MonadIO m, HTMLMediaElementClass self) => self -> m Double
getCurrentTime self
  = liftIO
      (realToFrac <$>
         ({# call webkit_dom_html_media_element_get_current_time #}
            (toHTMLMediaElement self)))
 
getDuration ::
            (MonadIO m, HTMLMediaElementClass self) => self -> m Double
getDuration self
  = liftIO
      (realToFrac <$>
         ({# call webkit_dom_html_media_element_get_duration #}
            (toHTMLMediaElement self)))
 
getPaused ::
          (MonadIO m, HTMLMediaElementClass self) => self -> m Bool
getPaused self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_html_media_element_get_paused #}
            (toHTMLMediaElement self)))
 
setDefaultPlaybackRate ::
                       (MonadIO m, HTMLMediaElementClass self) => self -> Double -> m ()
setDefaultPlaybackRate self val
  = liftIO
      ({# call webkit_dom_html_media_element_set_default_playback_rate #}
         (toHTMLMediaElement self)
         (realToFrac val))
 
getDefaultPlaybackRate ::
                       (MonadIO m, HTMLMediaElementClass self) => self -> m Double
getDefaultPlaybackRate self
  = liftIO
      (realToFrac <$>
         ({# call webkit_dom_html_media_element_get_default_playback_rate #}
            (toHTMLMediaElement self)))
 
setPlaybackRate ::
                (MonadIO m, HTMLMediaElementClass self) => self -> Double -> m ()
setPlaybackRate self val
  = liftIO
      ({# call webkit_dom_html_media_element_set_playback_rate #}
         (toHTMLMediaElement self)
         (realToFrac val))
 
getPlaybackRate ::
                (MonadIO m, HTMLMediaElementClass self) => self -> m Double
getPlaybackRate self
  = liftIO
      (realToFrac <$>
         ({# call webkit_dom_html_media_element_get_playback_rate #}
            (toHTMLMediaElement self)))
 
getPlayed ::
          (MonadIO m, HTMLMediaElementClass self) =>
            self -> m (Maybe TimeRanges)
getPlayed self
  = liftIO
      (maybeNull (makeNewGObject mkTimeRanges)
         ({# call webkit_dom_html_media_element_get_played #}
            (toHTMLMediaElement self)))
 
getSeekable ::
            (MonadIO m, HTMLMediaElementClass self) =>
              self -> m (Maybe TimeRanges)
getSeekable self
  = liftIO
      (maybeNull (makeNewGObject mkTimeRanges)
         ({# call webkit_dom_html_media_element_get_seekable #}
            (toHTMLMediaElement self)))
 
getEnded ::
         (MonadIO m, HTMLMediaElementClass self) => self -> m Bool
getEnded self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_html_media_element_get_ended #}
            (toHTMLMediaElement self)))
 
setAutoplay ::
            (MonadIO m, HTMLMediaElementClass self) => self -> Bool -> m ()
setAutoplay self val
  = liftIO
      ({# call webkit_dom_html_media_element_set_autoplay #}
         (toHTMLMediaElement self)
         (fromBool val))
 
getAutoplay ::
            (MonadIO m, HTMLMediaElementClass self) => self -> m Bool
getAutoplay self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_html_media_element_get_autoplay #}
            (toHTMLMediaElement self)))
 
setLoop ::
        (MonadIO m, HTMLMediaElementClass self) => self -> Bool -> m ()
setLoop self val
  = liftIO
      ({# call webkit_dom_html_media_element_set_loop #}
         (toHTMLMediaElement self)
         (fromBool val))
 
getLoop ::
        (MonadIO m, HTMLMediaElementClass self) => self -> m Bool
getLoop self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_html_media_element_get_loop #}
            (toHTMLMediaElement self)))
 
setControls ::
            (MonadIO m, HTMLMediaElementClass self) => self -> Bool -> m ()
setControls self val
  = liftIO
      ({# call webkit_dom_html_media_element_set_controls #}
         (toHTMLMediaElement self)
         (fromBool val))
 
getControls ::
            (MonadIO m, HTMLMediaElementClass self) => self -> m Bool
getControls self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_html_media_element_get_controls #}
            (toHTMLMediaElement self)))
 
setVolume ::
          (MonadIO m, HTMLMediaElementClass self) => self -> Double -> m ()
setVolume self val
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_html_media_element_set_volume #}
             (toHTMLMediaElement self)
             (realToFrac val)
             errorPtr_)
 
getVolume ::
          (MonadIO m, HTMLMediaElementClass self) => self -> m Double
getVolume self
  = liftIO
      (realToFrac <$>
         ({# call webkit_dom_html_media_element_get_volume #}
            (toHTMLMediaElement self)))
 
setMuted ::
         (MonadIO m, HTMLMediaElementClass self) => self -> Bool -> m ()
setMuted self val
  = liftIO
      ({# call webkit_dom_html_media_element_set_muted #}
         (toHTMLMediaElement self)
         (fromBool val))
 
getMuted ::
         (MonadIO m, HTMLMediaElementClass self) => self -> m Bool
getMuted self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_html_media_element_get_muted #}
            (toHTMLMediaElement self)))
 
setDefaultMuted ::
                (MonadIO m, HTMLMediaElementClass self) => self -> Bool -> m ()
setDefaultMuted self val
  = liftIO
      ({# call webkit_dom_html_media_element_set_default_muted #}
         (toHTMLMediaElement self)
         (fromBool val))
 
getDefaultMuted ::
                (MonadIO m, HTMLMediaElementClass self) => self -> m Bool
getDefaultMuted self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_html_media_element_get_default_muted #}
            (toHTMLMediaElement self)))
 
emptied :: (HTMLMediaElementClass self) => EventName self Event
emptied = EventName "emptied"
 
loadedMetadata ::
               (HTMLMediaElementClass self) => EventName self Event
loadedMetadata = EventName "loadedmetadata"
 
loadedData :: (HTMLMediaElementClass self) => EventName self Event
loadedData = EventName "loadeddata"
 
canPlay :: (HTMLMediaElementClass self) => EventName self Event
canPlay = EventName "canplay"
 
canPlayThrough ::
               (HTMLMediaElementClass self) => EventName self Event
canPlayThrough = EventName "canplaythrough"
 
playing :: (HTMLMediaElementClass self) => EventName self Event
playing = EventName "playing"
 
ended :: (HTMLMediaElementClass self) => EventName self Event
ended = EventName "ended"
 
waiting :: (HTMLMediaElementClass self) => EventName self Event
waiting = EventName "waiting"
 
durationChange ::
               (HTMLMediaElementClass self) => EventName self Event
durationChange = EventName "durationchange"
 
timeUpdate :: (HTMLMediaElementClass self) => EventName self Event
timeUpdate = EventName "timeupdate"
 
playEvent :: (HTMLMediaElementClass self) => EventName self Event
playEvent = EventName "play"
 
pauseEvent :: (HTMLMediaElementClass self) => EventName self Event
pauseEvent = EventName "pause"
 
rateChange :: (HTMLMediaElementClass self) => EventName self Event
rateChange = EventName "ratechange"
 
volumeChange ::
             (HTMLMediaElementClass self) => EventName self Event
volumeChange = EventName "volumechange"
 
setWebkitPreservesPitch ::
                        (MonadIO m, HTMLMediaElementClass self) => self -> Bool -> m ()
setWebkitPreservesPitch self val
  = liftIO
      ({# call webkit_dom_html_media_element_set_webkit_preserves_pitch
         #}
         (toHTMLMediaElement self)
         (fromBool val))
 
getWebkitPreservesPitch ::
                        (MonadIO m, HTMLMediaElementClass self) => self -> m Bool
getWebkitPreservesPitch self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_html_media_element_get_webkit_preserves_pitch
            #}
            (toHTMLMediaElement self)))
 
getWebkitHasClosedCaptions ::
                           (MonadIO m, HTMLMediaElementClass self) => self -> m Bool
getWebkitHasClosedCaptions self
  = liftIO
      (toBool <$>
         ({# call
            webkit_dom_html_media_element_get_webkit_has_closed_captions
            #}
            (toHTMLMediaElement self)))
 
setWebkitClosedCaptionsVisible ::
                               (MonadIO m, HTMLMediaElementClass self) => self -> Bool -> m ()
setWebkitClosedCaptionsVisible self val
  = liftIO
      ({# call
         webkit_dom_html_media_element_set_webkit_closed_captions_visible
         #}
         (toHTMLMediaElement self)
         (fromBool val))
 
getWebkitClosedCaptionsVisible ::
                               (MonadIO m, HTMLMediaElementClass self) => self -> m Bool
getWebkitClosedCaptionsVisible self
  = liftIO
      (toBool <$>
         ({# call
            webkit_dom_html_media_element_get_webkit_closed_captions_visible
            #}
            (toHTMLMediaElement self)))
 
getWebkitAudioDecodedByteCount ::
                               (MonadIO m, HTMLMediaElementClass self) => self -> m Word
getWebkitAudioDecodedByteCount self
  = liftIO
      (fromIntegral <$>
         ({# call
            webkit_dom_html_media_element_get_webkit_audio_decoded_byte_count
            #}
            (toHTMLMediaElement self)))
 
getWebkitVideoDecodedByteCount ::
                               (MonadIO m, HTMLMediaElementClass self) => self -> m Word
getWebkitVideoDecodedByteCount self
  = liftIO
      (fromIntegral <$>
         ({# call
            webkit_dom_html_media_element_get_webkit_video_decoded_byte_count
            #}
            (toHTMLMediaElement self)))
 
webKitKeyAdded ::
               (HTMLMediaElementClass self) => EventName self Event
webKitKeyAdded = EventName "webkitkeyadded"
 
webKitKeyError ::
               (HTMLMediaElementClass self) => EventName self Event
webKitKeyError = EventName "webkitkeyerror"
 
webKitKeyMessage ::
                 (HTMLMediaElementClass self) => EventName self Event
webKitKeyMessage = EventName "webkitkeymessage"
 
webKitNeedKey ::
              (HTMLMediaElementClass self) => EventName self Event
webKitNeedKey = EventName "webkitneedkey"

#if WEBKIT_CHECK_VERSION(99,0,0) 
getWebkitKeys ::
              (MonadIO m, HTMLMediaElementClass self) =>
                self -> m (Maybe MediaKeys)
getWebkitKeys self
  = liftIO
      (maybeNull (makeNewGObject mkMediaKeys)
         ({# call webkit_dom_html_media_element_get_webkit_keys #}
            (toHTMLMediaElement self)))
#endif

#if WEBKIT_CHECK_VERSION(2,4,0) 
getAudioTracks ::
               (MonadIO m, HTMLMediaElementClass self) =>
                 self -> m (Maybe AudioTrackList)
getAudioTracks self
  = liftIO
      (maybeNull (makeNewGObject mkAudioTrackList)
         ({# call webkit_dom_html_media_element_get_audio_tracks #}
            (toHTMLMediaElement self)))
 
getTextTracks ::
              (MonadIO m, HTMLMediaElementClass self) =>
                self -> m (Maybe TextTrackList)
getTextTracks self
  = liftIO
      (maybeNull (makeNewGObject mkTextTrackList)
         ({# call webkit_dom_html_media_element_get_text_tracks #}
            (toHTMLMediaElement self)))
 
getVideoTracks ::
               (MonadIO m, HTMLMediaElementClass self) =>
                 self -> m (Maybe VideoTrackList)
getVideoTracks self
  = liftIO
      (maybeNull (makeNewGObject mkVideoTrackList)
         ({# call webkit_dom_html_media_element_get_video_tracks #}
            (toHTMLMediaElement self)))
#endif
 
setMediaGroup ::
              (MonadIO m, HTMLMediaElementClass self, GlibString string) =>
                self -> (Maybe string) -> m ()
setMediaGroup self val
  = liftIO
      (maybeWith withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_media_element_set_media_group #}
             (toHTMLMediaElement self)
             valPtr)
 
getMediaGroup ::
              (MonadIO m, HTMLMediaElementClass self, GlibString string) =>
                self -> m (Maybe string)
getMediaGroup self
  = liftIO
      (({# call webkit_dom_html_media_element_get_media_group #}
          (toHTMLMediaElement self))
         >>=
         maybePeek readUTFString)

#if WEBKIT_CHECK_VERSION(2,4,0) 
getWebkitCurrentPlaybackTargetIsWireless ::
                                         (MonadIO m, HTMLMediaElementClass self) => self -> m Bool
getWebkitCurrentPlaybackTargetIsWireless self
  = liftIO
      (toBool <$>
         ({# call
            webkit_dom_html_media_element_get_webkit_current_playback_target_is_wireless
            #}
            (toHTMLMediaElement self)))
#endif
 
webKitCurrentPlaybackTargetIsWirelessChanged ::
                                             (HTMLMediaElementClass self) => EventName self Event
webKitCurrentPlaybackTargetIsWirelessChanged
  = EventName "webkitcurrentplaybacktargetiswirelesschanged"
 
webKitPlaybackTargetAvailabilityChanged ::
                                        (HTMLMediaElementClass self) => EventName self Event
webKitPlaybackTargetAvailabilityChanged
  = EventName "webkitplaybacktargetavailabilitychanged"

#if WEBKIT_CHECK_VERSION(99,0,0) 
setSrcObject ::
             (MonadIO m, MediaStreamClass val, HTMLMediaElementClass self) =>
               self -> Maybe val -> m ()
setSrcObject self val
  = liftIO
      ({# call webkit_dom_html_media_element_set_src_object #}
         (toHTMLMediaElement self)
         (maybe (MediaStream nullForeignPtr) toMediaStream val))
 
getSrcObject ::
             (MonadIO m, HTMLMediaElementClass self) =>
               self -> m (Maybe MediaStream)
getSrcObject self
  = liftIO
      ({# call webkit_dom_html_media_element_get_src_object #}
         (toHTMLMediaElement self))
#endif
