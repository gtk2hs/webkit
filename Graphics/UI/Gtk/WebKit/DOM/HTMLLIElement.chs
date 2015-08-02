module Graphics.UI.Gtk.WebKit.DOM.HTMLLIElement(
setValue,
getValue,
HTMLLIElement,
castToHTMLLIElement,
gTypeHTMLLIElement,
HTMLLIElementClass,
toHTMLLIElement,
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

 
setValue ::
         (MonadIO m, HTMLLIElementClass self) => self -> Int -> m ()
setValue self val
  = liftIO
      ({# call webkit_dom_htmlli_element_set_value #}
         (toHTMLLIElement self)
         (fromIntegral val))
 
getValue :: (MonadIO m, HTMLLIElementClass self) => self -> m Int
getValue self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_htmlli_element_get_value #}
            (toHTMLLIElement self)))
