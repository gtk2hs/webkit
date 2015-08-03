module Graphics.UI.Gtk.WebKit.DOM.HTMLInputElement(
stepUp,
stepDown,
checkValidity,
setCustomValidity,
select,
setRangeText4,
setValueForUser,
setAccept,
getAccept,
setAlt,
getAlt,
setAutocomplete,
getAutocomplete,
setAutofocus,
getAutofocus,
setDefaultChecked,
getDefaultChecked,
setChecked,
getChecked,
setDirName,
getDirName,
setDisabled,
getDisabled,
getForm,
setFiles,
getFiles,
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
setHeight,
getHeight,
setIndeterminate,
getIndeterminate,
getList,
setMax,
getMax,
setMaxLength,
getMaxLength,
setMin,
getMin,
setMultiple,
getMultiple,
setName,
getName,
setPattern,
getPattern,
setPlaceholder,
getPlaceholder,
setReadOnly,
getReadOnly,
setRequired,
getRequired,
setSize,
getSize,
setSrc,
getSrc,
setStep,
getStep,
setDefaultValue,
getDefaultValue,
setValue,
getValue,
setValueAsNumber,
getValueAsNumber,
setWidth,
getWidth,
getWillValidate,
getValidity,
getValidationMessage,
getLabels,
setAlign,
getAlign,
setUseMap,
getUseMap,
setIncremental,
getIncremental,
#if WEBKIT_CHECK_VERSION(2,4,0)
setAutocorrect,
getAutocorrect,
setAutocapitalize,
getAutocapitalize,
#endif
#if WEBKIT_CHECK_VERSION(2,7,0)
setCapture,
getCapture,
#endif
HTMLInputElement,
castToHTMLInputElement,
gTypeHTMLInputElement,
HTMLInputElementClass,
toHTMLInputElement,
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

 
stepUp ::
       (MonadIO m, HTMLInputElementClass self) => self -> Int -> m ()
stepUp self n
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_html_input_element_step_up #}
             (toHTMLInputElement self)
             (fromIntegral n)
             errorPtr_)
 
stepDown ::
         (MonadIO m, HTMLInputElementClass self) => self -> Int -> m ()
stepDown self n
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_html_input_element_step_down #}
             (toHTMLInputElement self)
             (fromIntegral n)
             errorPtr_)
 
checkValidity ::
              (MonadIO m, HTMLInputElementClass self) => self -> m Bool
checkValidity self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_html_input_element_check_validity #}
            (toHTMLInputElement self)))
 
setCustomValidity ::
                  (MonadIO m, HTMLInputElementClass self, GlibString string) =>
                    self -> (Maybe string) -> m ()
