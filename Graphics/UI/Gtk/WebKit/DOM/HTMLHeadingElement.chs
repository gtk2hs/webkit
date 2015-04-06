module Graphics.UI.Gtk.WebKit.DOM.HTMLHeadingElement(
setAlign,
getAlign,
HTMLHeadingElement,
castToHTMLHeadingElement,
gTypeHTMLHeadingElement,
HTMLHeadingElementClass,
toHTMLHeadingElement,
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

 
setAlign ::
         (MonadIO m, HTMLHeadingElementClass self, GlibString string) =>
           self -> string -> m ()
setAlign self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_heading_element_set_align #}
             (toHTMLHeadingElement self)
             valPtr)
 
getAlign ::
         (MonadIO m, HTMLHeadingElementClass self, GlibString string) =>
           self -> m string
getAlign self
  = liftIO
      (({# call webkit_dom_html_heading_element_get_align #}
          (toHTMLHeadingElement self))
         >>=
         readUTFString)
