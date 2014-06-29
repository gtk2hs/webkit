module Graphics.UI.Gtk.WebKit.DOM.MediaList
       (mediaListItem, mediaListDeleteMedium, mediaListAppendMedium,
        mediaListSetMediaText, mediaListGetMediaText, mediaListGetLength,
        MediaList, MediaListClass, castToMediaList, gTypeMediaList,
        toMediaList)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
mediaListItem ::
              (MediaListClass self, GlibString string) =>
                self -> Word -> IO string
mediaListItem self index
  = ({# call webkit_dom_media_list_item #} (toMediaList self)
       (fromIntegral index))
      >>=
      readUTFString
 
mediaListDeleteMedium ::
                      (MediaListClass self, GlibString string) => self -> string -> IO ()
mediaListDeleteMedium self oldMedium
  = propagateGError $
      \ errorPtr_ ->
        withUTFString oldMedium $
          \ oldMediumPtr ->
            {# call webkit_dom_media_list_delete_medium #} (toMediaList self)
              oldMediumPtr
          errorPtr_
 
mediaListAppendMedium ::
                      (MediaListClass self, GlibString string) => self -> string -> IO ()
mediaListAppendMedium self newMedium
  = propagateGError $
      \ errorPtr_ ->
        withUTFString newMedium $
          \ newMediumPtr ->
            {# call webkit_dom_media_list_append_medium #} (toMediaList self)
              newMediumPtr
          errorPtr_
 
mediaListSetMediaText ::
                      (MediaListClass self, GlibString string) => self -> string -> IO ()
mediaListSetMediaText self val
  = propagateGError $
      \ errorPtr_ ->
        withUTFString val $
          \ valPtr ->
            {# call webkit_dom_media_list_set_media_text #} (toMediaList self)
              valPtr
          errorPtr_
 
mediaListGetMediaText ::
                      (MediaListClass self, GlibString string) => self -> IO string
mediaListGetMediaText self
  = ({# call webkit_dom_media_list_get_media_text #}
       (toMediaList self))
      >>=
      readUTFString
 
mediaListGetLength :: (MediaListClass self) => self -> IO Word
mediaListGetLength self
  = fromIntegral <$>
      ({# call webkit_dom_media_list_get_length #} (toMediaList self))