setCustomValidity self error
  = liftIO
      (maybeWith withUTFString error $
         \ errorPtr ->
           {# call webkit_dom_html_input_element_set_custom_validity #}
             (toHTMLInputElement self)
             errorPtr)
 
select :: (MonadIO m, HTMLInputElementClass self) => self -> m ()
select self
  = liftIO
      ({# call webkit_dom_html_input_element_select #}
         (toHTMLInputElement self))
 
setRangeText4 ::
              (MonadIO m, HTMLInputElementClass self, GlibString string) =>
                self -> string -> Word -> Word -> string -> m ()
setRangeText4 self replacement start end selectionMode
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           withUTFString selectionMode $
             \ selectionModePtr ->
               withUTFString replacement $
                 \ replacementPtr ->
                   {# call webkit_dom_html_input_element_set_range_text #}
                     (toHTMLInputElement self)
                     replacementPtr
                 (fromIntegral start)
                 (fromIntegral end)
                 selectionModePtr
             errorPtr_)
 
setValueForUser ::
                (MonadIO m, HTMLInputElementClass self, GlibString string) =>
                  self -> (Maybe string) -> m ()
setValueForUser self value
  = liftIO
      (maybeWith withUTFString value $
         \ valuePtr ->
           {# call webkit_dom_html_input_element_set_value_for_user #}
             (toHTMLInputElement self)
             valuePtr)
 
setAccept ::
          (MonadIO m, HTMLInputElementClass self, GlibString string) =>
            self -> string -> m ()
setAccept self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_input_element_set_accept #}
             (toHTMLInputElement self)
             valPtr)
 
getAccept ::
          (MonadIO m, HTMLInputElementClass self, GlibString string) =>
            self -> m string
getAccept self
  = liftIO
      (({# call webkit_dom_html_input_element_get_accept #}
          (toHTMLInputElement self))
         >>=
         readUTFString)
 
setAlt ::
       (MonadIO m, HTMLInputElementClass self, GlibString string) =>
         self -> string -> m ()
setAlt self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_input_element_set_alt #}
             (toHTMLInputElement self)
             valPtr)
 
getAlt ::
       (MonadIO m, HTMLInputElementClass self, GlibString string) =>
         self -> m string
getAlt self
  = liftIO
      (({# call webkit_dom_html_input_element_get_alt #}
          (toHTMLInputElement self))
         >>=
         readUTFString)
 
setAutocomplete ::
                (MonadIO m, HTMLInputElementClass self, GlibString string) =>
                  self -> string -> m ()
setAutocomplete self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_input_element_set_autocomplete #}
             (toHTMLInputElement self)
             valPtr)
 
getAutocomplete ::
                (MonadIO m, HTMLInputElementClass self, GlibString string) =>
                  self -> m string
getAutocomplete self
  = liftIO
      (({# call webkit_dom_html_input_element_get_autocomplete #}
          (toHTMLInputElement self))
         >>=
         readUTFString)
 
setAutofocus ::
             (MonadIO m, HTMLInputElementClass self) => self -> Bool -> m ()
setAutofocus self val
  = liftIO
      ({# call webkit_dom_html_input_element_set_autofocus #}
         (toHTMLInputElement self)
         (fromBool val))
 
getAutofocus ::
             (MonadIO m, HTMLInputElementClass self) => self -> m Bool
getAutofocus self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_html_input_element_get_autofocus #}
            (toHTMLInputElement self)))
 
setDefaultChecked ::
                  (MonadIO m, HTMLInputElementClass self) => self -> Bool -> m ()
setDefaultChecked self val
  = liftIO
      ({# call webkit_dom_html_input_element_set_default_checked #}
         (toHTMLInputElement self)
         (fromBool val))
 
getDefaultChecked ::
                  (MonadIO m, HTMLInputElementClass self) => self -> m Bool
getDefaultChecked self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_html_input_element_get_default_checked #}
            (toHTMLInputElement self)))
 
setChecked ::
           (MonadIO m, HTMLInputElementClass self) => self -> Bool -> m ()
setChecked self val
  = liftIO
      ({# call webkit_dom_html_input_element_set_checked #}
         (toHTMLInputElement self)
         (fromBool val))
 
getChecked ::
           (MonadIO m, HTMLInputElementClass self) => self -> m Bool
getChecked self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_html_input_element_get_checked #}
            (toHTMLInputElement self)))
 
setDirName ::
           (MonadIO m, HTMLInputElementClass self, GlibString string) =>
             self -> string -> m ()
setDirName self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_input_element_set_dir_name #}
             (toHTMLInputElement self)
             valPtr)
 
getDirName ::
           (MonadIO m, HTMLInputElementClass self, GlibString string) =>
             self -> m string
getDirName self
  = liftIO
      (({# call webkit_dom_html_input_element_get_dir_name #}
          (toHTMLInputElement self))
         >>=
         readUTFString)
 
setDisabled ::
            (MonadIO m, HTMLInputElementClass self) => self -> Bool -> m ()
setDisabled self val
  = liftIO
      ({# call webkit_dom_html_input_element_set_disabled #}
         (toHTMLInputElement self)
         (fromBool val))
 
getDisabled ::
            (MonadIO m, HTMLInputElementClass self) => self -> m Bool
getDisabled self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_html_input_element_get_disabled #}
            (toHTMLInputElement self)))
 
getForm ::
        (MonadIO m, HTMLInputElementClass self) =>
          self -> m (Maybe HTMLFormElement)
