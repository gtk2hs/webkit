module Graphics.UI.Gtk.WebKit.DOM.Text(
splitText,
replaceWholeText,
getWholeText,
Text,
castToText,
gTypeText,
TextClass,
toText,
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

 
splitText ::
          (MonadIO m, TextClass self) => self -> Word -> m (Maybe Text)
splitText self offset
  = liftIO
      (maybeNull (makeNewGObject mkText)
         (propagateGError $
            \ errorPtr_ ->
              {# call webkit_dom_text_split_text #} (toText self)
                (fromIntegral offset)
                errorPtr_))
 
replaceWholeText ::
                 (MonadIO m, TextClass self, GlibString string) =>
                   self -> string -> m (Maybe Text)
replaceWholeText self content
  = liftIO
      (maybeNull (makeNewGObject mkText)
         (propagateGError $
            \ errorPtr_ ->
              withUTFString content $
                \ contentPtr ->
                  {# call webkit_dom_text_replace_whole_text #} (toText self)
                    contentPtr
                errorPtr_))
 
getWholeText ::
             (MonadIO m, TextClass self, GlibString string) => self -> m string
getWholeText self
  = liftIO
      (({# call webkit_dom_text_get_whole_text #} (toText self)) >>=
         readUTFString)
