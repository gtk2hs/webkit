module Graphics.UI.Gtk.WebKit.DOM.Attr(
getName,
getSpecified,
setValue,
getValue,
getOwnerElement,
getIsId,
Attr,
castToAttr,
gTypeAttr,
AttrClass,
toAttr,
) where
import Prelude hiding (drop, error, print)
import Data.Typeable (Typeable)
import Foreign.Marshal (maybePeek, maybeWith)
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
        (MonadIO m, AttrClass self, GlibString string) =>
          self -> m (Maybe string)
getName self
  = liftIO
      (({# call webkit_dom_attr_get_name #} (toAttr self)) >>=
         maybePeek readUTFString)
 
getSpecified :: (MonadIO m, AttrClass self) => self -> m Bool
getSpecified self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_attr_get_specified #} (toAttr self)))
 
setValue ::
         (MonadIO m, AttrClass self, GlibString string) =>
           self -> (Maybe string) -> m ()
setValue self val
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           maybeWith withUTFString val $
             \ valPtr ->
               {# call webkit_dom_attr_set_value #} (toAttr self) valPtr
             errorPtr_)
 
getValue ::
         (MonadIO m, AttrClass self, GlibString string) =>
           self -> m (Maybe string)
getValue self
  = liftIO
      (({# call webkit_dom_attr_get_value #} (toAttr self)) >>=
         maybePeek readUTFString)
 
getOwnerElement ::
                (MonadIO m, AttrClass self) => self -> m (Maybe Element)
getOwnerElement self
  = liftIO
      (maybeNull (makeNewGObject mkElement)
         ({# call webkit_dom_attr_get_owner_element #} (toAttr self)))
 
getIsId :: (MonadIO m, AttrClass self) => self -> m Bool
getIsId self
  = liftIO
      (toBool <$> ({# call webkit_dom_attr_get_is_id #} (toAttr self)))
