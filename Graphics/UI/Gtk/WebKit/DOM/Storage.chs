module Graphics.UI.Gtk.WebKit.DOM.Storage
       (storageKey, storageGetItem, storageSetItem, storageRemoveItem,
        storageClear, storageGetLength, Storage, StorageClass,
        castToStorage, gTypeStorage, toStorage)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM


storageKey :: (StorageClass self) => self -> Word -> IO String
#if WEBKIT_CHECK_VERSION(2,0,0)
storageKey self index = propagateGError $ \errorPtr ->
    ({# call webkit_dom_storage_key #} (toStorage self) (fromIntegral index) errorPtr >>= readUTFString)
#else
storageKey self index = {# call webkit_dom_storage_key #} (toStorage self) (fromIntegral index) >>= readUTFString
#endif


storageGetItem :: (StorageClass self) => self -> String -> IO String
#if WEBKIT_CHECK_VERSION(2,0,0)
storageGetItem self key = propagateGError $ \errorPtr -> (
  (withUTFString key $ \keyPtr ->
    {# call webkit_dom_storage_get_item #} (toStorage self) keyPtr errorPtr)
  >>= readUTFString)
#else
storageGetItem self key =
  (withUTFString key $ \keyPtr ->
    {# call webkit_dom_storage_get_item #} (toStorage self) keyPtr)
  >>= readUTFString
#endif


storageSetItem :: (StorageClass self) => self -> String -> String -> IO ()
storageSetItem self key data'
  = propagateGError $
      \ errorPtr_ ->
        withUTFString data' $
          \ dataPtr ->
            withUTFString key $
              \ keyPtr ->
                {# call webkit_dom_storage_set_item #} (toStorage self) keyPtr
              dataPtr
          errorPtr_


storageRemoveItem :: (StorageClass self) => self -> String -> IO ()
#if WEBKIT_CHECK_VERSION(2,0,0)
storageRemoveItem self key = propagateGError $ \errorPtr -> (
  withUTFString key $ \keyPtr ->
    {# call webkit_dom_storage_remove_item #} (toStorage self) keyPtr errorPtr)
#else
storageRemoveItem self key = withUTFString key $ \keyPtr ->
    {# call webkit_dom_storage_remove_item #} (toStorage self) keyPtr
#endif


storageClear :: (StorageClass self) => self -> IO ()
#if WEBKIT_CHECK_VERSION(2,0,0)
storageClear self = propagateGError $ {# call webkit_dom_storage_clear #} (toStorage self)
#else
storageClear = {# call webkit_dom_storage_clear #} . toStorage
#endif


storageGetLength :: (StorageClass self) => self -> IO Word
#if WEBKIT_CHECK_VERSION(2,0,0)
storageGetLength self = fromIntegral <$> propagateGError ({# call webkit_dom_storage_get_length #} (toStorage self))
#else
storageGetLength self = fromIntegral <$> ({# call webkit_dom_storage_get_length #} (toStorage self))
#endif
