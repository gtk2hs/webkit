module Graphics.UI.Gtk.WebKit.DOM.Storage
       (storageKey, storageGetItem, storageSetItem, storageRemoveItem,
        storageClear, storageGetLength)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
storageKey :: (StorageClass self) => self -> Word -> IO String
storageKey self index
  = ({# call webkit_dom_storage_key #} (toStorage self)
       (fromIntegral index))
      >>=
      readUTFString
 
storageGetItem ::
               (StorageClass self) => self -> String -> IO String
storageGetItem self key
  = (withUTFString key $
       \ keyPtr ->
         {# call webkit_dom_storage_get_item #} (toStorage self) keyPtr)
      >>=
      readUTFString
 
storageSetItem ::
               (StorageClass self) => self -> String -> String -> IO ()
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
storageRemoveItem self key
  = withUTFString key $
      \ keyPtr ->
        {# call webkit_dom_storage_remove_item #} (toStorage self) keyPtr
 
storageClear :: (StorageClass self) => self -> IO ()
storageClear self
  = {# call webkit_dom_storage_clear #} (toStorage self)
 
storageGetLength :: (StorageClass self) => self -> IO Word
storageGetLength self
  = fromIntegral <$>
      ({# call webkit_dom_storage_get_length #} (toStorage self))
