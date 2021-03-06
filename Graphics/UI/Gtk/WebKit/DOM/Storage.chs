module Graphics.UI.Gtk.WebKit.DOM.Storage(
#if WEBKIT_CHECK_VERSION(2,2,2)
key,
getItem,
#endif
setItem,
#if WEBKIT_CHECK_VERSION(2,2,2)
removeItem,
clear,
getLength,
#endif
Storage,
castToStorage,
gTypeStorage,
StorageClass,
toStorage,
) where
import Prelude hiding (drop, error, print)
import Data.Typeable (Typeable)
import Foreign.Marshal (maybePeek, maybeWith)
import System.Glib.FFI (maybeNull, withForeignPtr, nullForeignPtr, Ptr, nullPtr, castPtr, Word, Int64, Word64, CChar(..), CInt(..), CUInt(..), CLong(..), CULong(..), CLLong(..), CULLong(..), CShort(..), CUShort(..), CFloat(..), CDouble(..), toBool, fromBool)
import System.Glib.UTFString (GlibString(..), readUTFString)
import Control.Applicative ((<$>))
import Control.Monad (void)
import Control.Monad.IO.Class (MonadIO(..))
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventTargetClosures
import Graphics.UI.Gtk.WebKit.DOM.EventM
{#import Graphics.UI.Gtk.WebKit.Types#}
import Graphics.UI.Gtk.WebKit.DOM.Enums


#if WEBKIT_CHECK_VERSION(2,2,2) 
key ::
    (MonadIO m, StorageClass self, GlibString string) =>
      self -> Word -> m (Maybe string)
key self index
  = liftIO
      ((propagateGError $
          \ errorPtr_ ->
            {# call webkit_dom_storage_key #} (toStorage self)
              (fromIntegral index)
              errorPtr_)
         >>=
         maybePeek readUTFString)
 
getItem ::
        (MonadIO m, StorageClass self, GlibString string) =>
          self -> string -> m (Maybe string)
getItem self key
  = liftIO
      ((propagateGError $
          \ errorPtr_ ->
            withUTFString key $
              \ keyPtr ->
                {# call webkit_dom_storage_get_item #} (toStorage self) keyPtr
              errorPtr_)
         >>=
         maybePeek readUTFString)
#endif
 
setItem ::
        (MonadIO m, StorageClass self, GlibString string) =>
          self -> string -> string -> m ()
setItem self key data'
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           withUTFString data' $
             \ dataPtr ->
               withUTFString key $
                 \ keyPtr ->
                   {# call webkit_dom_storage_set_item #} (toStorage self) keyPtr
                 dataPtr
             errorPtr_)

#if WEBKIT_CHECK_VERSION(2,2,2) 
removeItem ::
           (MonadIO m, StorageClass self, GlibString string) =>
             self -> string -> m ()
removeItem self key
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           withUTFString key $
             \ keyPtr ->
               {# call webkit_dom_storage_remove_item #} (toStorage self) keyPtr
             errorPtr_)
 
clear :: (MonadIO m, StorageClass self) => self -> m ()
clear self
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_storage_clear #} (toStorage self) errorPtr_)
 
getLength :: (MonadIO m, StorageClass self) => self -> m Word
getLength self
  = liftIO
      (fromIntegral <$>
         (propagateGError $
            \ errorPtr_ ->
              {# call webkit_dom_storage_get_length #} (toStorage self)
                errorPtr_))
#endif