getForm self
  = liftIO
      (maybeNull (makeNewGObject mkHTMLFormElement)
         ({# call webkit_dom_html_input_element_get_form #}
            (toHTMLInputElement self)))
 
setFiles ::
         (MonadIO m, FileListClass val, HTMLInputElementClass self) =>
           self -> Maybe val -> m ()
setFiles self val
  = liftIO
      ({# call webkit_dom_html_input_element_set_files #}
         (toHTMLInputElement self)
         (maybe (FileList nullForeignPtr) toFileList val))
 
getFiles ::
         (MonadIO m, HTMLInputElementClass self) =>
           self -> m (Maybe FileList)
getFiles self
  = liftIO
      (maybeNull (makeNewGObject mkFileList)
         ({# call webkit_dom_html_input_element_get_files #}
            (toHTMLInputElement self)))
 
setFormAction ::
              (MonadIO m, HTMLInputElementClass self, GlibString string) =>
                self -> string -> m ()
setFormAction self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_input_element_set_form_action #}
             (toHTMLInputElement self)
             valPtr)
 
getFormAction ::
              (MonadIO m, HTMLInputElementClass self, GlibString string) =>
                self -> m string
getFormAction self
  = liftIO
      (({# call webkit_dom_html_input_element_get_form_action #}
          (toHTMLInputElement self))
         >>=
         readUTFString)
 
setFormEnctype ::
               (MonadIO m, HTMLInputElementClass self, GlibString string) =>
                 self -> (Maybe string) -> m ()
setFormEnctype self val
  = liftIO
      (maybeWith withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_input_element_set_form_enctype #}
             (toHTMLInputElement self)
             valPtr)
 
getFormEnctype ::
               (MonadIO m, HTMLInputElementClass self, GlibString string) =>
                 self -> m (Maybe string)
getFormEnctype self
  = liftIO
      (({# call webkit_dom_html_input_element_get_form_enctype #}
          (toHTMLInputElement self))
         >>=
         maybePeek readUTFString)
 
setFormMethod ::
              (MonadIO m, HTMLInputElementClass self, GlibString string) =>
                self -> (Maybe string) -> m ()
setFormMethod self val
  = liftIO
      (maybeWith withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_input_element_set_form_method #}
             (toHTMLInputElement self)
             valPtr)
 
getFormMethod ::
              (MonadIO m, HTMLInputElementClass self, GlibString string) =>
                self -> m (Maybe string)
getFormMethod self
  = liftIO
      (({# call webkit_dom_html_input_element_get_form_method #}
          (toHTMLInputElement self))
         >>=
         maybePeek readUTFString)
 
setFormNoValidate ::
                  (MonadIO m, HTMLInputElementClass self) => self -> Bool -> m ()
setFormNoValidate self val
  = liftIO
      ({# call webkit_dom_html_input_element_set_form_no_validate #}
         (toHTMLInputElement self)
         (fromBool val))
 
getFormNoValidate ::
                  (MonadIO m, HTMLInputElementClass self) => self -> m Bool
getFormNoValidate self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_html_input_element_get_form_no_validate #}
            (toHTMLInputElement self)))
 
setFormTarget ::
              (MonadIO m, HTMLInputElementClass self, GlibString string) =>
                self -> string -> m ()
setFormTarget self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_input_element_set_form_target #}
             (toHTMLInputElement self)
             valPtr)
 
getFormTarget ::
              (MonadIO m, HTMLInputElementClass self, GlibString string) =>
                self -> m string
getFormTarget self
  = liftIO
      (({# call webkit_dom_html_input_element_get_form_target #}
          (toHTMLInputElement self))
         >>=
         readUTFString)
 
setHeight ::
          (MonadIO m, HTMLInputElementClass self) => self -> Word -> m ()
setHeight self val
  = liftIO
      ({# call webkit_dom_html_input_element_set_height #}
         (toHTMLInputElement self)
         (fromIntegral val))
 
getHeight ::
          (MonadIO m, HTMLInputElementClass self) => self -> m Word
getHeight self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_html_input_element_get_height #}
            (toHTMLInputElement self)))
 
setIndeterminate ::
                 (MonadIO m, HTMLInputElementClass self) => self -> Bool -> m ()
setIndeterminate self val
  = liftIO
      ({# call webkit_dom_html_input_element_set_indeterminate #}
         (toHTMLInputElement self)
         (fromBool val))
 
getIndeterminate ::
                 (MonadIO m, HTMLInputElementClass self) => self -> m Bool
getIndeterminate self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_html_input_element_get_indeterminate #}
            (toHTMLInputElement self)))
 
getList ::
        (MonadIO m, HTMLInputElementClass self) =>
          self -> m (Maybe HTMLElement)
getList self
  = liftIO
      (maybeNull (makeNewGObject mkHTMLElement)
         ({# call webkit_dom_html_input_element_get_list #}
            (toHTMLInputElement self)))
 
setMax ::
       (MonadIO m, HTMLInputElementClass self, GlibString string) =>
         self -> string -> m ()
setMax self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_input_element_set_max #}
             (toHTMLInputElement self)
             valPtr)
 
getMax ::
       (MonadIO m, HTMLInputElementClass self, GlibString string) =>
         self -> m string
getMax self
  = liftIO
      (({# call webkit_dom_html_input_element_get_max #}
          (toHTMLInputElement self))
         >>=
         readUTFString)
 
setMaxLength ::
             (MonadIO m, HTMLInputElementClass self) => self -> Int -> m ()
setMaxLength self val
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_html_input_element_set_max_length #}
             (toHTMLInputElement self)
             (fromIntegral val)
             errorPtr_)
 
getMaxLength ::
             (MonadIO m, HTMLInputElementClass self) => self -> m Int
getMaxLength self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_html_input_element_get_max_length #}
            (toHTMLInputElement self)))
 
