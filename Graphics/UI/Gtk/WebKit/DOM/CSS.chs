module Graphics.UI.Gtk.WebKit.DOM.CSS(
#if WEBKIT_CHECK_VERSION(2,2,2)
supports2,
CSS,
castToCSS,
gTypeCSS,
CSSClass,
toCSS,
#endif
) where
#if WEBKIT_CHECK_VERSION(2,2,2)
import Prelude hiding (drop, error, print)
import Data.Typeable (Typeable)
import Foreign.Marshal (maybePeek, maybeWith)
import System.Glib.FFI (maybeNull, withForeignPtr, nullForeignPtr, Ptr, nullPtr, castPtr, Word, Int64, Word64, CChar(..), CInt(..), CUInt(..), CLong(..), CULong(..), CLLong(..), CULLong(..), CShort(..), CUShort(..), CFloat(..), CDouble(..), toBool, fromBool)
import System.Glib.UTFString (GlibString(..), readUTFString)
import Control.Applicative ((<$>))
import Control.Monad (void)
import Control.Monad.IO.Class (MonadIO(..))
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventTargetClosures
import Graphics.UI.Gtk.WebKit.DOM.EventM
{#import Graphics.UI.Gtk.WebKit.Types#}
import Graphics.UI.Gtk.WebKit.DOM.Enums

 
supports2 ::
          (MonadIO m, CSSClass self, GlibString string) =>
            self -> string -> string -> m Bool
supports2 self property value
  = liftIO
      (toBool <$>
         (withUTFString value $
            \ valuePtr ->
              withUTFString property $
                \ propertyPtr ->
                  {# call webkit_dom_dom_window_css_supports #} (toCSS self)
                    propertyPtr
                valuePtr))
#endif
