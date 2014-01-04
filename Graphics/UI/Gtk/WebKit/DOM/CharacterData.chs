module Graphics.UI.Gtk.WebKit.DOM.CharacterData
       (characterDataSubstringData, characterDataAppendData,
        characterDataInsertData, characterDataDeleteData,
        characterDataReplaceData, characterDataSetData,
        characterDataGetData, characterDataGetLength,
        CharacterData, CharacterDataClass,
        castToCharacterData, gTypeCharacterData, toCharacterData)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
characterDataSubstringData ::
                           (CharacterDataClass self) => self -> Word -> Word -> IO String
characterDataSubstringData self offset length
  = (propagateGError $
       \ errorPtr_ ->
         {# call webkit_dom_character_data_substring_data #}
           (toCharacterData self)
           (fromIntegral offset)
           (fromIntegral length)
           errorPtr_)
      >>=
      readUTFString
 
characterDataAppendData ::
                        (CharacterDataClass self) => self -> String -> IO ()
characterDataAppendData self data'
  = propagateGError $
      \ errorPtr_ ->
        withUTFString data' $
          \ dataPtr ->
            {# call webkit_dom_character_data_append_data #}
              (toCharacterData self)
              dataPtr
          errorPtr_
 
characterDataInsertData ::
                        (CharacterDataClass self) => self -> Word -> String -> IO ()
characterDataInsertData self offset data'
  = propagateGError $
      \ errorPtr_ ->
        withUTFString data' $
          \ dataPtr ->
            {# call webkit_dom_character_data_insert_data #}
              (toCharacterData self)
              (fromIntegral offset)
              dataPtr
          errorPtr_
 
characterDataDeleteData ::
                        (CharacterDataClass self) => self -> Word -> Word -> IO ()
characterDataDeleteData self offset length
  = propagateGError $
      \ errorPtr_ ->
        {# call webkit_dom_character_data_delete_data #}
          (toCharacterData self)
          (fromIntegral offset)
          (fromIntegral length)
          errorPtr_
 
characterDataReplaceData ::
                         (CharacterDataClass self) =>
                           self -> Word -> Word -> String -> IO ()
characterDataReplaceData self offset length data'
  = propagateGError $
      \ errorPtr_ ->
        withUTFString data' $
          \ dataPtr ->
            {# call webkit_dom_character_data_replace_data #}
              (toCharacterData self)
              (fromIntegral offset)
              (fromIntegral length)
              dataPtr
          errorPtr_
 
characterDataSetData ::
                     (CharacterDataClass self) => self -> String -> IO ()
characterDataSetData self val
  = propagateGError $
      \ errorPtr_ ->
        withUTFString val $
          \ valPtr ->
            {# call webkit_dom_character_data_set_data #}
              (toCharacterData self)
              valPtr
          errorPtr_
 
characterDataGetData ::
                     (CharacterDataClass self) => self -> IO String
characterDataGetData self
  = ({# call webkit_dom_character_data_get_data #}
       (toCharacterData self))
      >>=
      readUTFString
 
characterDataGetLength ::
                       (CharacterDataClass self) => self -> IO Word
characterDataGetLength self
  = fromIntegral <$>
      ({# call webkit_dom_character_data_get_length #}
         (toCharacterData self))