setMin ::
       (MonadIO m, HTMLInputElementClass self, GlibString string) =>
         self -> string -> m ()
setMin self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_input_element_set_min #}
             (toHTMLInputElement self)
             valPtr)
 
getMin ::
       (MonadIO m, HTMLInputElementClass self, GlibString string) =>
         self -> m string
getMin self
  = liftIO
      (({# call webkit_dom_html_input_element_get_min #}
          (toHTMLInputElement self))
         >>=
         readUTFString)
 
setMultiple ::
            (MonadIO m, HTMLInputElementClass self) => self -> Bool -> m ()
setMultiple self val
  = liftIO
      ({# call webkit_dom_html_input_element_set_multiple #}
         (toHTMLInputElement self)
         (fromBool val))
 
getMultiple ::
            (MonadIO m, HTMLInputElementClass self) => self -> m Bool
getMultiple self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_html_input_element_get_multiple #}
            (toHTMLInputElement self)))
 
setName ::
        (MonadIO m, HTMLInputElementClass self, GlibString string) =>
          self -> string -> m ()
setName self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_input_element_set_name #}
             (toHTMLInputElement self)
             valPtr)
 
getName ::
        (MonadIO m, HTMLInputElementClass self, GlibString string) =>
          self -> m string
getName self
  = liftIO
      (({# call webkit_dom_html_input_element_get_name #}
          (toHTMLInputElement self))
         >>=
         readUTFString)
 
setPattern ::
           (MonadIO m, HTMLInputElementClass self, GlibString string) =>
             self -> string -> m ()
setPattern self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_input_element_set_pattern #}
             (toHTMLInputElement self)
             valPtr)
 
getPattern ::
           (MonadIO m, HTMLInputElementClass self, GlibString string) =>
             self -> m string
getPattern self
  = liftIO
      (({# call webkit_dom_html_input_element_get_pattern #}
          (toHTMLInputElement self))
         >>=
         readUTFString)
 
setPlaceholder ::
               (MonadIO m, HTMLInputElementClass self, GlibString string) =>
                 self -> string -> m ()
setPlaceholder self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_input_element_set_placeholder #}
             (toHTMLInputElement self)
             valPtr)
 
getPlaceholder ::
               (MonadIO m, HTMLInputElementClass self, GlibString string) =>
                 self -> m string
getPlaceholder self
  = liftIO
      (({# call webkit_dom_html_input_element_get_placeholder #}
          (toHTMLInputElement self))
         >>=
         readUTFString)
 
setReadOnly ::
            (MonadIO m, HTMLInputElementClass self) => self -> Bool -> m ()
setReadOnly self val
  = liftIO
      ({# call webkit_dom_html_input_element_set_read_only #}
         (toHTMLInputElement self)
         (fromBool val))
 
getReadOnly ::
            (MonadIO m, HTMLInputElementClass self) => self -> m Bool
getReadOnly self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_html_input_element_get_read_only #}
            (toHTMLInputElement self)))
 
