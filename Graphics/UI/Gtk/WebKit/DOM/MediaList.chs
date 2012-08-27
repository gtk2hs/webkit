module Graphics.UI.Gtk.WebKit.DOM.MediaList
       (mediaListItem, mediaListDeleteMedium, mediaListAppendMedium,
        mediaListSetMediaText, mediaListGetMediaText, mediaListGetLength)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
mediaListItem :: (MediaListClass self) => self -> Word -> IO String
mediaListItem self index
  = ({# call webkit_dom_media_list_item #} (toMediaList self)
       (fromIntegral index))
      >>=
      readUTFString
 
mediaListDeleteMedium ::
                      (MediaListClass self) => self -> String -> IO ()
mediaListDeleteMedium self oldMedium
  = propagateGError $
      \ errorPtr_ ->
        withUTFString oldMedium $
          \ oldMediumPtr ->
            {# call webkit_dom_media_list_delete_medium #} (toMediaList self)
              oldMediumPtr
          errorPtr_
 
mediaListAppendMedium ::
                      (MediaListClass self) => self -> String -> IO ()
mediaListAppendMedium self newMedium
  = propagateGError $
      \ errorPtr_ ->
        withUTFString newMedium $
          \ newMediumPtr ->
            {# call webkit_dom_media_list_append_medium #} (toMediaList self)
              newMediumPtr
          errorPtr_
 
mediaListSetMediaText ::
                      (MediaListClass self) => self -> String -> IO ()
mediaListSetMediaText self val
  = propagateGError $
      \ errorPtr_ ->
        withUTFString val $
          \ valPtr ->
            {# call webkit_dom_media_list_set_media_text #} (toMediaList self)
              valPtr
          errorPtr_
 
mediaListGetMediaText :: (MediaListClass self) => self -> IO String
mediaListGetMediaText self
  = ({# call webkit_dom_media_list_get_media_text #}
       (toMediaList self))
      >>=
      readUTFString
 
mediaListGetLength :: (MediaListClass self) => self -> IO Word
mediaListGetLength self
  = fromIntegral <$>
      ({# call webkit_dom_media_list_get_length #} (toMediaList self))
