module Graphics.UI.Gtk.WebKit.DOM.HTMLStyleElement(
setDisabled,
getDisabled,
setMedia,
getMedia,
getSheet,
HTMLStyleElement,
castToHTMLStyleElement,
gTypeHTMLStyleElement,
HTMLStyleElementClass,
toHTMLStyleElement,
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

 
setDisabled ::
            (MonadIO m, HTMLStyleElementClass self) => self -> Bool -> m ()
setDisabled self val
  = liftIO
      ({# call webkit_dom_html_style_element_set_disabled #}
         (toHTMLStyleElement self)
         (fromBool val))
 
getDisabled ::
            (MonadIO m, HTMLStyleElementClass self) => self -> m Bool
getDisabled self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_html_style_element_get_disabled #}
            (toHTMLStyleElement self)))
 
setMedia ::
         (MonadIO m, HTMLStyleElementClass self, GlibString string) =>
           self -> string -> m ()
setMedia self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_style_element_set_media #}
             (toHTMLStyleElement self)
             valPtr)
 
getMedia ::
         (MonadIO m, HTMLStyleElementClass self, GlibString string) =>
           self -> m string
getMedia self
  = liftIO
      (({# call webkit_dom_html_style_element_get_media #}
          (toHTMLStyleElement self))
         >>=
         readUTFString)
 
getSheet ::
         (MonadIO m, HTMLStyleElementClass self) =>
           self -> m (Maybe StyleSheet)
getSheet self
  = liftIO
      (maybeNull (makeNewGObject mkStyleSheet)
         ({# call webkit_dom_html_style_element_get_sheet #}
            (toHTMLStyleElement self)))
