module Graphics.UI.Gtk.WebKit.DOM.FileList(
item,
getLength,
FileList,
castToFileList,
gTypeFileList,
FileListClass,
toFileList,
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

 
item ::
     (MonadIO m, FileListClass self) => self -> Word -> m (Maybe File)
item self index
  = liftIO
      (maybeNull (makeNewGObject mkFile)
         ({# call webkit_dom_file_list_item #} (toFileList self)
            (fromIntegral index)))
 
getLength :: (MonadIO m, FileListClass self) => self -> m Word
getLength self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_file_list_get_length #} (toFileList self)))
