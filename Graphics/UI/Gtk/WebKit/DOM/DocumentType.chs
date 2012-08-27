module Graphics.UI.Gtk.WebKit.DOM.DocumentType
       (documentTypeGetName, documentTypeGetEntities,
        documentTypeGetNotations, documentTypeGetPublicId,
        documentTypeGetSystemId, documentTypeGetInternalSubset)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
documentTypeGetName ::
                    (DocumentTypeClass self) => self -> IO String
documentTypeGetName self
  = ({# call webkit_dom_document_type_get_name #}
       (toDocumentType self))
      >>=
      readUTFString
 
documentTypeGetEntities ::
                        (DocumentTypeClass self) => self -> IO (Maybe NamedNodeMap)
documentTypeGetEntities self
  = maybeNull (makeNewGObject mkNamedNodeMap)
      ({# call webkit_dom_document_type_get_entities #}
         (toDocumentType self))
 
documentTypeGetNotations ::
                         (DocumentTypeClass self) => self -> IO (Maybe NamedNodeMap)
documentTypeGetNotations self
  = maybeNull (makeNewGObject mkNamedNodeMap)
      ({# call webkit_dom_document_type_get_notations #}
         (toDocumentType self))
 
documentTypeGetPublicId ::
                        (DocumentTypeClass self) => self -> IO String
documentTypeGetPublicId self
  = ({# call webkit_dom_document_type_get_public_id #}
       (toDocumentType self))
      >>=
      readUTFString
 
documentTypeGetSystemId ::
                        (DocumentTypeClass self) => self -> IO String
documentTypeGetSystemId self
  = ({# call webkit_dom_document_type_get_system_id #}
       (toDocumentType self))
      >>=
      readUTFString
 
documentTypeGetInternalSubset ::
                              (DocumentTypeClass self) => self -> IO String
documentTypeGetInternalSubset self
  = ({# call webkit_dom_document_type_get_internal_subset #}
       (toDocumentType self))
      >>=
      readUTFString
