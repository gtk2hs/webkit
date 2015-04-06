module Graphics.UI.Gtk.WebKit.DOM.HTMLLabelElement(
getForm,
setHtmlFor,
getHtmlFor,
getControl,
HTMLLabelElement,
castToHTMLLabelElement,
gTypeHTMLLabelElement,
HTMLLabelElementClass,
toHTMLLabelElement,
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

 
getForm ::
        (MonadIO m, HTMLLabelElementClass self) =>
          self -> m (Maybe HTMLFormElement)
getForm self
  = liftIO
      (maybeNull (makeNewGObject mkHTMLFormElement)
         ({# call webkit_dom_html_label_element_get_form #}
            (toHTMLLabelElement self)))
 
setHtmlFor ::
           (MonadIO m, HTMLLabelElementClass self, GlibString string) =>
             self -> string -> m ()
setHtmlFor self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_label_element_set_html_for #}
             (toHTMLLabelElement self)
             valPtr)
 
getHtmlFor ::
           (MonadIO m, HTMLLabelElementClass self, GlibString string) =>
             self -> m string
getHtmlFor self
  = liftIO
      (({# call webkit_dom_html_label_element_get_html_for #}
          (toHTMLLabelElement self))
         >>=
         readUTFString)
 
getControl ::
           (MonadIO m, HTMLLabelElementClass self) =>
             self -> m (Maybe HTMLElement)
getControl self
  = liftIO
      (maybeNull (makeNewGObject mkHTMLElement)
         ({# call webkit_dom_html_label_element_get_control #}
            (toHTMLLabelElement self)))
