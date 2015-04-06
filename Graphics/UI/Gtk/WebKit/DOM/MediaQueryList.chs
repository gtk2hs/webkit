module Graphics.UI.Gtk.WebKit.DOM.MediaQueryList(
getMedia,
getMatches,
MediaQueryList,
castToMediaQueryList,
gTypeMediaQueryList,
MediaQueryListClass,
toMediaQueryList,
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

 
getMedia ::
         (MonadIO m, MediaQueryListClass self, GlibString string) =>
           self -> m string
getMedia self
  = liftIO
      (({# call webkit_dom_media_query_list_get_media #}
          (toMediaQueryList self))
         >>=
         readUTFString)
 
getMatches ::
           (MonadIO m, MediaQueryListClass self) => self -> m Bool
getMatches self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_media_query_list_get_matches #}
            (toMediaQueryList self)))
