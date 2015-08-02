module Graphics.UI.Gtk.WebKit.DOM.NodeFilter(
pattern FILTER_ACCEPT,
pattern FILTER_REJECT,
pattern FILTER_SKIP,
pattern SHOW_ALL,
pattern SHOW_ELEMENT,
pattern SHOW_ATTRIBUTE,
pattern SHOW_TEXT,
pattern SHOW_CDATA_SECTION,
pattern SHOW_ENTITY_REFERENCE,
pattern SHOW_ENTITY,
pattern SHOW_PROCESSING_INSTRUCTION,
pattern SHOW_COMMENT,
pattern SHOW_DOCUMENT,
pattern SHOW_DOCUMENT_TYPE,
pattern SHOW_DOCUMENT_FRAGMENT,
pattern SHOW_NOTATION,
NodeFilter,
castToNodeFilter,
gTypeNodeFilter,
NodeFilterClass,
toNodeFilter,
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

pattern FILTER_ACCEPT = 1
pattern FILTER_REJECT = 2
pattern FILTER_SKIP = 3
pattern SHOW_ALL = 4294967295
pattern SHOW_ELEMENT = 1
pattern SHOW_ATTRIBUTE = 2
pattern SHOW_TEXT = 4
pattern SHOW_CDATA_SECTION = 8
pattern SHOW_ENTITY_REFERENCE = 16
pattern SHOW_ENTITY = 32
pattern SHOW_PROCESSING_INSTRUCTION = 64
pattern SHOW_COMMENT = 128
pattern SHOW_DOCUMENT = 256
pattern SHOW_DOCUMENT_TYPE = 512
pattern SHOW_DOCUMENT_FRAGMENT = 1024
pattern SHOW_NOTATION = 2048
