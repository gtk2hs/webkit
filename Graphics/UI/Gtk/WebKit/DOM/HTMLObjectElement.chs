module Graphics.UI.Gtk.WebKit.DOM.HTMLObjectElement(
checkValidity,
setCustomValidity,
getForm,
setCode,
getCode,
setAlign,
getAlign,
setArchive,
getArchive,
setBorder,
getBorder,
setCodeBase,
getCodeBase,
setCodeType,
getCodeType,
setData,
getData,
setDeclare,
getDeclare,
setHeight,
getHeight,
setHspace,
getHspace,
setName,
getName,
setStandby,
getStandby,
setUseMap,
getUseMap,
setVspace,
getVspace,
setWidth,
getWidth,
getWillValidate,
getValidity,
getValidationMessage,
getContentDocument,
HTMLObjectElement,
castToHTMLObjectElement,
gTypeHTMLObjectElement,
HTMLObjectElementClass,
toHTMLObjectElement,
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

 
checkValidity ::
              (MonadIO m, HTMLObjectElementClass self) => self -> m Bool
checkValidity self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_html_object_element_check_validity #}
            (toHTMLObjectElement self)))
 
setCustomValidity ::
                  (MonadIO m, HTMLObjectElementClass self, GlibString string) =>
                    self -> string -> m ()
setCustomValidity self error
  = liftIO
      (withUTFString error $
         \ errorPtr ->
           {# call webkit_dom_html_object_element_set_custom_validity #}
             (toHTMLObjectElement self)
             errorPtr)
 
getForm ::
        (MonadIO m, HTMLObjectElementClass self) =>
          self -> m (Maybe HTMLFormElement)
getForm self
  = liftIO
      (maybeNull (makeNewGObject mkHTMLFormElement)
         ({# call webkit_dom_html_object_element_get_form #}
            (toHTMLObjectElement self)))
 
setCode ::
        (MonadIO m, HTMLObjectElementClass self, GlibString string) =>
          self -> string -> m ()
setCode self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_object_element_set_code #}
             (toHTMLObjectElement self)
             valPtr)
 
getCode ::
        (MonadIO m, HTMLObjectElementClass self, GlibString string) =>
          self -> m string
getCode self
  = liftIO
      (({# call webkit_dom_html_object_element_get_code #}
          (toHTMLObjectElement self))
         >>=
         readUTFString)
 
setAlign ::
         (MonadIO m, HTMLObjectElementClass self, GlibString string) =>
           self -> string -> m ()
setAlign self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_object_element_set_align #}
             (toHTMLObjectElement self)
             valPtr)
 
getAlign ::
         (MonadIO m, HTMLObjectElementClass self, GlibString string) =>
           self -> m string
getAlign self
  = liftIO
      (({# call webkit_dom_html_object_element_get_align #}
          (toHTMLObjectElement self))
         >>=
         readUTFString)
 
setArchive ::
           (MonadIO m, HTMLObjectElementClass self, GlibString string) =>
             self -> string -> m ()
setArchive self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_object_element_set_archive #}
             (toHTMLObjectElement self)
             valPtr)
 
getArchive ::
           (MonadIO m, HTMLObjectElementClass self, GlibString string) =>
             self -> m string
getArchive self
  = liftIO
      (({# call webkit_dom_html_object_element_get_archive #}
          (toHTMLObjectElement self))
         >>=
         readUTFString)
 
setBorder ::
          (MonadIO m, HTMLObjectElementClass self, GlibString string) =>
            self -> string -> m ()
setBorder self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_object_element_set_border #}
             (toHTMLObjectElement self)
             valPtr)
 
getBorder ::
          (MonadIO m, HTMLObjectElementClass self, GlibString string) =>
            self -> m string
getBorder self
  = liftIO
      (({# call webkit_dom_html_object_element_get_border #}
          (toHTMLObjectElement self))
         >>=
         readUTFString)
 
setCodeBase ::
            (MonadIO m, HTMLObjectElementClass self, GlibString string) =>
              self -> string -> m ()
setCodeBase self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_object_element_set_code_base #}
             (toHTMLObjectElement self)
             valPtr)
 
getCodeBase ::
            (MonadIO m, HTMLObjectElementClass self, GlibString string) =>
              self -> m string
getCodeBase self
  = liftIO
      (({# call webkit_dom_html_object_element_get_code_base #}
          (toHTMLObjectElement self))
         >>=
         readUTFString)
 
setCodeType ::
            (MonadIO m, HTMLObjectElementClass self, GlibString string) =>
              self -> string -> m ()
setCodeType self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_object_element_set_code_type #}
             (toHTMLObjectElement self)
             valPtr)
 
getCodeType ::
            (MonadIO m, HTMLObjectElementClass self, GlibString string) =>
              self -> m string
getCodeType self
  = liftIO
      (({# call webkit_dom_html_object_element_get_code_type #}
          (toHTMLObjectElement self))
         >>=
         readUTFString)
 
setData ::
        (MonadIO m, HTMLObjectElementClass self, GlibString string) =>
          self -> string -> m ()
setData self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_object_element_set_data #}
             (toHTMLObjectElement self)
             valPtr)
 
getData ::
        (MonadIO m, HTMLObjectElementClass self, GlibString string) =>
          self -> m string
getData self
  = liftIO
      (({# call webkit_dom_html_object_element_get_data #}
          (toHTMLObjectElement self))
         >>=
         readUTFString)
 
setDeclare ::
           (MonadIO m, HTMLObjectElementClass self) => self -> Bool -> m ()
setDeclare self val
  = liftIO
      ({# call webkit_dom_html_object_element_set_declare #}
         (toHTMLObjectElement self)
         (fromBool val))
 
getDeclare ::
           (MonadIO m, HTMLObjectElementClass self) => self -> m Bool
getDeclare self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_html_object_element_get_declare #}
            (toHTMLObjectElement self)))
 
setHeight ::
          (MonadIO m, HTMLObjectElementClass self, GlibString string) =>
            self -> string -> m ()
setHeight self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_object_element_set_height #}
             (toHTMLObjectElement self)
             valPtr)
 
