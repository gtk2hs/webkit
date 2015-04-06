module Graphics.UI.Gtk.WebKit.DOM.DOMImplementation(
hasFeature,
createDocumentType,
createDocument,
createCSSStyleSheet,
createHTMLDocument,
DOMImplementation,
castToDOMImplementation,
gTypeDOMImplementation,
DOMImplementationClass,
toDOMImplementation,
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

 
hasFeature ::
           (MonadIO m, DOMImplementationClass self, GlibString string) =>
             self -> string -> string -> m Bool
hasFeature self feature version
  = liftIO
      (toBool <$>
         (withUTFString version $
            \ versionPtr ->
              withUTFString feature $
                \ featurePtr ->
                  {# call webkit_dom_dom_implementation_has_feature #}
                    (toDOMImplementation self)
                    featurePtr
                versionPtr))
 
createDocumentType ::
                   (MonadIO m, DOMImplementationClass self, GlibString string) =>
                     self -> string -> string -> string -> m (Maybe DocumentType)
createDocumentType self qualifiedName publicId systemId
  = liftIO
      (maybeNull (makeNewGObject mkDocumentType)
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
                errorPtr_))
 
createDocument ::
               (MonadIO m, DOMImplementationClass self, DocumentTypeClass doctype,
                GlibString string) =>
                 self -> string -> string -> Maybe doctype -> m (Maybe Document)
createDocument self namespaceURI qualifiedName doctype
  = liftIO
      (maybeNull (makeNewGObject mkDocument)
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
                errorPtr_))
 
createCSSStyleSheet ::
                    (MonadIO m, DOMImplementationClass self, GlibString string) =>
                      self -> string -> string -> m (Maybe CSSStyleSheet)
createCSSStyleSheet self title media
  = liftIO
      (maybeNull (makeNewGObject mkCSSStyleSheet)
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
                errorPtr_))
 
createHTMLDocument ::
                   (MonadIO m, DOMImplementationClass self, GlibString string) =>
                     self -> string -> m (Maybe HTMLDocument)
createHTMLDocument self title
  = liftIO
      (maybeNull (makeNewGObject mkHTMLDocument)
         (withUTFString title $
            \ titlePtr ->
              {# call webkit_dom_dom_implementation_create_html_document #}
                (toDOMImplementation self)
                titlePtr))
