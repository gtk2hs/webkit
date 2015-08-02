module Graphics.UI.Gtk.WebKit.DOM.AudioTrack(
getId,
getLabel,
setEnabled,
getEnabled,
AudioTrack,
castToAudioTrack,
gTypeAudioTrack,
AudioTrackClass,
toAudioTrack,
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

 
getId ::
      (MonadIO m, AudioTrackClass self, GlibString string) =>
        self -> m string
getId self
  = liftIO
      (({# call webkit_dom_audio_track_get_id #} (toAudioTrack self)) >>=
         readUTFString)
 
getLabel ::
         (MonadIO m, AudioTrackClass self, GlibString string) =>
           self -> m string
getLabel self
  = liftIO
      (({# call webkit_dom_audio_track_get_label #} (toAudioTrack self))
         >>=
         readUTFString)
 
setEnabled ::
           (MonadIO m, AudioTrackClass self) => self -> Bool -> m ()
setEnabled self val
  = liftIO
      ({# call webkit_dom_audio_track_set_enabled #} (toAudioTrack self)
         (fromBool val))
 
getEnabled :: (MonadIO m, AudioTrackClass self) => self -> m Bool
getEnabled self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_audio_track_get_enabled #}
            (toAudioTrack self)))
