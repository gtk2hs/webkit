module Graphics.UI.Gtk.WebKit.DOM.TextTrack(
#if WEBKIT_CHECK_VERSION(2,7,0)
addCue,
#endif
removeCue,
getId,
getLabel,
#if WEBKIT_CHECK_VERSION(99,0,0)
getInBandMetadataTrackDispatchType,
#endif
setMode,
getMode,
getCues,
getActiveCues,
cueChange,
TextTrack,
castToTextTrack,
gTypeTextTrack,
TextTrackClass,
toTextTrack,
) where
import Prelude hiding (drop, error, print)
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


#if WEBKIT_CHECK_VERSION(2,7,0) 
addCue ::
       (MonadIO m, TextTrackClass self, TextTrackCueClass cue) =>
         self -> Maybe cue -> m ()
addCue self cue
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_webkit_dom_text_track_add_cue_with_error #}
             (toTextTrack self)
             (maybe (TextTrackCue nullForeignPtr) toTextTrackCue cue)
             errorPtr_)
#endif
 
removeCue ::
          (MonadIO m, TextTrackClass self, TextTrackCueClass cue) =>
            self -> Maybe cue -> m ()
removeCue self cue
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_text_track_remove_cue #} (toTextTrack self)
             (maybe (TextTrackCue nullForeignPtr) toTextTrackCue cue)
             errorPtr_)
 
getId ::
      (MonadIO m, TextTrackClass self, GlibString string) =>
        self -> m string
getId self
  = liftIO
      (({# call webkit_dom_text_track_get_id #} (toTextTrack self)) >>=
         readUTFString)
 
getLabel ::
         (MonadIO m, TextTrackClass self, GlibString string) =>
           self -> m string
getLabel self
  = liftIO
      (({# call webkit_dom_text_track_get_label #} (toTextTrack self))
         >>=
         readUTFString)

#if WEBKIT_CHECK_VERSION(99,0,0) 
getInBandMetadataTrackDispatchType ::
                                   (MonadIO m, TextTrackClass self, GlibString string) =>
                                     self -> m string
getInBandMetadataTrackDispatchType self
  = liftIO
      (({# call
          webkit_dom_text_track_get_in_band_metadata_track_dispatch_type
          #}
          (toTextTrack self))
         >>=
         readUTFString)
#endif
 
setMode ::
        (MonadIO m, TextTrackClass self) => self -> TextTrackMode -> m ()
setMode self val
  = liftIO
      (withUTFString (enumToString val) $
         \ valPtr ->
           {# call webkit_dom_text_track_set_mode #} (toTextTrack self)
             valPtr)
 
getMode ::
        (MonadIO m, TextTrackClass self) => self -> m TextTrackMode
getMode self
  = liftIO
      (stringToEnum <$>
         (({# call webkit_dom_text_track_get_mode #} (toTextTrack self)) >>=
            readUTFString))
 
getCues ::
        (MonadIO m, TextTrackClass self) =>
          self -> m (Maybe TextTrackCueList)
getCues self
  = liftIO
      (maybeNull (makeNewGObject mkTextTrackCueList)
         ({# call webkit_dom_text_track_get_cues #} (toTextTrack self)))
 
getActiveCues ::
              (MonadIO m, TextTrackClass self) =>
                self -> m (Maybe TextTrackCueList)
getActiveCues self
  = liftIO
      (maybeNull (makeNewGObject mkTextTrackCueList)
         ({# call webkit_dom_text_track_get_active_cues #}
            (toTextTrack self)))
 
cueChange :: (TextTrackClass self) => EventName self Event
cueChange = EventName "cuechange"
