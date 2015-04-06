module Graphics.UI.Gtk.WebKit.DOM.HTMLOptGroupElement(
setDisabled,
getDisabled,
setLabel,
getLabel,
HTMLOptGroupElement,
castToHTMLOptGroupElement,
gTypeHTMLOptGroupElement,
HTMLOptGroupElementClass,
toHTMLOptGroupElement,
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

 
setDisabled ::
            (MonadIO m, HTMLOptGroupElementClass self) => self -> Bool -> m ()
setDisabled self val
  = liftIO
      ({# call webkit_dom_html_opt_group_element_set_disabled #}
         (toHTMLOptGroupElement self)
         (fromBool val))
 
getDisabled ::
            (MonadIO m, HTMLOptGroupElementClass self) => self -> m Bool
getDisabled self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_html_opt_group_element_get_disabled #}
            (toHTMLOptGroupElement self)))
 
setLabel ::
         (MonadIO m, HTMLOptGroupElementClass self, GlibString string) =>
           self -> string -> m ()
setLabel self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_opt_group_element_set_label #}
             (toHTMLOptGroupElement self)
             valPtr)
 
getLabel ::
         (MonadIO m, HTMLOptGroupElementClass self, GlibString string) =>
           self -> m string
getLabel self
  = liftIO
      (({# call webkit_dom_html_opt_group_element_get_label #}
          (toHTMLOptGroupElement self))
         >>=
         readUTFString)
