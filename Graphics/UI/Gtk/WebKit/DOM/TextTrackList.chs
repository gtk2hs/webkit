module Graphics.UI.Gtk.WebKit.DOM.TextTrackList(
item,
getTrackById,
getLength,
addTrack,
change,
removeTrack,
TextTrackList,
castToTextTrackList,
gTypeTextTrackList,
TextTrackListClass,
toTextTrackList,
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

 
item ::
     (MonadIO m, TextTrackListClass self) =>
       self -> Word -> m (Maybe TextTrack)
item self index
  = liftIO
      (maybeNull (makeNewGObject mkTextTrack)
         ({# call webkit_dom_text_track_list_item #} (toTextTrackList self)
            (fromIntegral index)))
 
getTrackById ::
             (MonadIO m, TextTrackListClass self, GlibString string) =>
               self -> string -> m (Maybe TextTrack)
getTrackById self id
  = liftIO
      (maybeNull (makeNewGObject mkTextTrack)
         (withUTFString id $
            \ idPtr ->
              {# call webkit_dom_text_track_list_get_track_by_id #}
                (toTextTrackList self)
                idPtr))
 
getLength :: (MonadIO m, TextTrackListClass self) => self -> m Word
getLength self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_text_track_list_get_length #}
            (toTextTrackList self)))
 
addTrack :: (TextTrackListClass self) => EventName self Event
addTrack = EventName "addtrack"
 
change :: (TextTrackListClass self) => EventName self Event
change = EventName "change"
 
removeTrack :: (TextTrackListClass self) => EventName self Event
removeTrack = EventName "removetrack"
