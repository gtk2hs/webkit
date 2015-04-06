module Graphics.UI.Gtk.WebKit.DOM.Attr(
getName,
getSpecified,
setValue,
getValue,
getOwnerElement,
getIsId,
DOMAttr,
castToDOMAttr,
gTypeDOMAttr,
DOMAttrClass,
toDOMAttr,
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

 
getName ::
        (MonadIO m, DOMAttrClass self, GlibString string) =>
          self -> m string
getName self
  = liftIO
      (({# call webkit_dom_attr_get_name #} (toDOMAttr self)) >>=
         readUTFString)
 
getSpecified :: (MonadIO m, DOMAttrClass self) => self -> m Bool
getSpecified self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_attr_get_specified #} (toDOMAttr self)))
 
setValue ::
         (MonadIO m, DOMAttrClass self, GlibString string) =>
           self -> string -> m ()
setValue self val
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           withUTFString val $
             \ valPtr ->
               {# call webkit_dom_attr_set_value #} (toDOMAttr self) valPtr
             errorPtr_)
 
getValue ::
         (MonadIO m, DOMAttrClass self, GlibString string) =>
           self -> m string
getValue self
  = liftIO
      (({# call webkit_dom_attr_get_value #} (toDOMAttr self)) >>=
         readUTFString)
 
getOwnerElement ::
                (MonadIO m, DOMAttrClass self) => self -> m (Maybe Element)
getOwnerElement self
  = liftIO
      (maybeNull (makeNewGObject mkElement)
         ({# call webkit_dom_attr_get_owner_element #} (toDOMAttr self)))
 
getIsId :: (MonadIO m, DOMAttrClass self) => self -> m Bool
getIsId self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_attr_get_is_id #} (toDOMAttr self)))
