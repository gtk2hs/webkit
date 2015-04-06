module Graphics.UI.Gtk.WebKit.DOM.MediaList(
item,
deleteMedium,
appendMedium,
setMediaText,
getMediaText,
getLength,
MediaList,
castToMediaList,
gTypeMediaList,
MediaListClass,
toMediaList,
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

 
item ::
     (MonadIO m, MediaListClass self, GlibString string) =>
       self -> Word -> m string
item self index
  = liftIO
      (({# call webkit_dom_media_list_item #} (toMediaList self)
          (fromIntegral index))
         >>=
         readUTFString)
 
deleteMedium ::
             (MonadIO m, MediaListClass self, GlibString string) =>
               self -> string -> m ()
deleteMedium self oldMedium
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           withUTFString oldMedium $
             \ oldMediumPtr ->
               {# call webkit_dom_media_list_delete_medium #} (toMediaList self)
                 oldMediumPtr
             errorPtr_)
 
appendMedium ::
             (MonadIO m, MediaListClass self, GlibString string) =>
               self -> string -> m ()
appendMedium self newMedium
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           withUTFString newMedium $
             \ newMediumPtr ->
               {# call webkit_dom_media_list_append_medium #} (toMediaList self)
                 newMediumPtr
             errorPtr_)
 
setMediaText ::
             (MonadIO m, MediaListClass self, GlibString string) =>
               self -> string -> m ()
setMediaText self val
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           withUTFString val $
             \ valPtr ->
               {# call webkit_dom_media_list_set_media_text #} (toMediaList self)
                 valPtr
             errorPtr_)
 
getMediaText ::
             (MonadIO m, MediaListClass self, GlibString string) =>
               self -> m string
getMediaText self
  = liftIO
      (({# call webkit_dom_media_list_get_media_text #}
          (toMediaList self))
         >>=
         readUTFString)
 
getLength :: (MonadIO m, MediaListClass self) => self -> m Word
getLength self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_media_list_get_length #} (toMediaList self)))
