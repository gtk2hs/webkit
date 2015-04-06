module Graphics.UI.Gtk.WebKit.DOM.HTMLQuoteElement(
setCite,
getCite,
HTMLQuoteElement,
castToHTMLQuoteElement,
gTypeHTMLQuoteElement,
HTMLQuoteElementClass,
toHTMLQuoteElement,
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

 
setCite ::
        (MonadIO m, HTMLQuoteElementClass self, GlibString string) =>
          self -> string -> m ()
setCite self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_quote_element_set_cite #}
             (toHTMLQuoteElement self)
             valPtr)
 
getCite ::
        (MonadIO m, HTMLQuoteElementClass self, GlibString string) =>
          self -> m string
getCite self
  = liftIO
      (({# call webkit_dom_html_quote_element_get_cite #}
          (toHTMLQuoteElement self))
         >>=
         readUTFString)
