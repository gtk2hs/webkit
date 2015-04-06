module Graphics.UI.Gtk.WebKit.DOM.HTMLLegendElement(
getForm,
setAlign,
getAlign,
HTMLLegendElement,
castToHTMLLegendElement,
gTypeHTMLLegendElement,
HTMLLegendElementClass,
toHTMLLegendElement,
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
        (MonadIO m, HTMLLegendElementClass self) =>
          self -> m (Maybe HTMLFormElement)
getForm self
  = liftIO
      (maybeNull (makeNewGObject mkHTMLFormElement)
         ({# call webkit_dom_html_legend_element_get_form #}
            (toHTMLLegendElement self)))
 
setAlign ::
         (MonadIO m, HTMLLegendElementClass self, GlibString string) =>
           self -> string -> m ()
setAlign self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_legend_element_set_align #}
             (toHTMLLegendElement self)
             valPtr)
 
getAlign ::
         (MonadIO m, HTMLLegendElementClass self, GlibString string) =>
           self -> m string
getAlign self
  = liftIO
      (({# call webkit_dom_html_legend_element_get_align #}
          (toHTMLLegendElement self))
         >>=
         readUTFString)
