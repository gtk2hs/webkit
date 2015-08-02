module Graphics.UI.Gtk.WebKit.DOM.HTMLButtonElement(
checkValidity,
setCustomValidity,
setAutofocus,
getAutofocus,
setDisabled,
getDisabled,
getForm,
setFormAction,
getFormAction,
setFormEnctype,
getFormEnctype,
setFormMethod,
getFormMethod,
setFormNoValidate,
getFormNoValidate,
setFormTarget,
getFormTarget,
setName,
getName,
setValue,
getValue,
getWillValidate,
getValidity,
getValidationMessage,
getLabels,
HTMLButtonElement,
castToHTMLButtonElement,
gTypeHTMLButtonElement,
HTMLButtonElementClass,
toHTMLButtonElement,
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

 
checkValidity ::
              (MonadIO m, HTMLButtonElementClass self) => self -> m Bool
checkValidity self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_html_button_element_check_validity #}
            (toHTMLButtonElement self)))
 
setCustomValidity ::
                  (MonadIO m, HTMLButtonElementClass self, GlibString string) =>
                    self -> (Maybe string) -> m ()
setCustomValidity self error
  = liftIO
      (maybeWith withUTFString error $
         \ errorPtr ->
           {# call webkit_dom_html_button_element_set_custom_validity #}
             (toHTMLButtonElement self)
             errorPtr)
 
setAutofocus ::
             (MonadIO m, HTMLButtonElementClass self) => self -> Bool -> m ()
setAutofocus self val
  = liftIO
      ({# call webkit_dom_html_button_element_set_autofocus #}
         (toHTMLButtonElement self)
         (fromBool val))
 
getAutofocus ::
             (MonadIO m, HTMLButtonElementClass self) => self -> m Bool
getAutofocus self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_html_button_element_get_autofocus #}
            (toHTMLButtonElement self)))
 
setDisabled ::
            (MonadIO m, HTMLButtonElementClass self) => self -> Bool -> m ()
setDisabled self val
  = liftIO
      ({# call webkit_dom_html_button_element_set_disabled #}
         (toHTMLButtonElement self)
         (fromBool val))
 
getDisabled ::
            (MonadIO m, HTMLButtonElementClass self) => self -> m Bool
getDisabled self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_html_button_element_get_disabled #}
            (toHTMLButtonElement self)))
 
getForm ::
        (MonadIO m, HTMLButtonElementClass self) =>
          self -> m (Maybe HTMLFormElement)
getForm self
  = liftIO
      (maybeNull (makeNewGObject mkHTMLFormElement)
         ({# call webkit_dom_html_button_element_get_form #}
            (toHTMLButtonElement self)))
 
setFormAction ::
              (MonadIO m, HTMLButtonElementClass self, GlibString string) =>
                self -> string -> m ()
setFormAction self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_button_element_set_form_action #}
             (toHTMLButtonElement self)
             valPtr)
 
getFormAction ::
              (MonadIO m, HTMLButtonElementClass self, GlibString string) =>
                self -> m string
getFormAction self
  = liftIO
      (({# call webkit_dom_html_button_element_get_form_action #}
          (toHTMLButtonElement self))
         >>=
         readUTFString)
 
setFormEnctype ::
               (MonadIO m, HTMLButtonElementClass self, GlibString string) =>
                 self -> (Maybe string) -> m ()
setFormEnctype self val
  = liftIO
      (maybeWith withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_button_element_set_form_enctype #}
             (toHTMLButtonElement self)
             valPtr)
 
getFormEnctype ::
               (MonadIO m, HTMLButtonElementClass self, GlibString string) =>
                 self -> m (Maybe string)
getFormEnctype self
  = liftIO
      (({# call webkit_dom_html_button_element_get_form_enctype #}
          (toHTMLButtonElement self))
         >>=
         maybePeek readUTFString)
 
setFormMethod ::
              (MonadIO m, HTMLButtonElementClass self, GlibString string) =>
                self -> (Maybe string) -> m ()
setFormMethod self val
  = liftIO
      (maybeWith withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_button_element_set_form_method #}
             (toHTMLButtonElement self)
             valPtr)
 
getFormMethod ::
              (MonadIO m, HTMLButtonElementClass self, GlibString string) =>
                self -> m (Maybe string)
getFormMethod self
  = liftIO
      (({# call webkit_dom_html_button_element_get_form_method #}
          (toHTMLButtonElement self))
         >>=
         maybePeek readUTFString)
 
setFormNoValidate ::
                  (MonadIO m, HTMLButtonElementClass self) => self -> Bool -> m ()
setFormNoValidate self val
  = liftIO
      ({# call webkit_dom_html_button_element_set_form_no_validate #}
         (toHTMLButtonElement self)
         (fromBool val))
 
getFormNoValidate ::
                  (MonadIO m, HTMLButtonElementClass self) => self -> m Bool
getFormNoValidate self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_html_button_element_get_form_no_validate #}
            (toHTMLButtonElement self)))
 
setFormTarget ::
              (MonadIO m, HTMLButtonElementClass self, GlibString string) =>
                self -> string -> m ()
setFormTarget self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_button_element_set_form_target #}
             (toHTMLButtonElement self)
             valPtr)
 
getFormTarget ::
              (MonadIO m, HTMLButtonElementClass self, GlibString string) =>
                self -> m string
getFormTarget self
  = liftIO
      (({# call webkit_dom_html_button_element_get_form_target #}
          (toHTMLButtonElement self))
         >>=
         readUTFString)
 
setName ::
        (MonadIO m, HTMLButtonElementClass self, GlibString string) =>
          self -> string -> m ()
setName self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_button_element_set_name #}
             (toHTMLButtonElement self)
             valPtr)
 
getName ::
        (MonadIO m, HTMLButtonElementClass self, GlibString string) =>
          self -> m string
getName self
  = liftIO
      (({# call webkit_dom_html_button_element_get_name #}
          (toHTMLButtonElement self))
         >>=
         readUTFString)
 
setValue ::
         (MonadIO m, HTMLButtonElementClass self, GlibString string) =>
           self -> string -> m ()
setValue self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_button_element_set_value #}
             (toHTMLButtonElement self)
             valPtr)
 
getValue ::
         (MonadIO m, HTMLButtonElementClass self, GlibString string) =>
           self -> m string
getValue self
  = liftIO
      (({# call webkit_dom_html_button_element_get_value #}
          (toHTMLButtonElement self))
         >>=
         readUTFString)
 
getWillValidate ::
                (MonadIO m, HTMLButtonElementClass self) => self -> m Bool
getWillValidate self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_html_button_element_get_will_validate #}
            (toHTMLButtonElement self)))
 
getValidity ::
            (MonadIO m, HTMLButtonElementClass self) =>
              self -> m (Maybe ValidityState)
getValidity self
  = liftIO
      (maybeNull (makeNewGObject mkValidityState)
         ({# call webkit_dom_html_button_element_get_validity #}
            (toHTMLButtonElement self)))
 
getValidationMessage ::
                     (MonadIO m, HTMLButtonElementClass self, GlibString string) =>
                       self -> m string
getValidationMessage self
  = liftIO
      (({# call webkit_dom_html_button_element_get_validation_message #}
          (toHTMLButtonElement self))
         >>=
         readUTFString)
 
getLabels ::
          (MonadIO m, HTMLButtonElementClass self) =>
            self -> m (Maybe NodeList)
getLabels self
  = liftIO
      (maybeNull (makeNewGObject mkNodeList)
         ({# call webkit_dom_html_button_element_get_labels #}
            (toHTMLButtonElement self)))
