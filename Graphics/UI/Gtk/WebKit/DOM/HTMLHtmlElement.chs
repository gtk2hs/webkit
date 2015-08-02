module Graphics.UI.Gtk.WebKit.DOM.HTMLHtmlElement(
setVersion,
getVersion,
setManifest,
getManifest,
HTMLHtmlElement,
castToHTMLHtmlElement,
gTypeHTMLHtmlElement,
HTMLHtmlElementClass,
toHTMLHtmlElement,
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

 
setVersion ::
           (MonadIO m, HTMLHtmlElementClass self, GlibString string) =>
             self -> string -> m ()
setVersion self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_html_element_set_version #}
             (toHTMLHtmlElement self)
             valPtr)
 
getVersion ::
           (MonadIO m, HTMLHtmlElementClass self, GlibString string) =>
             self -> m string
getVersion self
  = liftIO
      (({# call webkit_dom_html_html_element_get_version #}
          (toHTMLHtmlElement self))
         >>=
         readUTFString)
 
setManifest ::
            (MonadIO m, HTMLHtmlElementClass self, GlibString string) =>
              self -> string -> m ()
setManifest self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_html_element_set_manifest #}
             (toHTMLHtmlElement self)
             valPtr)
 
getManifest ::
            (MonadIO m, HTMLHtmlElementClass self, GlibString string) =>
              self -> m string
getManifest self
  = liftIO
      (({# call webkit_dom_html_html_element_get_manifest #}
          (toHTMLHtmlElement self))
         >>=
         readUTFString)
