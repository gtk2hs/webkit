module Graphics.UI.Gtk.WebKit.DOM.HTMLUListElement(
setCompact,
getCompact,
HTMLUListElement,
castToHTMLUListElement,
gTypeHTMLUListElement,
HTMLUListElementClass,
toHTMLUListElement,
) where
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

 
setCompact ::
           (MonadIO m, HTMLUListElementClass self) => self -> Bool -> m ()
setCompact self val
  = liftIO
      ({# call webkit_dom_htmlu_list_element_set_compact #}
         (toHTMLUListElement self)
         (fromBool val))
 
getCompact ::
           (MonadIO m, HTMLUListElementClass self) => self -> m Bool
getCompact self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_htmlu_list_element_get_compact #}
            (toHTMLUListElement self)))
