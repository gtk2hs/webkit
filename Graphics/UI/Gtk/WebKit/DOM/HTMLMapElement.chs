module Graphics.UI.Gtk.WebKit.DOM.HTMLMapElement(
getAreas,
setName,
getName,
HTMLMapElement,
castToHTMLMapElement,
gTypeHTMLMapElement,
HTMLMapElementClass,
toHTMLMapElement,
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

 
getAreas ::
         (MonadIO m, HTMLMapElementClass self) =>
           self -> m (Maybe HTMLCollection)
getAreas self
  = liftIO
      (maybeNull (makeNewGObject mkHTMLCollection)
         ({# call webkit_dom_html_map_element_get_areas #}
            (toHTMLMapElement self)))
 
setName ::
        (MonadIO m, HTMLMapElementClass self, GlibString string) =>
          self -> string -> m ()
setName self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_map_element_set_name #}
             (toHTMLMapElement self)
             valPtr)
 
getName ::
        (MonadIO m, HTMLMapElementClass self, GlibString string) =>
          self -> m string
getName self
  = liftIO
      (({# call webkit_dom_html_map_element_get_name #}
          (toHTMLMapElement self))
         >>=
         readUTFString)
