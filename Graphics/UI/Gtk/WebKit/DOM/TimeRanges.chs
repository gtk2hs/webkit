module Graphics.UI.Gtk.WebKit.DOM.TimeRanges(
start,
end,
getLength,
TimeRanges,
castToTimeRanges,
gTypeTimeRanges,
TimeRangesClass,
toTimeRanges,
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

 
start ::
      (MonadIO m, TimeRangesClass self) => self -> Word -> m Double
start self index
  = liftIO
      (realToFrac <$>
         (propagateGError $
            \ errorPtr_ ->
              {# call webkit_dom_time_ranges_start #} (toTimeRanges self)
                (fromIntegral index)
                errorPtr_))
 
end ::
    (MonadIO m, TimeRangesClass self) => self -> Word -> m Double
end self index
  = liftIO
      (realToFrac <$>
         (propagateGError $
            \ errorPtr_ ->
              {# call webkit_dom_time_ranges_end #} (toTimeRanges self)
                (fromIntegral index)
                errorPtr_))
 
getLength :: (MonadIO m, TimeRangesClass self) => self -> m Word
getLength self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_time_ranges_get_length #} (toTimeRanges self)))
