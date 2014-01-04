module Graphics.UI.Gtk.WebKit.DOM.DOMImplementation
       (domImplementationHasFeature, domImplementationCreateDocumentType,
        domImplementationCreateDocument,
        domImplementationCreateCSSStyleSheet,
        domImplementationCreateHTMLDocument, DOMImplementation,
        DOMImplementationClass, castToDOMImplementation,
        gTypeDOMImplementation, toDOMImplementation)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
domImplementationHasFeature ::
                            (DOMImplementationClass self) =>
                              self -> String -> String -> IO Bool
domImplementationHasFeature self feature version
  = toBool <$>
      (withUTFString version $
         \ versionPtr ->
           withUTFString feature $
             \ featurePtr ->
               {# call webkit_dom_dom_implementation_has_feature #}
                 (toDOMImplementation self)
                 featurePtr
             versionPtr)
 
domImplementationCreateDocumentType ::
                                    (DOMImplementationClass self) =>
                                      self -> String -> String -> String -> IO (Maybe DocumentType)
domImplementationCreateDocumentType self qualifiedName publicId
  systemId
  = maybeNull (makeNewGObject mkDocumentType)
      (propagateGError $
         \ errorPtr_ ->
           withUTFString systemId $
             \ systemIdPtr ->
               withUTFString publicId $
                 \ publicIdPtr ->
                   withUTFString qualifiedName $
                     \ qualifiedNamePtr ->
                       {# call webkit_dom_dom_implementation_create_document_type #}
                         (toDOMImplementation self)
                         qualifiedNamePtr
                     publicIdPtr
                 systemIdPtr
             errorPtr_)
 
domImplementationCreateDocument ::
                                (DOMImplementationClass self, DocumentTypeClass doctype) =>
                                  self -> String -> String -> Maybe doctype -> IO (Maybe Document)
domImplementationCreateDocument self namespaceURI qualifiedName
  doctype
  = maybeNull (makeNewGObject mkDocument)
      (propagateGError $
         \ errorPtr_ ->
           withUTFString qualifiedName $
             \ qualifiedNamePtr ->
               withUTFString namespaceURI $
                 \ namespaceURIPtr ->
                   {# call webkit_dom_dom_implementation_create_document #}
                     (toDOMImplementation self)
                     namespaceURIPtr
                 qualifiedNamePtr
             (maybe (DocumentType nullForeignPtr) toDocumentType doctype)
             errorPtr_)
 
domImplementationCreateCSSStyleSheet ::
                                     (DOMImplementationClass self) =>
                                       self -> String -> String -> IO (Maybe CSSStyleSheet)
domImplementationCreateCSSStyleSheet self title media
  = maybeNull (makeNewGObject mkCSSStyleSheet)
      (propagateGError $
         \ errorPtr_ ->
           withUTFString media $
             \ mediaPtr ->
               withUTFString title $
                 \ titlePtr ->
                   {# call webkit_dom_dom_implementation_create_css_style_sheet #}
                     (toDOMImplementation self)
                     titlePtr
                 mediaPtr
             errorPtr_)
 
domImplementationCreateHTMLDocument ::
                                    (DOMImplementationClass self) =>
                                      self -> String -> IO (Maybe HTMLDocument)
domImplementationCreateHTMLDocument self title
  = maybeNull (makeNewGObject mkHTMLDocument)
      (withUTFString title $
         \ titlePtr ->
           {# call webkit_dom_dom_implementation_create_html_document #}
             (toDOMImplementation self)
             titlePtr)
