module Graphics.UI.Gtk.WebKit.DOM.StyleSheetList(
item,
getLength,
StyleSheetList,
castToStyleSheetList,
gTypeStyleSheetList,
StyleSheetListClass,
toStyleSheetList,
) where
import Prelude hiding (drop, error, print)
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
     (MonadIO m, StyleSheetListClass self) =>
       self -> Word -> m (Maybe StyleSheet)
item self index
  = liftIO
      (maybeNull (makeNewGObject mkStyleSheet)
         ({# call webkit_dom_style_sheet_list_item #}
            (toStyleSheetList self)
            (fromIntegral index)))
 
getLength ::
          (MonadIO m, StyleSheetListClass self) => self -> m Word
getLength self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_style_sheet_list_get_length #}
            (toStyleSheetList self)))
