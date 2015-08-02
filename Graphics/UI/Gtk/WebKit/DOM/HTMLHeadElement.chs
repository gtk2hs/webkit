module Graphics.UI.Gtk.WebKit.DOM.HTMLHeadElement(
setProfile,
getProfile,
HTMLHeadElement,
castToHTMLHeadElement,
gTypeHTMLHeadElement,
HTMLHeadElementClass,
toHTMLHeadElement,
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

 
setProfile ::
           (MonadIO m, HTMLHeadElementClass self, GlibString string) =>
             self -> string -> m ()
setProfile self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_head_element_set_profile #}
             (toHTMLHeadElement self)
             valPtr)
 
getProfile ::
           (MonadIO m, HTMLHeadElementClass self, GlibString string) =>
             self -> m string
getProfile self
  = liftIO
      (({# call webkit_dom_html_head_element_get_profile #}
          (toHTMLHeadElement self))
         >>=
         readUTFString)
