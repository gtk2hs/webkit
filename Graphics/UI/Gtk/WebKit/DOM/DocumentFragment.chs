module Graphics.UI.Gtk.WebKit.DOM.DocumentFragment(
querySelector,
querySelectorAll,
DocumentFragment,
castToDocumentFragment,
gTypeDocumentFragment,
DocumentFragmentClass,
toDocumentFragment,
) where
import Prelude hiding (drop, error, print)
import Data.Typeable (Typeable)
import Foreign.Marshal (maybePeek, maybeWith)
import System.Glib.FFI (maybeNull, withForeignPtr, nullForeignPtr, Ptr, nullPtr, castPtr, Word, Int64, Word64, CChar(..), CInt(..), CUInt(..), CLong(..), CULong(..), CLLong(..), CULLong(..), CShort(..), CUShort(..), CFloat(..), CDouble(..), toBool, fromBool)
import System.Glib.UTFString (GlibString(..), readUTFString)
import Control.Applicative ((<$>))
import Control.Monad (void)
import Control.Monad.IO.Class (MonadIO(..))
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventTargetClosures
import Graphics.UI.Gtk.WebKit.DOM.EventM
{#import Graphics.UI.Gtk.WebKit.Types#}
import Graphics.UI.Gtk.WebKit.DOM.Enums

 
querySelector ::
              (MonadIO m, DocumentFragmentClass self, GlibString string) =>
                self -> string -> m (Maybe Element)
querySelector self selectors
  = liftIO
      (maybeNull (makeNewGObject mkElement)
         (propagateGError $
            \ errorPtr_ ->
              withUTFString selectors $
                \ selectorsPtr ->
                  {# call webkit_dom_document_fragment_query_selector #}
                    (toDocumentFragment self)
                    selectorsPtr
                errorPtr_))
 
querySelectorAll ::
                 (MonadIO m, DocumentFragmentClass self, GlibString string) =>
                   self -> string -> m (Maybe NodeList)
querySelectorAll self selectors
  = liftIO
      (maybeNull (makeNewGObject mkNodeList)
         (propagateGError $
            \ errorPtr_ ->
              withUTFString selectors $
                \ selectorsPtr ->
                  {# call webkit_dom_document_fragment_query_selector_all #}
                    (toDocumentFragment self)
                    selectorsPtr
                errorPtr_))
