module Graphics.UI.Gtk.WebKit.DOM.CharacterData(
substringData,
appendData,
insertData,
deleteData,
replaceData,
setData,
getData,
getLength,
CharacterData,
castToCharacterData,
gTypeCharacterData,
CharacterDataClass,
toCharacterData,
) where
import Prelude hiding (drop, error, print)
import System.Glib.FFI (maybeNull, withForeignPtr, nullForeignPtr, Ptr, nullPtr, castPtr, Word, Int64, Word64, CChar(..), CInt(..), CUInt(..), CLong(..), CULong(..), CShort(..), CUShort(..), CFloat(..), CDouble(..), toBool, fromBool)
import System.Glib.UTFString (GlibString(..), readUTFString)
import Control.Applicative ((<$>))
import Control.Monad (void)
import Control.Monad.IO.Class (MonadIO(..))
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventTargetClosures
import Graphics.UI.Gtk.WebKit.DOM.EventM
import Graphics.UI.Gtk.WebKit.DOM.Enums

 
substringData ::
              (MonadIO m, CharacterDataClass self, GlibString string) =>
                self -> Word -> Word -> m string
substringData self offset length
  = liftIO
      ((propagateGError $
          \ errorPtr_ ->
            {# call webkit_dom_character_data_substring_data #}
              (toCharacterData self)
              (fromIntegral offset)
              (fromIntegral length)
              errorPtr_)
         >>=
         readUTFString)
 
appendData ::
           (MonadIO m, CharacterDataClass self, GlibString string) =>
             self -> string -> m ()
appendData self data'
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           withUTFString data' $
             \ dataPtr ->
               {# call webkit_dom_character_data_append_data #}
                 (toCharacterData self)
                 dataPtr
             errorPtr_)
 
insertData ::
           (MonadIO m, CharacterDataClass self, GlibString string) =>
             self -> Word -> string -> m ()
insertData self offset data'
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           withUTFString data' $
             \ dataPtr ->
               {# call webkit_dom_character_data_insert_data #}
                 (toCharacterData self)
                 (fromIntegral offset)
                 dataPtr
             errorPtr_)
 
deleteData ::
           (MonadIO m, CharacterDataClass self) =>
             self -> Word -> Word -> m ()
deleteData self offset length
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_character_data_delete_data #}
             (toCharacterData self)
             (fromIntegral offset)
             (fromIntegral length)
             errorPtr_)
 
replaceData ::
            (MonadIO m, CharacterDataClass self, GlibString string) =>
              self -> Word -> Word -> string -> m ()
replaceData self offset length data'
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           withUTFString data' $
             \ dataPtr ->
               {# call webkit_dom_character_data_replace_data #}
                 (toCharacterData self)
                 (fromIntegral offset)
                 (fromIntegral length)
                 dataPtr
             errorPtr_)
 
setData ::
        (MonadIO m, CharacterDataClass self, GlibString string) =>
          self -> string -> m ()
setData self val
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           withUTFString val $
             \ valPtr ->
               {# call webkit_dom_character_data_set_data #}
                 (toCharacterData self)
                 valPtr
             errorPtr_)
 
getData ::
        (MonadIO m, CharacterDataClass self, GlibString string) =>
          self -> m string
getData self
  = liftIO
      (({# call webkit_dom_character_data_get_data #}
          (toCharacterData self))
         >>=
         readUTFString)
 
getLength :: (MonadIO m, CharacterDataClass self) => self -> m Word
getLength self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_character_data_get_length #}
            (toCharacterData self)))
