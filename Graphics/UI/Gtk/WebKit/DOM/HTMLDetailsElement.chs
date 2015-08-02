module Graphics.UI.Gtk.WebKit.DOM.HTMLDetailsElement(
setOpen,
getOpen,
HTMLDetailsElement,
castToHTMLDetailsElement,
gTypeHTMLDetailsElement,
HTMLDetailsElementClass,
toHTMLDetailsElement,
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

 
setOpen ::
        (MonadIO m, HTMLDetailsElementClass self) => self -> Bool -> m ()
setOpen self val
  = liftIO
      ({# call webkit_dom_html_details_element_set_open #}
         (toHTMLDetailsElement self)
         (fromBool val))
 
getOpen ::
        (MonadIO m, HTMLDetailsElementClass self) => self -> m Bool
getOpen self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_html_details_element_get_open #}
            (toHTMLDetailsElement self)))
