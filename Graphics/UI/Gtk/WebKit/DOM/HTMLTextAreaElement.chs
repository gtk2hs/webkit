module Graphics.UI.Gtk.WebKit.DOM.HTMLTextAreaElement(
checkValidity,
setCustomValidity,
select,
setRangeText4,
setSelectionRange,
setAutofocus,
getAutofocus,
setCols,
getCols,
setDirName,
getDirName,
setDisabled,
getDisabled,
getForm,
setMaxLength,
getMaxLength,
setName,
getName,
setPlaceholder,
getPlaceholder,
setReadOnly,
getReadOnly,
setRequired,
getRequired,
setRows,
getRows,
setWrap,
getWrap,
setDefaultValue,
getDefaultValue,
setValue,
getValue,
getTextLength,
getWillValidate,
getValidity,
getValidationMessage,
getLabels,
setSelectionStart,
getSelectionStart,
setSelectionEnd,
getSelectionEnd,
setSelectionDirection,
getSelectionDirection,
setAutocorrect,
getAutocorrect,
setAutocapitalize,
getAutocapitalize,
HTMLTextAreaElement,
castToHTMLTextAreaElement,
gTypeHTMLTextAreaElement,
HTMLTextAreaElementClass,
toHTMLTextAreaElement,
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
              (MonadIO m, HTMLTextAreaElementClass self) => self -> m Bool
checkValidity self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_html_text_area_element_check_validity #}
            (toHTMLTextAreaElement self)))
 
setCustomValidity ::
                  (MonadIO m, HTMLTextAreaElementClass self, GlibString string) =>
                    self -> string -> m ()
setCustomValidity self error
  = liftIO
      (withUTFString error $
         \ errorPtr ->
           {# call webkit_dom_html_text_area_element_set_custom_validity #}
             (toHTMLTextAreaElement self)
             errorPtr)
 
select ::
       (MonadIO m, HTMLTextAreaElementClass self) => self -> m ()
select self
  = liftIO
      ({# call webkit_dom_html_text_area_element_select #}
         (toHTMLTextAreaElement self))
 
setRangeText4 ::
              (MonadIO m, HTMLTextAreaElementClass self, GlibString string) =>
                self -> string -> Word -> Word -> string -> m ()
setRangeText4 self replacement start end selectionMode
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           withUTFString selectionMode $
             \ selectionModePtr ->
               withUTFString replacement $
                 \ replacementPtr ->
                   {# call webkit_dom_html_text_area_element_set_range_text #}
                     (toHTMLTextAreaElement self)
                     replacementPtr
                 (fromIntegral start)
                 (fromIntegral end)
                 selectionModePtr
             errorPtr_)
 
setSelectionRange ::
                  (MonadIO m, HTMLTextAreaElementClass self, GlibString string) =>
                    self -> Int -> Int -> string -> m ()
setSelectionRange self start end direction
  = liftIO
      (withUTFString direction $
         \ directionPtr ->
           {# call webkit_dom_html_text_area_element_set_selection_range #}
             (toHTMLTextAreaElement self)
             (fromIntegral start)
             (fromIntegral end)
             directionPtr)
 
setAutofocus ::
             (MonadIO m, HTMLTextAreaElementClass self) => self -> Bool -> m ()
setAutofocus self val
  = liftIO
      ({# call webkit_dom_html_text_area_element_set_autofocus #}
         (toHTMLTextAreaElement self)
         (fromBool val))
 
getAutofocus ::
             (MonadIO m, HTMLTextAreaElementClass self) => self -> m Bool
getAutofocus self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_html_text_area_element_get_autofocus #}
            (toHTMLTextAreaElement self)))
 
setCols ::
        (MonadIO m, HTMLTextAreaElementClass self) => self -> Int -> m ()
setCols self val
  = liftIO
      ({# call webkit_dom_html_text_area_element_set_cols #}
         (toHTMLTextAreaElement self)
         (fromIntegral val))
 
getCols ::
        (MonadIO m, HTMLTextAreaElementClass self) => self -> m Int
getCols self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_html_text_area_element_get_cols #}
            (toHTMLTextAreaElement self)))
 
setDirName ::
           (MonadIO m, HTMLTextAreaElementClass self, GlibString string) =>
             self -> string -> m ()
setDirName self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_text_area_element_set_dir_name #}
             (toHTMLTextAreaElement self)
             valPtr)
 
getDirName ::
           (MonadIO m, HTMLTextAreaElementClass self, GlibString string) =>
             self -> m string
getDirName self
  = liftIO
      (({# call webkit_dom_html_text_area_element_get_dir_name #}
          (toHTMLTextAreaElement self))
         >>=
         readUTFString)
 
setDisabled ::
            (MonadIO m, HTMLTextAreaElementClass self) => self -> Bool -> m ()
setDisabled self val
  = liftIO
      ({# call webkit_dom_html_text_area_element_set_disabled #}
         (toHTMLTextAreaElement self)
         (fromBool val))
 
getDisabled ::
            (MonadIO m, HTMLTextAreaElementClass self) => self -> m Bool
getDisabled self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_html_text_area_element_get_disabled #}
            (toHTMLTextAreaElement self)))
 
