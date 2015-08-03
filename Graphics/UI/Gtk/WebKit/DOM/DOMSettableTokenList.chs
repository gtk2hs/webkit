module Graphics.UI.Gtk.WebKit.DOM.DOMSettableTokenList(
setValue,
getValue,
DOMSettableTokenList,
castToDOMSettableTokenList,
gTypeDOMSettableTokenList,
DOMSettableTokenListClass,
toDOMSettableTokenList,
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

 
setValue ::
         (MonadIO m, DOMSettableTokenListClass self, GlibString string) =>
           self -> string -> m ()
setValue self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_dom_settable_token_list_set_value #}
             (toDOMSettableTokenList self)
             valPtr)
 
getValue ::
         (MonadIO m, DOMSettableTokenListClass self, GlibString string) =>
           self -> m string
getValue self
  = liftIO
      (({# call webkit_dom_dom_settable_token_list_get_value #}
          (toDOMSettableTokenList self))
         >>=
         readUTFString)
