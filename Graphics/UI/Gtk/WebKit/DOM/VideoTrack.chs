module Graphics.UI.Gtk.WebKit.DOM.VideoTrack(
getId,
getLabel,
setSelected,
getSelected,
VideoTrack,
castToVideoTrack,
gTypeVideoTrack,
VideoTrackClass,
toVideoTrack,
) where
import Prelude hiding (drop, error, print)
import System.Glib.FFI (maybeNull, withForeignPtr, nullForeignPtr, Ptr, nullPtr, castPtr, Word, Int64, Word64, CChar(..), CInt(..), CUInt(..), CLong(..), CULong(..), CShort(..), CUShort(..), CFloat(..), CDouble(..), toBool, fromBool)
import System.Glib.UTFString (GlibString(..), readUTFString)
import Control.Applicative ((<$>))
import Control.Monad (void)
import Control.Monad.IO.Class (MonadIO(..))
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventTargetClosures
import Graphics.UI.Gtk.WebKit.DOM.EventM
import Graphics.UI.Gtk.WebKit.DOM.Enums

 
getId ::
      (MonadIO m, VideoTrackClass self, GlibString string) =>
        self -> m string
getId self
  = liftIO
      (({# call webkit_dom_video_track_get_id #} (toVideoTrack self)) >>=
         readUTFString)
 
getLabel ::
         (MonadIO m, VideoTrackClass self, GlibString string) =>
           self -> m string
getLabel self
  = liftIO
      (({# call webkit_dom_video_track_get_label #} (toVideoTrack self))
         >>=
         readUTFString)
 
setSelected ::
            (MonadIO m, VideoTrackClass self) => self -> Bool -> m ()
setSelected self val
  = liftIO
      ({# call webkit_dom_video_track_set_selected #} (toVideoTrack self)
         (fromBool val))
 
getSelected :: (MonadIO m, VideoTrackClass self) => self -> m Bool
getSelected self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_video_track_get_selected #}
            (toVideoTrack self)))