getForm ::
        (MonadIO m, HTMLTextAreaElementClass self) =>
          self -> m (Maybe HTMLFormElement)
getForm self
  = liftIO
      (maybeNull (makeNewGObject mkHTMLFormElement)
         ({# call webkit_dom_html_text_area_element_get_form #}
            (toHTMLTextAreaElement self)))
 
setMaxLength ::
             (MonadIO m, HTMLTextAreaElementClass self) => self -> Int -> m ()
setMaxLength self val
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_html_text_area_element_set_max_length #}
             (toHTMLTextAreaElement self)
             (fromIntegral val)
             errorPtr_)
 
getMaxLength ::
             (MonadIO m, HTMLTextAreaElementClass self) => self -> m Int
getMaxLength self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_html_text_area_element_get_max_length #}
            (toHTMLTextAreaElement self)))
 
setName ::
        (MonadIO m, HTMLTextAreaElementClass self, GlibString string) =>
          self -> string -> m ()
setName self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_text_area_element_set_name #}
             (toHTMLTextAreaElement self)
             valPtr)
 
getName ::
        (MonadIO m, HTMLTextAreaElementClass self, GlibString string) =>
          self -> m string
getName self
  = liftIO
      (({# call webkit_dom_html_text_area_element_get_name #}
          (toHTMLTextAreaElement self))
         >>=
         readUTFString)
 
setPlaceholder ::
               (MonadIO m, HTMLTextAreaElementClass self, GlibString string) =>
                 self -> string -> m ()
setPlaceholder self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_text_area_element_set_placeholder #}
             (toHTMLTextAreaElement self)
             valPtr)
 
getPlaceholder ::
               (MonadIO m, HTMLTextAreaElementClass self, GlibString string) =>
                 self -> m string
getPlaceholder self
  = liftIO
      (({# call webkit_dom_html_text_area_element_get_placeholder #}
          (toHTMLTextAreaElement self))
         >>=
         readUTFString)
 
setReadOnly ::
            (MonadIO m, HTMLTextAreaElementClass self) => self -> Bool -> m ()
setReadOnly self val
  = liftIO
      ({# call webkit_dom_html_text_area_element_set_read_only #}
         (toHTMLTextAreaElement self)
         (fromBool val))
 
getReadOnly ::
            (MonadIO m, HTMLTextAreaElementClass self) => self -> m Bool
getReadOnly self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_html_text_area_element_get_read_only #}
            (toHTMLTextAreaElement self)))
 
setRequired ::
            (MonadIO m, HTMLTextAreaElementClass self) => self -> Bool -> m ()
setRequired self val
  = liftIO
      ({# call webkit_dom_html_text_area_element_set_required #}
         (toHTMLTextAreaElement self)
         (fromBool val))
 
getRequired ::
            (MonadIO m, HTMLTextAreaElementClass self) => self -> m Bool
getRequired self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_html_text_area_element_get_required #}
            (toHTMLTextAreaElement self)))
 
setRows ::
        (MonadIO m, HTMLTextAreaElementClass self) => self -> Int -> m ()
setRows self val
  = liftIO
      ({# call webkit_dom_html_text_area_element_set_rows #}
         (toHTMLTextAreaElement self)
         (fromIntegral val))
 
getRows ::
        (MonadIO m, HTMLTextAreaElementClass self) => self -> m Int
getRows self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_html_text_area_element_get_rows #}
            (toHTMLTextAreaElement self)))
 
setWrap ::
        (MonadIO m, HTMLTextAreaElementClass self, GlibString string) =>
          self -> string -> m ()
setWrap self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_text_area_element_set_wrap #}
             (toHTMLTextAreaElement self)
             valPtr)
 
getWrap ::
        (MonadIO m, HTMLTextAreaElementClass self, GlibString string) =>
          self -> m string
getWrap self
  = liftIO
      (({# call webkit_dom_html_text_area_element_get_wrap #}
          (toHTMLTextAreaElement self))
         >>=
         readUTFString)
 
setDefaultValue ::
                (MonadIO m, HTMLTextAreaElementClass self, GlibString string) =>
                  self -> string -> m ()
setDefaultValue self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_text_area_element_set_default_value #}
             (toHTMLTextAreaElement self)
             valPtr)
 
getDefaultValue ::
                (MonadIO m, HTMLTextAreaElementClass self, GlibString string) =>
                  self -> m string
