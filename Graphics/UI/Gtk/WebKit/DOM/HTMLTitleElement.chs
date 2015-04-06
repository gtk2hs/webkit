module Graphics.UI.Gtk.WebKit.DOM.HTMLTitleElement(
setText,
getText,
HTMLTitleElement,
castToHTMLTitleElement,
gTypeHTMLTitleElement,
HTMLTitleElementClass,
toHTMLTitleElement,
) where
import Prelude hiding (drop, error, print)
import System.Glib.FFI (maybeNull, withForeignPtr, nullForeignPtr, Ptr, nullPtr, castPtr, Word, Int64, Word64, CChar(..), CInt(..), CUInt(..), CLong(..), CULong(..), CShort(..), CUShort(..), CFloat(..), CDouble(..), toBool, fromBool)
import System.Glib.UTFString (GlibString(..), readUTFString)
import Control.Applicative ((<$>))
import Control.Monad (void)
import Control.Monad.IO.Class (MonadIO(..))
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventTargetClosures
import Graphics.UI.Gtk.WebKit.DOM.EventM
import Graphics.UI.Gtk.WebKit.DOM.Enums

 
setText ::
        (MonadIO m, HTMLTitleElementClass self, GlibString string) =>
          self -> string -> m ()
setText self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_title_element_set_text #}
             (toHTMLTitleElement self)
             valPtr)
 
getText ::
        (MonadIO m, HTMLTitleElementClass self, GlibString string) =>
          self -> m string
getText self
  = liftIO
      (({# call webkit_dom_html_title_element_get_text #}
          (toHTMLTitleElement self))
         >>=
         readUTFString)