setRequired ::
            (MonadIO m, HTMLInputElementClass self) => self -> Bool -> m ()
setRequired self val
  = liftIO
      ({# call webkit_dom_html_input_element_set_required #}
         (toHTMLInputElement self)
         (fromBool val))
 
getRequired ::
            (MonadIO m, HTMLInputElementClass self) => self -> m Bool
getRequired self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_html_input_element_get_required #}
            (toHTMLInputElement self)))
 
setSize ::
        (MonadIO m, HTMLInputElementClass self) => self -> Word -> m ()
setSize self val
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_html_input_element_set_size #}
             (toHTMLInputElement self)
             (fromIntegral val)
             errorPtr_)
 
getSize ::
        (MonadIO m, HTMLInputElementClass self) => self -> m Word
getSize self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_html_input_element_get_size #}
            (toHTMLInputElement self)))
 
setSrc ::
       (MonadIO m, HTMLInputElementClass self, GlibString string) =>
         self -> string -> m ()
setSrc self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_input_element_set_src #}
             (toHTMLInputElement self)
             valPtr)
 
getSrc ::
       (MonadIO m, HTMLInputElementClass self, GlibString string) =>
         self -> m string
getSrc self
  = liftIO
      (({# call webkit_dom_html_input_element_get_src #}
          (toHTMLInputElement self))
         >>=
         readUTFString)
 
setStep ::
        (MonadIO m, HTMLInputElementClass self, GlibString string) =>
          self -> string -> m ()
setStep self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_input_element_set_step #}
             (toHTMLInputElement self)
             valPtr)
 
getStep ::
        (MonadIO m, HTMLInputElementClass self, GlibString string) =>
          self -> m string
getStep self
  = liftIO
      (({# call webkit_dom_html_input_element_get_step #}
          (toHTMLInputElement self))
         >>=
         readUTFString)
 
setDefaultValue ::
                (MonadIO m, HTMLInputElementClass self, GlibString string) =>
                  self -> (Maybe string) -> m ()
setDefaultValue self val
  = liftIO
      (maybeWith withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_input_element_set_default_value #}
             (toHTMLInputElement self)
             valPtr)
 
getDefaultValue ::
                (MonadIO m, HTMLInputElementClass self, GlibString string) =>
                  self -> m (Maybe string)
getDefaultValue self
  = liftIO
      (({# call webkit_dom_html_input_element_get_default_value #}
          (toHTMLInputElement self))
         >>=
         maybePeek readUTFString)
 
setValue ::
         (MonadIO m, HTMLInputElementClass self, GlibString string) =>
           self -> (Maybe string) -> m ()
setValue self val
  = liftIO
      (maybeWith withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_input_element_set_value #}
             (toHTMLInputElement self)
             valPtr)
 
getValue ::
         (MonadIO m, HTMLInputElementClass self, GlibString string) =>
           self -> m (Maybe string)
getValue self
  = liftIO
      (({# call webkit_dom_html_input_element_get_value #}
          (toHTMLInputElement self))
         >>=
         maybePeek readUTFString)
 
setValueAsNumber ::
                 (MonadIO m, HTMLInputElementClass self) => self -> Double -> m ()
setValueAsNumber self val
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_html_input_element_set_value_as_number #}
             (toHTMLInputElement self)
             (realToFrac val)
             errorPtr_)
 
getValueAsNumber ::
                 (MonadIO m, HTMLInputElementClass self) => self -> m Double
getValueAsNumber self
  = liftIO
      (realToFrac <$>
         ({# call webkit_dom_html_input_element_get_value_as_number #}
            (toHTMLInputElement self)))
 
setWidth ::
         (MonadIO m, HTMLInputElementClass self) => self -> Word -> m ()
setWidth self val
  = liftIO
      ({# call webkit_dom_html_input_element_set_width #}
         (toHTMLInputElement self)
         (fromIntegral val))
 
getWidth ::
         (MonadIO m, HTMLInputElementClass self) => self -> m Word
getWidth self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_html_input_element_get_width #}
            (toHTMLInputElement self)))
 
getWillValidate ::
                (MonadIO m, HTMLInputElementClass self) => self -> m Bool
getWillValidate self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_html_input_element_get_will_validate #}
            (toHTMLInputElement self)))
 
