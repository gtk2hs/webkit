module Graphics.UI.Gtk.WebKit.DOM.ProcessingInstruction(
getTarget,
getSheet,
ProcessingInstruction,
castToProcessingInstruction,
gTypeProcessingInstruction,
ProcessingInstructionClass,
toProcessingInstruction,
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

 
getTarget ::
          (MonadIO m, ProcessingInstructionClass self, GlibString string) =>
            self -> m string
getTarget self
  = liftIO
      (({# call webkit_dom_processing_instruction_get_target #}
          (toProcessingInstruction self))
         >>=
         readUTFString)
 
getSheet ::
         (MonadIO m, ProcessingInstructionClass self) =>
           self -> m (Maybe StyleSheet)
getSheet self
  = liftIO
      (maybeNull (makeNewGObject mkStyleSheet)
         ({# call webkit_dom_processing_instruction_get_sheet #}
            (toProcessingInstruction self)))
