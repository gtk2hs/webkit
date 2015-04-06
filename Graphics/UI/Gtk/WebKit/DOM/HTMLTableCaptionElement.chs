module Graphics.UI.Gtk.WebKit.DOM.HTMLTableCaptionElement(
setAlign,
getAlign,
HTMLTableCaptionElement,
castToHTMLTableCaptionElement,
gTypeHTMLTableCaptionElement,
HTMLTableCaptionElementClass,
toHTMLTableCaptionElement,
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
         (MonadIO m, HTMLTableCaptionElementClass self,
          GlibString string) =>
           self -> string -> m ()
setAlign self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_table_caption_element_set_align #}
             (toHTMLTableCaptionElement self)
             valPtr)
 
getAlign ::
         (MonadIO m, HTMLTableCaptionElementClass self,
          GlibString string) =>
           self -> m string
getAlign self
  = liftIO
      (({# call webkit_dom_html_table_caption_element_get_align #}
          (toHTMLTableCaptionElement self))
         >>=
         readUTFString)
