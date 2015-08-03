module Graphics.UI.Gtk.WebKit.DOM.HTMLBRElement(
setClear,
getClear,
HTMLBRElement,
castToHTMLBRElement,
gTypeHTMLBRElement,
HTMLBRElementClass,
toHTMLBRElement,
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

 
setClear ::
         (MonadIO m, HTMLBRElementClass self, GlibString string) =>
           self -> string -> m ()
setClear self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_htmlbr_element_set_clear #}
             (toHTMLBRElement self)
             valPtr)
 
getClear ::
         (MonadIO m, HTMLBRElementClass self, GlibString string) =>
           self -> m string
getClear self
  = liftIO
      (({# call webkit_dom_htmlbr_element_get_clear #}
          (toHTMLBRElement self))
         >>=
         readUTFString)