getDefaultValue self
  = liftIO
      (({# call webkit_dom_html_text_area_element_get_default_value #}
          (toHTMLTextAreaElement self))
         >>=
         readUTFString)
 
setValue ::
         (MonadIO m, HTMLTextAreaElementClass self, GlibString string) =>
           self -> string -> m ()
setValue self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_text_area_element_set_value #}
             (toHTMLTextAreaElement self)
             valPtr)
 
getValue ::
         (MonadIO m, HTMLTextAreaElementClass self, GlibString string) =>
           self -> m string
getValue self
  = liftIO
      (({# call webkit_dom_html_text_area_element_get_value #}
          (toHTMLTextAreaElement self))
         >>=
         readUTFString)
 
getTextLength ::
              (MonadIO m, HTMLTextAreaElementClass self) => self -> m Word
getTextLength self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_html_text_area_element_get_text_length #}
            (toHTMLTextAreaElement self)))
 
getWillValidate ::
                (MonadIO m, HTMLTextAreaElementClass self) => self -> m Bool
getWillValidate self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_html_text_area_element_get_will_validate #}
            (toHTMLTextAreaElement self)))
 
getValidity ::
            (MonadIO m, HTMLTextAreaElementClass self) =>
              self -> m (Maybe ValidityState)
getValidity self
  = liftIO
      (maybeNull (makeNewGObject mkValidityState)
         ({# call webkit_dom_html_text_area_element_get_validity #}
            (toHTMLTextAreaElement self)))
 
getValidationMessage ::
                     (MonadIO m, HTMLTextAreaElementClass self, GlibString string) =>
                       self -> m string
getValidationMessage self
  = liftIO
      (({# call webkit_dom_html_text_area_element_get_validation_message
          #}
          (toHTMLTextAreaElement self))
         >>=
         readUTFString)
 
getLabels ::
          (MonadIO m, HTMLTextAreaElementClass self) =>
            self -> m (Maybe NodeList)
getLabels self
  = liftIO
      (maybeNull (makeNewGObject mkNodeList)
         ({# call webkit_dom_html_text_area_element_get_labels #}
            (toHTMLTextAreaElement self)))
 
setSelectionStart ::
                  (MonadIO m, HTMLTextAreaElementClass self) => self -> Int -> m ()
setSelectionStart self val
  = liftIO
      ({# call webkit_dom_html_text_area_element_set_selection_start #}
         (toHTMLTextAreaElement self)
         (fromIntegral val))
 
getSelectionStart ::
                  (MonadIO m, HTMLTextAreaElementClass self) => self -> m Int
getSelectionStart self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_html_text_area_element_get_selection_start #}
            (toHTMLTextAreaElement self)))
 
setSelectionEnd ::
                (MonadIO m, HTMLTextAreaElementClass self) => self -> Int -> m ()
setSelectionEnd self val
  = liftIO
      ({# call webkit_dom_html_text_area_element_set_selection_end #}
         (toHTMLTextAreaElement self)
         (fromIntegral val))
 
getSelectionEnd ::
                (MonadIO m, HTMLTextAreaElementClass self) => self -> m Int
getSelectionEnd self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_html_text_area_element_get_selection_end #}
            (toHTMLTextAreaElement self)))
 
setSelectionDirection ::
                      (MonadIO m, HTMLTextAreaElementClass self, GlibString string) =>
                        self -> string -> m ()
setSelectionDirection self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_text_area_element_set_selection_direction
             #}
             (toHTMLTextAreaElement self)
             valPtr)
 
getSelectionDirection ::
                      (MonadIO m, HTMLTextAreaElementClass self, GlibString string) =>
                        self -> m string
getSelectionDirection self
  = liftIO
      (({# call webkit_dom_html_text_area_element_get_selection_direction
          #}
          (toHTMLTextAreaElement self))
         >>=
         readUTFString)
 
setAutocorrect ::
               (MonadIO m, HTMLTextAreaElementClass self) => self -> Bool -> m ()
setAutocorrect self val
  = liftIO
      ({# call webkit_dom_html_text_area_element_set_autocorrect #}
         (toHTMLTextAreaElement self)
         (fromBool val))
 
getAutocorrect ::
               (MonadIO m, HTMLTextAreaElementClass self) => self -> m Bool
getAutocorrect self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_html_text_area_element_get_autocorrect #}
            (toHTMLTextAreaElement self)))
 
setAutocapitalize ::
                  (MonadIO m, HTMLTextAreaElementClass self, GlibString string) =>
                    self -> string -> m ()
setAutocapitalize self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_text_area_element_set_autocapitalize #}
             (toHTMLTextAreaElement self)
             valPtr)
 
getAutocapitalize ::
                  (MonadIO m, HTMLTextAreaElementClass self, GlibString string) =>
                    self -> m string
getAutocapitalize self
  = liftIO
      (({# call webkit_dom_html_text_area_element_get_autocapitalize #}
          (toHTMLTextAreaElement self))
         >>=
         readUTFString)
