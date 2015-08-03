module Graphics.UI.Gtk.WebKit.DOM.HTMLFieldSetElement(
checkValidity,
setCustomValidity,
setDisabled,
getDisabled,
getForm,
setName,
getName,
getElements,
getWillValidate,
getValidity,
getValidationMessage,
HTMLFieldSetElement,
castToHTMLFieldSetElement,
gTypeHTMLFieldSetElement,
HTMLFieldSetElementClass,
toHTMLFieldSetElement,
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

 
checkValidity ::
              (MonadIO m, HTMLFieldSetElementClass self) => self -> m Bool
checkValidity self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_html_field_set_element_check_validity #}
            (toHTMLFieldSetElement self)))
 
setCustomValidity ::
                  (MonadIO m, HTMLFieldSetElementClass self, GlibString string) =>
                    self -> (Maybe string) -> m ()
setCustomValidity self error
  = liftIO
      (maybeWith withUTFString error $
         \ errorPtr ->
           {# call webkit_dom_html_field_set_element_set_custom_validity #}
             (toHTMLFieldSetElement self)
             errorPtr)
 
setDisabled ::
            (MonadIO m, HTMLFieldSetElementClass self) => self -> Bool -> m ()
setDisabled self val
  = liftIO
      ({# call webkit_dom_html_field_set_element_set_disabled #}
         (toHTMLFieldSetElement self)
         (fromBool val))
 
getDisabled ::
            (MonadIO m, HTMLFieldSetElementClass self) => self -> m Bool
getDisabled self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_html_field_set_element_get_disabled #}
            (toHTMLFieldSetElement self)))
 
getForm ::
        (MonadIO m, HTMLFieldSetElementClass self) =>
          self -> m (Maybe HTMLFormElement)
getForm self
  = liftIO
      (maybeNull (makeNewGObject mkHTMLFormElement)
         ({# call webkit_dom_html_field_set_element_get_form #}
            (toHTMLFieldSetElement self)))
 
setName ::
        (MonadIO m, HTMLFieldSetElementClass self, GlibString string) =>
          self -> string -> m ()
setName self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_field_set_element_set_name #}
             (toHTMLFieldSetElement self)
             valPtr)
 
getName ::
        (MonadIO m, HTMLFieldSetElementClass self, GlibString string) =>
          self -> m string
getName self
  = liftIO
      (({# call webkit_dom_html_field_set_element_get_name #}
          (toHTMLFieldSetElement self))
         >>=
         readUTFString)
 
getElements ::
            (MonadIO m, HTMLFieldSetElementClass self) =>
              self -> m (Maybe HTMLCollection)
getElements self
  = liftIO
      (maybeNull (makeNewGObject mkHTMLCollection)
         ({# call webkit_dom_html_field_set_element_get_elements #}
            (toHTMLFieldSetElement self)))
 
getWillValidate ::
                (MonadIO m, HTMLFieldSetElementClass self) => self -> m Bool
getWillValidate self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_html_field_set_element_get_will_validate #}
            (toHTMLFieldSetElement self)))
 
getValidity ::
            (MonadIO m, HTMLFieldSetElementClass self) =>
              self -> m (Maybe ValidityState)
getValidity self
  = liftIO
      (maybeNull (makeNewGObject mkValidityState)
         ({# call webkit_dom_html_field_set_element_get_validity #}
            (toHTMLFieldSetElement self)))
 
getValidationMessage ::
                     (MonadIO m, HTMLFieldSetElementClass self, GlibString string) =>
                       self -> m string
getValidationMessage self
  = liftIO
      (({# call webkit_dom_html_field_set_element_get_validation_message
          #}
          (toHTMLFieldSetElement self))
         >>=
         readUTFString)
