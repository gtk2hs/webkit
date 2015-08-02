module Graphics.UI.Gtk.WebKit.DOM.TextTrackCueList(
#if WEBKIT_CHECK_VERSION(2,2,2)
item,
getCueById,
getLength,
TextTrackCueList,
castToTextTrackCueList,
gTypeTextTrackCueList,
TextTrackCueListClass,
toTextTrackCueList,
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
     (MonadIO m, TextTrackCueListClass self) =>
       self -> Word -> m (Maybe TextTrackCue)
item self index
  = liftIO
      (maybeNull (makeNewGObject mkTextTrackCue)
         ({# call webkit_dom_text_track_cue_list_item #}
            (toTextTrackCueList self)
            (fromIntegral index)))
 
getCueById ::
           (MonadIO m, TextTrackCueListClass self, GlibString string) =>
             self -> string -> m (Maybe TextTrackCue)
getCueById self id
  = liftIO
      (maybeNull (makeNewGObject mkTextTrackCue)
         (withUTFString id $
            \ idPtr ->
              {# call webkit_dom_text_track_cue_list_get_cue_by_id #}
                (toTextTrackCueList self)
                idPtr))
 
getLength ::
          (MonadIO m, TextTrackCueListClass self) => self -> m Word
getLength self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_text_track_cue_list_get_length #}
            (toTextTrackCueList self)))
#endif