getValidity ::
            (MonadIO m, HTMLInputElementClass self) =>
              self -> m (Maybe ValidityState)
getValidity self
  = liftIO
      (maybeNull (makeNewGObject mkValidityState)
         ({# call webkit_dom_html_input_element_get_validity #}
            (toHTMLInputElement self)))
 
getValidationMessage ::
                     (MonadIO m, HTMLInputElementClass self, GlibString string) =>
                       self -> m string
getValidationMessage self
  = liftIO
      (({# call webkit_dom_html_input_element_get_validation_message #}
          (toHTMLInputElement self))
         >>=
         readUTFString)
 
getLabels ::
          (MonadIO m, HTMLInputElementClass self) =>
            self -> m (Maybe NodeList)
getLabels self
  = liftIO
      (maybeNull (makeNewGObject mkNodeList)
         ({# call webkit_dom_html_input_element_get_labels #}
            (toHTMLInputElement self)))
 
setAlign ::
         (MonadIO m, HTMLInputElementClass self, GlibString string) =>
           self -> string -> m ()
setAlign self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_input_element_set_align #}
             (toHTMLInputElement self)
             valPtr)
 
getAlign ::
         (MonadIO m, HTMLInputElementClass self, GlibString string) =>
           self -> m string
getAlign self
  = liftIO
      (({# call webkit_dom_html_input_element_get_align #}
          (toHTMLInputElement self))
         >>=
         readUTFString)
 
setUseMap ::
          (MonadIO m, HTMLInputElementClass self, GlibString string) =>
            self -> string -> m ()
setUseMap self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_input_element_set_use_map #}
             (toHTMLInputElement self)
             valPtr)
 
getUseMap ::
          (MonadIO m, HTMLInputElementClass self, GlibString string) =>
            self -> m string
getUseMap self
  = liftIO
      (({# call webkit_dom_html_input_element_get_use_map #}
          (toHTMLInputElement self))
         >>=
         readUTFString)
 
setIncremental ::
               (MonadIO m, HTMLInputElementClass self) => self -> Bool -> m ()
setIncremental self val
  = liftIO
      ({# call webkit_dom_html_input_element_set_incremental #}
         (toHTMLInputElement self)
         (fromBool val))
 
getIncremental ::
               (MonadIO m, HTMLInputElementClass self) => self -> m Bool
getIncremental self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_html_input_element_get_incremental #}
            (toHTMLInputElement self)))

#if WEBKIT_CHECK_VERSION(2,4,0) 
setAutocorrect ::
               (MonadIO m, HTMLInputElementClass self) => self -> Bool -> m ()
setAutocorrect self val
  = liftIO
      ({# call webkit_dom_html_input_element_set_autocorrect #}
         (toHTMLInputElement self)
         (fromBool val))
 
getAutocorrect ::
               (MonadIO m, HTMLInputElementClass self) => self -> m Bool
getAutocorrect self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_html_input_element_get_autocorrect #}
            (toHTMLInputElement self)))
 
setAutocapitalize ::
                  (MonadIO m, HTMLInputElementClass self, GlibString string) =>
                    self -> (Maybe string) -> m ()
setAutocapitalize self val
  = liftIO
      (maybeWith withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_input_element_set_autocapitalize #}
             (toHTMLInputElement self)
             valPtr)
 
getAutocapitalize ::
                  (MonadIO m, HTMLInputElementClass self, GlibString string) =>
                    self -> m (Maybe string)
getAutocapitalize self
  = liftIO
      (({# call webkit_dom_html_input_element_get_autocapitalize #}
          (toHTMLInputElement self))
         >>=
         maybePeek readUTFString)
#endif

#if WEBKIT_CHECK_VERSION(2,7,0) 
setCapture ::
           (MonadIO m, HTMLInputElementClass self) => self -> Bool -> m ()
setCapture self val
  = liftIO
      ({# call webkit_dom_html_input_element_set_capture #}
         (toHTMLInputElement self)
         (fromBool val))
 
getCapture ::
           (MonadIO m, HTMLInputElementClass self) => self -> m Bool
getCapture self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_html_input_element_get_capture #}
            (toHTMLInputElement self)))
#endif
