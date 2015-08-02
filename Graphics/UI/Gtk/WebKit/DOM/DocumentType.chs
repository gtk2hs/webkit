module Graphics.UI.Gtk.WebKit.DOM.DocumentType(
getName,
getEntities,
getNotations,
getPublicId,
getSystemId,
getInternalSubset,
DocumentType,
castToDocumentType,
gTypeDocumentType,
DocumentTypeClass,
toDocumentType,
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

 
getName ::
        (MonadIO m, DocumentTypeClass self, GlibString string) =>
          self -> m string
getName self
  = liftIO
      (({# call webkit_dom_document_type_get_name #}
          (toDocumentType self))
         >>=
         readUTFString)
 
getEntities ::
            (MonadIO m, DocumentTypeClass self) =>
              self -> m (Maybe NamedNodeMap)
getEntities self
  = liftIO
      (maybeNull (makeNewGObject mkNamedNodeMap)
         ({# call webkit_dom_document_type_get_entities #}
            (toDocumentType self)))
 
getNotations ::
             (MonadIO m, DocumentTypeClass self) =>
               self -> m (Maybe NamedNodeMap)
getNotations self
  = liftIO
      (maybeNull (makeNewGObject mkNamedNodeMap)
         ({# call webkit_dom_document_type_get_notations #}
            (toDocumentType self)))
 
getPublicId ::
            (MonadIO m, DocumentTypeClass self, GlibString string) =>
              self -> m (Maybe string)
getPublicId self
  = liftIO
      (({# call webkit_dom_document_type_get_public_id #}
          (toDocumentType self))
         >>=
         maybePeek readUTFString)
 
getSystemId ::
            (MonadIO m, DocumentTypeClass self, GlibString string) =>
              self -> m (Maybe string)
getSystemId self
  = liftIO
      (({# call webkit_dom_document_type_get_system_id #}
          (toDocumentType self))
         >>=
         maybePeek readUTFString)
 
getInternalSubset ::
                  (MonadIO m, DocumentTypeClass self, GlibString string) =>
                    self -> m (Maybe string)
getInternalSubset self
  = liftIO
      (({# call webkit_dom_document_type_get_internal_subset #}
          (toDocumentType self))
         >>=
         maybePeek readUTFString)
