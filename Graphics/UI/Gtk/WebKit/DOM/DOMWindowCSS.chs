module Graphics.UI.Gtk.WebKit.DOM.DOMWindowCSS(
supports2,
DOMWindowCSS,
castToDOMWindowCSS,
gTypeDOMWindowCSS,
DOMWindowCSSClass,
toDOMWindowCSS,
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

 
supports2 ::
          (MonadIO m, DOMWindowCSSClass self, GlibString string) =>
            self -> string -> string -> m Bool
supports2 self property value
  = liftIO
      (toBool <$>
         (withUTFString value $
            \ valuePtr ->
              withUTFString property $
                \ propertyPtr ->
                  {# call webkit_dom_dom_window_css_supports #} (toDOMWindowCSS self)
                    propertyPtr
                valuePtr))
