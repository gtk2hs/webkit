module Graphics.UI.Gtk.WebKit.DOM.StyleMedia(
matchMedium,
StyleMedia,
castToStyleMedia,
gTypeStyleMedia,
StyleMediaClass,
toStyleMedia,
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

 
matchMedium ::
            (MonadIO m, StyleMediaClass self, GlibString string) =>
              self -> string -> m Bool
matchMedium self mediaquery
  = liftIO
      (toBool <$>
         (withUTFString mediaquery $
            \ mediaqueryPtr ->
              {# call webkit_dom_style_media_match_medium #} (toStyleMedia self)
                mediaqueryPtr))
