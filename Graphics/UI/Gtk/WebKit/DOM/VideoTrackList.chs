module Graphics.UI.Gtk.WebKit.DOM.VideoTrackList(
#if WEBKIT_CHECK_VERSION(2,2,2)
item,
getTrackById,
getLength,
#if WEBKIT_CHECK_VERSION(99,0,0)
getSelectedIndex,
#endif
change,
addTrack,
removeTrack,
VideoTrackList,
castToVideoTrackList,
gTypeVideoTrackList,
VideoTrackListClass,
toVideoTrackList,
#endif
) where
#if WEBKIT_CHECK_VERSION(2,2,2)
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

 
item ::
     (MonadIO m, VideoTrackListClass self) =>
       self -> Word -> m (Maybe VideoTrack)
item self index
  = liftIO
      (maybeNull (makeNewGObject mkVideoTrack)
         ({# call webkit_dom_video_track_list_item #}
            (toVideoTrackList self)
            (fromIntegral index)))
 
getTrackById ::
             (MonadIO m, VideoTrackListClass self, GlibString string) =>
               self -> string -> m (Maybe VideoTrack)
getTrackById self id
  = liftIO
      (maybeNull (makeNewGObject mkVideoTrack)
         (withUTFString id $
            \ idPtr ->
              {# call webkit_dom_video_track_list_get_track_by_id #}
                (toVideoTrackList self)
                idPtr))
 
getLength ::
          (MonadIO m, VideoTrackListClass self) => self -> m Word
getLength self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_video_track_list_get_length #}
            (toVideoTrackList self)))

#if WEBKIT_CHECK_VERSION(99,0,0) 
getSelectedIndex ::
                 (MonadIO m, VideoTrackListClass self) => self -> m Int
getSelectedIndex self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_video_track_list_get_selected_index #}
            (toVideoTrackList self)))
#endif
 
change :: (VideoTrackListClass self) => EventName self Event
change = EventName "change"
 
addTrack :: (VideoTrackListClass self) => EventName self Event
addTrack = EventName "addtrack"
 
removeTrack :: (VideoTrackListClass self) => EventName self Event
removeTrack = EventName "removetrack"
#endif