getHeight ::
          (MonadIO m, HTMLObjectElementClass self, GlibString string) =>
            self -> m string
getHeight self
  = liftIO
      (({# call webkit_dom_html_object_element_get_height #}
          (toHTMLObjectElement self))
         >>=
         readUTFString)
 
setHspace ::
          (MonadIO m, HTMLObjectElementClass self) => self -> Int -> m ()
setHspace self val
  = liftIO
      ({# call webkit_dom_html_object_element_set_hspace #}
         (toHTMLObjectElement self)
         (fromIntegral val))
 
getHspace ::
          (MonadIO m, HTMLObjectElementClass self) => self -> m Int
getHspace self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_html_object_element_get_hspace #}
            (toHTMLObjectElement self)))
 
setName ::
        (MonadIO m, HTMLObjectElementClass self, GlibString string) =>
          self -> string -> m ()
setName self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_object_element_set_name #}
             (toHTMLObjectElement self)
             valPtr)
 
getName ::
        (MonadIO m, HTMLObjectElementClass self, GlibString string) =>
          self -> m string
getName self
  = liftIO
      (({# call webkit_dom_html_object_element_get_name #}
          (toHTMLObjectElement self))
         >>=
         readUTFString)
 
setStandby ::
           (MonadIO m, HTMLObjectElementClass self, GlibString string) =>
             self -> string -> m ()
setStandby self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_object_element_set_standby #}
             (toHTMLObjectElement self)
             valPtr)
 
getStandby ::
           (MonadIO m, HTMLObjectElementClass self, GlibString string) =>
             self -> m string
getStandby self
  = liftIO
      (({# call webkit_dom_html_object_element_get_standby #}
          (toHTMLObjectElement self))
         >>=
         readUTFString)
 
setUseMap ::
          (MonadIO m, HTMLObjectElementClass self, GlibString string) =>
            self -> string -> m ()
setUseMap self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_object_element_set_use_map #}
             (toHTMLObjectElement self)
             valPtr)
 
getUseMap ::
          (MonadIO m, HTMLObjectElementClass self, GlibString string) =>
            self -> m string
getUseMap self
  = liftIO
      (({# call webkit_dom_html_object_element_get_use_map #}
          (toHTMLObjectElement self))
         >>=
         readUTFString)
 
setVspace ::
          (MonadIO m, HTMLObjectElementClass self) => self -> Int -> m ()
setVspace self val
  = liftIO
      ({# call webkit_dom_html_object_element_set_vspace #}
         (toHTMLObjectElement self)
         (fromIntegral val))
 
getVspace ::
          (MonadIO m, HTMLObjectElementClass self) => self -> m Int
getVspace self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_html_object_element_get_vspace #}
            (toHTMLObjectElement self)))
 
setWidth ::
         (MonadIO m, HTMLObjectElementClass self, GlibString string) =>
           self -> string -> m ()
setWidth self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_object_element_set_width #}
             (toHTMLObjectElement self)
             valPtr)
 
getWidth ::
         (MonadIO m, HTMLObjectElementClass self, GlibString string) =>
           self -> m string
getWidth self
  = liftIO
      (({# call webkit_dom_html_object_element_get_width #}
          (toHTMLObjectElement self))
         >>=
         readUTFString)
 
getWillValidate ::
                (MonadIO m, HTMLObjectElementClass self) => self -> m Bool
getWillValidate self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_html_object_element_get_will_validate #}
            (toHTMLObjectElement self)))
 
getValidity ::
            (MonadIO m, HTMLObjectElementClass self) =>
              self -> m (Maybe ValidityState)
getValidity self
  = liftIO
      (maybeNull (makeNewGObject mkValidityState)
         ({# call webkit_dom_html_object_element_get_validity #}
            (toHTMLObjectElement self)))
 
getValidationMessage ::
                     (MonadIO m, HTMLObjectElementClass self, GlibString string) =>
                       self -> m string
getValidationMessage self
  = liftIO
      (({# call webkit_dom_html_object_element_get_validation_message #}
          (toHTMLObjectElement self))
         >>=
         readUTFString)
 
getContentDocument ::
                   (MonadIO m, HTMLObjectElementClass self) =>
                     self -> m (Maybe Document)
getContentDocument self
  = liftIO
      (maybeNull (makeNewGObject mkDocument)
         ({# call webkit_dom_html_object_element_get_content_document #}
            (toHTMLObjectElement self)))
