module Graphics.UI.Gtk.WebKit.DOM.TextTrackCue(
getTrack,
setId,
getId,
setStartTime,
getStartTime,
setEndTime,
getEndTime,
setPauseOnExit,
getPauseOnExit,
enter,
exit,
TextTrackCue,
castToTextTrackCue,
gTypeTextTrackCue,
TextTrackCueClass,
toTextTrackCue,
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

 
getTrack ::
         (MonadIO m, TextTrackCueClass self) => self -> m (Maybe TextTrack)
getTrack self
  = liftIO
      (maybeNull (makeNewGObject mkTextTrack)
         ({# call webkit_dom_text_track_cue_get_track #}
            (toTextTrackCue self)))
 
setId ::
      (MonadIO m, TextTrackCueClass self, GlibString string) =>
        self -> string -> m ()
setId self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_text_track_cue_set_id #} (toTextTrackCue self)
             valPtr)
 
getId ::
      (MonadIO m, TextTrackCueClass self, GlibString string) =>
        self -> m string
getId self
  = liftIO
      (({# call webkit_dom_text_track_cue_get_id #}
          (toTextTrackCue self))
         >>=
         readUTFString)
 
setStartTime ::
             (MonadIO m, TextTrackCueClass self) => self -> Double -> m ()
setStartTime self val
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_text_track_cue_set_start_time #}
             (toTextTrackCue self)
             (realToFrac val)
             errorPtr_)
 
getStartTime ::
             (MonadIO m, TextTrackCueClass self) => self -> m Double
getStartTime self
  = liftIO
      (realToFrac <$>
         ({# call webkit_dom_text_track_cue_get_start_time #}
            (toTextTrackCue self)))
 
setEndTime ::
           (MonadIO m, TextTrackCueClass self) => self -> Double -> m ()
setEndTime self val
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_text_track_cue_set_end_time #}
             (toTextTrackCue self)
             (realToFrac val)
             errorPtr_)
 
getEndTime ::
           (MonadIO m, TextTrackCueClass self) => self -> m Double
getEndTime self
  = liftIO
      (realToFrac <$>
         ({# call webkit_dom_text_track_cue_get_end_time #}
            (toTextTrackCue self)))
 
setPauseOnExit ::
               (MonadIO m, TextTrackCueClass self) => self -> Bool -> m ()
setPauseOnExit self val
  = liftIO
      ({# call webkit_dom_text_track_cue_set_pause_on_exit #}
         (toTextTrackCue self)
         (fromBool val))
 
getPauseOnExit ::
               (MonadIO m, TextTrackCueClass self) => self -> m Bool
getPauseOnExit self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_text_track_cue_get_pause_on_exit #}
            (toTextTrackCue self)))
 
enter :: (TextTrackCueClass self) => EventName self Event
enter = EventName "enter"
 
exit :: (TextTrackCueClass self) => EventName self Event
exit = EventName "exit"
