module Graphics.UI.Gtk.WebKit.DOM.HTMLInputElement
       (htmlInputElementStepUp, htmlInputElementStepDown,
        htmlInputElementCheckValidity, htmlInputElementSetCustomValidity,
        htmlInputElementSelect,
#if WEBKIT_CHECK_VERSION(2,2,2)
        htmlInputElementSetRangeText,
#endif
        htmlInputElementSetValueForUser,
        htmlInputElementSetAccept, htmlInputElementGetAccept,
        htmlInputElementSetAlt, htmlInputElementGetAlt,
        htmlInputElementSetAutocomplete, htmlInputElementGetAutocomplete,
        htmlInputElementSetAutofocus, htmlInputElementGetAutofocus,
        htmlInputElementSetDefaultChecked,
        htmlInputElementGetDefaultChecked, htmlInputElementSetChecked,
        htmlInputElementGetChecked, htmlInputElementSetDirName,
        htmlInputElementGetDirName, htmlInputElementSetDisabled,
        htmlInputElementGetDisabled, htmlInputElementGetForm,
#if WEBKIT_CHECK_VERSION(1,10,0)
        htmlInputElementSetFiles,
#endif
        htmlInputElementGetFiles,
        htmlInputElementSetFormAction, htmlInputElementGetFormAction,
        htmlInputElementSetFormEnctype, htmlInputElementGetFormEnctype,
        htmlInputElementSetFormMethod, htmlInputElementGetFormMethod,
        htmlInputElementSetFormNoValidate,
        htmlInputElementGetFormNoValidate, htmlInputElementSetFormTarget,
        htmlInputElementGetFormTarget,
#if WEBKIT_CHECK_VERSION(1,10,0)
        htmlInputElementSetHeight, htmlInputElementGetHeight,
#endif
        htmlInputElementSetIndeterminate,
        htmlInputElementGetIndeterminate, htmlInputElementGetList,
        htmlInputElementSetMax, htmlInputElementGetMax,
        htmlInputElementSetMaxLength, htmlInputElementGetMaxLength,
        htmlInputElementSetMin, htmlInputElementGetMin,
        htmlInputElementSetMultiple, htmlInputElementGetMultiple,
        htmlInputElementSetName, htmlInputElementGetName,
        htmlInputElementSetPattern, htmlInputElementGetPattern,
        htmlInputElementSetPlaceholder, htmlInputElementGetPlaceholder,
        htmlInputElementSetReadOnly, htmlInputElementGetReadOnly,
        htmlInputElementSetRequired, htmlInputElementGetRequired,
        htmlInputElementSetSize, htmlInputElementGetSize,
        htmlInputElementSetSrc, htmlInputElementGetSrc,
        htmlInputElementSetStep, htmlInputElementGetStep,
        htmlInputElementSetDefaultValue, htmlInputElementGetDefaultValue,
        htmlInputElementSetValue, htmlInputElementGetValue,
        htmlInputElementSetValueAsNumber, htmlInputElementGetValueAsNumber,
#if WEBKIT_CHECK_VERSION(1,10,0)
        htmlInputElementSetWidth, htmlInputElementGetWidth,
#endif
        htmlInputElementGetWillValidate, htmlInputElementGetValidity,
        htmlInputElementGetValidationMessage, htmlInputElementGetLabels,
        htmlInputElementSetAlign, htmlInputElementGetAlign,
        htmlInputElementSetWebkitdirectory,
        htmlInputElementGetWebkitdirectory, htmlInputElementSetUseMap,
        htmlInputElementGetUseMap, htmlInputElementSetIncremental,
        htmlInputElementGetIncremental, htmlInputElementSetWebkitSpeech,
        htmlInputElementGetWebkitSpeech, htmlInputElementSetWebkitGrammar,
        htmlInputElementGetWebkitGrammar,
        htmlInputElementOnwebkitspeechchange
#if WEBKIT_CHECK_VERSION(1,10,0)
      , htmlInputElementSetCapture, htmlInputElementGetCapture
#endif
        )
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM

htmlInputElementStepUp ::
                       (HTMLInputElementClass self) => self -> Int -> IO ()
htmlInputElementStepUp self n
  = propagateGError $
      \ errorPtr_ ->
        {# call webkit_dom_html_input_element_step_up #}
          (toHTMLInputElement self)
          (fromIntegral n)
          errorPtr_

htmlInputElementStepDown ::
                         (HTMLInputElementClass self) => self -> Int -> IO ()
htmlInputElementStepDown self n
  = propagateGError $
      \ errorPtr_ ->
        {# call webkit_dom_html_input_element_step_down #}
          (toHTMLInputElement self)
          (fromIntegral n)
          errorPtr_

htmlInputElementCheckValidity ::
                              (HTMLInputElementClass self) => self -> IO Bool
htmlInputElementCheckValidity self
  = toBool <$>
      ({# call webkit_dom_html_input_element_check_validity #}
         (toHTMLInputElement self))

htmlInputElementSetCustomValidity ::
                                  (HTMLInputElementClass self) => self -> String -> IO ()
htmlInputElementSetCustomValidity self error
  = withUTFString error $
      \ errorPtr ->
        {# call webkit_dom_html_input_element_set_custom_validity #}
          (toHTMLInputElement self)
          errorPtr

htmlInputElementSelect ::
                       (HTMLInputElementClass self) => self -> IO ()
htmlInputElementSelect self
  = {# call webkit_dom_html_input_element_select #}
      (toHTMLInputElement self)
 
#if WEBKIT_CHECK_VERSION(2,2,2)
htmlInputElementSetRangeText ::
                             (HTMLInputElementClass self) =>
                               self -> String -> Word -> Word -> String -> IO ()
htmlInputElementSetRangeText self replacement start end
  selectionMode
  = propagateGError $
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
          errorPtr_
#endif

htmlInputElementSetValueForUser ::
                                (HTMLInputElementClass self) => self -> String -> IO ()
htmlInputElementSetValueForUser self value
  = withUTFString value $
      \ valuePtr ->
        {# call webkit_dom_html_input_element_set_value_for_user #}
          (toHTMLInputElement self)
          valuePtr

htmlInputElementSetAccept ::
                          (HTMLInputElementClass self) => self -> String -> IO ()
htmlInputElementSetAccept self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_input_element_set_accept #}
          (toHTMLInputElement self)
          valPtr

htmlInputElementGetAccept ::
                          (HTMLInputElementClass self) => self -> IO String
htmlInputElementGetAccept self
  = ({# call webkit_dom_html_input_element_get_accept #}
       (toHTMLInputElement self))
      >>=
      readUTFString

htmlInputElementSetAlt ::
                       (HTMLInputElementClass self) => self -> String -> IO ()
htmlInputElementSetAlt self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_input_element_set_alt #}
          (toHTMLInputElement self)
          valPtr

htmlInputElementGetAlt ::
                       (HTMLInputElementClass self) => self -> IO String
htmlInputElementGetAlt self
  = ({# call webkit_dom_html_input_element_get_alt #}
       (toHTMLInputElement self))
      >>=
      readUTFString

htmlInputElementSetAutocomplete ::
                                (HTMLInputElementClass self) => self -> String -> IO ()
htmlInputElementSetAutocomplete self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_input_element_set_autocomplete #}
          (toHTMLInputElement self)
          valPtr

htmlInputElementGetAutocomplete ::
                                (HTMLInputElementClass self) => self -> IO String
htmlInputElementGetAutocomplete self
  = ({# call webkit_dom_html_input_element_get_autocomplete #}
       (toHTMLInputElement self))
      >>=
      readUTFString

htmlInputElementSetAutofocus ::
                             (HTMLInputElementClass self) => self -> Bool -> IO ()
htmlInputElementSetAutofocus self val
  = {# call webkit_dom_html_input_element_set_autofocus #}
      (toHTMLInputElement self)
      (fromBool val)

htmlInputElementGetAutofocus ::
                             (HTMLInputElementClass self) => self -> IO Bool
htmlInputElementGetAutofocus self
  = toBool <$>
      ({# call webkit_dom_html_input_element_get_autofocus #}
         (toHTMLInputElement self))

htmlInputElementSetDefaultChecked ::
                                  (HTMLInputElementClass self) => self -> Bool -> IO ()
htmlInputElementSetDefaultChecked self val
  = {# call webkit_dom_html_input_element_set_default_checked #}
      (toHTMLInputElement self)
      (fromBool val)

htmlInputElementGetDefaultChecked ::
                                  (HTMLInputElementClass self) => self -> IO Bool
htmlInputElementGetDefaultChecked self
  = toBool <$>
      ({# call webkit_dom_html_input_element_get_default_checked #}
         (toHTMLInputElement self))

htmlInputElementSetChecked ::
                           (HTMLInputElementClass self) => self -> Bool -> IO ()
htmlInputElementSetChecked self val
  = {# call webkit_dom_html_input_element_set_checked #}
      (toHTMLInputElement self)
      (fromBool val)

htmlInputElementGetChecked ::
                           (HTMLInputElementClass self) => self -> IO Bool
htmlInputElementGetChecked self
  = toBool <$>
      ({# call webkit_dom_html_input_element_get_checked #}
         (toHTMLInputElement self))

htmlInputElementSetDirName ::
                           (HTMLInputElementClass self) => self -> String -> IO ()
htmlInputElementSetDirName self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_input_element_set_dir_name #}
          (toHTMLInputElement self)
          valPtr

htmlInputElementGetDirName ::
                           (HTMLInputElementClass self) => self -> IO String
htmlInputElementGetDirName self
  = ({# call webkit_dom_html_input_element_get_dir_name #}
       (toHTMLInputElement self))
      >>=
      readUTFString

htmlInputElementSetDisabled ::
                            (HTMLInputElementClass self) => self -> Bool -> IO ()
htmlInputElementSetDisabled self val
  = {# call webkit_dom_html_input_element_set_disabled #}
      (toHTMLInputElement self)
      (fromBool val)

htmlInputElementGetDisabled ::
                            (HTMLInputElementClass self) => self -> IO Bool
htmlInputElementGetDisabled self
  = toBool <$>
      ({# call webkit_dom_html_input_element_get_disabled #}
         (toHTMLInputElement self))

htmlInputElementGetForm ::
                        (HTMLInputElementClass self) => self -> IO (Maybe HTMLFormElement)
htmlInputElementGetForm self
  = maybeNull (makeNewGObject mkHTMLFormElement)
      ({# call webkit_dom_html_input_element_get_form #}
         (toHTMLInputElement self))

#if WEBKIT_CHECK_VERSION(1,10,0)
htmlInputElementSetFiles ::
                         (FileListClass val, HTMLInputElementClass self) =>
                           self -> Maybe val -> IO ()
htmlInputElementSetFiles self val
  = {# call webkit_dom_html_input_element_set_files #}
      (toHTMLInputElement self)
      (maybe (FileList nullForeignPtr) toFileList val)
#endif

htmlInputElementGetFiles ::
                         (HTMLInputElementClass self) => self -> IO (Maybe FileList)
htmlInputElementGetFiles self
  = maybeNull (makeNewGObject mkFileList)
      ({# call webkit_dom_html_input_element_get_files #}
         (toHTMLInputElement self))

htmlInputElementSetFormAction ::
                              (HTMLInputElementClass self) => self -> String -> IO ()
htmlInputElementSetFormAction self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_input_element_set_form_action #}
          (toHTMLInputElement self)
          valPtr

htmlInputElementGetFormAction ::
                              (HTMLInputElementClass self) => self -> IO String
htmlInputElementGetFormAction self
  = ({# call webkit_dom_html_input_element_get_form_action #}
       (toHTMLInputElement self))
      >>=
      readUTFString

htmlInputElementSetFormEnctype ::
                               (HTMLInputElementClass self) => self -> String -> IO ()
htmlInputElementSetFormEnctype self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_input_element_set_form_enctype #}
          (toHTMLInputElement self)
          valPtr

htmlInputElementGetFormEnctype ::
                               (HTMLInputElementClass self) => self -> IO String
htmlInputElementGetFormEnctype self
  = ({# call webkit_dom_html_input_element_get_form_enctype #}
       (toHTMLInputElement self))
      >>=
      readUTFString

htmlInputElementSetFormMethod ::
                              (HTMLInputElementClass self) => self -> String -> IO ()
htmlInputElementSetFormMethod self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_input_element_set_form_method #}
          (toHTMLInputElement self)
          valPtr

htmlInputElementGetFormMethod ::
                              (HTMLInputElementClass self) => self -> IO String
htmlInputElementGetFormMethod self
  = ({# call webkit_dom_html_input_element_get_form_method #}
       (toHTMLInputElement self))
      >>=
      readUTFString

htmlInputElementSetFormNoValidate ::
                                  (HTMLInputElementClass self) => self -> Bool -> IO ()
htmlInputElementSetFormNoValidate self val
  = {# call webkit_dom_html_input_element_set_form_no_validate #}
      (toHTMLInputElement self)
      (fromBool val)

htmlInputElementGetFormNoValidate ::
                                  (HTMLInputElementClass self) => self -> IO Bool
htmlInputElementGetFormNoValidate self
  = toBool <$>
      ({# call webkit_dom_html_input_element_get_form_no_validate #}
         (toHTMLInputElement self))

htmlInputElementSetFormTarget ::
                              (HTMLInputElementClass self) => self -> String -> IO ()
htmlInputElementSetFormTarget self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_input_element_set_form_target #}
          (toHTMLInputElement self)
          valPtr

htmlInputElementGetFormTarget ::
                              (HTMLInputElementClass self) => self -> IO String
htmlInputElementGetFormTarget self
  = ({# call webkit_dom_html_input_element_get_form_target #}
       (toHTMLInputElement self))
      >>=
      readUTFString

#if WEBKIT_CHECK_VERSION(1,10,0)
htmlInputElementSetHeight ::
                          (HTMLInputElementClass self) => self -> Word -> IO ()
htmlInputElementSetHeight self val
  = {# call webkit_dom_html_input_element_set_height #}
      (toHTMLInputElement self)
      (fromIntegral val)

htmlInputElementGetHeight ::
                          (HTMLInputElementClass self) => self -> IO Word
htmlInputElementGetHeight self
  = fromIntegral <$>
      ({# call webkit_dom_html_input_element_get_height #}
         (toHTMLInputElement self))
#endif

htmlInputElementSetIndeterminate ::
                                 (HTMLInputElementClass self) => self -> Bool -> IO ()
htmlInputElementSetIndeterminate self val
  = {# call webkit_dom_html_input_element_set_indeterminate #}
      (toHTMLInputElement self)
      (fromBool val)

htmlInputElementGetIndeterminate ::
                                 (HTMLInputElementClass self) => self -> IO Bool
htmlInputElementGetIndeterminate self
  = toBool <$>
      ({# call webkit_dom_html_input_element_get_indeterminate #}
         (toHTMLInputElement self))

htmlInputElementGetList ::
                        (HTMLInputElementClass self) => self -> IO (Maybe HTMLElement)
htmlInputElementGetList self
  = maybeNull (makeNewGObject mkHTMLElement)
      ({# call webkit_dom_html_input_element_get_list #}
         (toHTMLInputElement self))

htmlInputElementSetMax ::
                       (HTMLInputElementClass self) => self -> String -> IO ()
htmlInputElementSetMax self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_input_element_set_max #}
          (toHTMLInputElement self)
          valPtr

htmlInputElementGetMax ::
                       (HTMLInputElementClass self) => self -> IO String
htmlInputElementGetMax self
  = ({# call webkit_dom_html_input_element_get_max #}
       (toHTMLInputElement self))
      >>=
      readUTFString

htmlInputElementSetMaxLength ::
                             (HTMLInputElementClass self) => self -> Int -> IO ()
htmlInputElementSetMaxLength self val
  = propagateGError $
      \ errorPtr_ ->
        {# call webkit_dom_html_input_element_set_max_length #}
          (toHTMLInputElement self)
          (fromIntegral val)
          errorPtr_

htmlInputElementGetMaxLength ::
                             (HTMLInputElementClass self) => self -> IO Int
htmlInputElementGetMaxLength self
  = fromIntegral <$>
      ({# call webkit_dom_html_input_element_get_max_length #}
         (toHTMLInputElement self))

htmlInputElementSetMin ::
                       (HTMLInputElementClass self) => self -> String -> IO ()
htmlInputElementSetMin self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_input_element_set_min #}
          (toHTMLInputElement self)
          valPtr

htmlInputElementGetMin ::
                       (HTMLInputElementClass self) => self -> IO String
htmlInputElementGetMin self
  = ({# call webkit_dom_html_input_element_get_min #}
       (toHTMLInputElement self))
      >>=
      readUTFString

htmlInputElementSetMultiple ::
                            (HTMLInputElementClass self) => self -> Bool -> IO ()
htmlInputElementSetMultiple self val
  = {# call webkit_dom_html_input_element_set_multiple #}
      (toHTMLInputElement self)
      (fromBool val)

htmlInputElementGetMultiple ::
                            (HTMLInputElementClass self) => self -> IO Bool
htmlInputElementGetMultiple self
  = toBool <$>
      ({# call webkit_dom_html_input_element_get_multiple #}
         (toHTMLInputElement self))

htmlInputElementSetName ::
                        (HTMLInputElementClass self) => self -> String -> IO ()
htmlInputElementSetName self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_input_element_set_name #}
          (toHTMLInputElement self)
          valPtr

htmlInputElementGetName ::
                        (HTMLInputElementClass self) => self -> IO String
htmlInputElementGetName self
  = ({# call webkit_dom_html_input_element_get_name #}
       (toHTMLInputElement self))
      >>=
      readUTFString

htmlInputElementSetPattern ::
                           (HTMLInputElementClass self) => self -> String -> IO ()
htmlInputElementSetPattern self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_input_element_set_pattern #}
          (toHTMLInputElement self)
          valPtr

htmlInputElementGetPattern ::
                           (HTMLInputElementClass self) => self -> IO String
htmlInputElementGetPattern self
  = ({# call webkit_dom_html_input_element_get_pattern #}
       (toHTMLInputElement self))
      >>=
      readUTFString

htmlInputElementSetPlaceholder ::
                               (HTMLInputElementClass self) => self -> String -> IO ()
htmlInputElementSetPlaceholder self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_input_element_set_placeholder #}
          (toHTMLInputElement self)
          valPtr

htmlInputElementGetPlaceholder ::
                               (HTMLInputElementClass self) => self -> IO String
htmlInputElementGetPlaceholder self
  = ({# call webkit_dom_html_input_element_get_placeholder #}
       (toHTMLInputElement self))
      >>=
      readUTFString

htmlInputElementSetReadOnly ::
                            (HTMLInputElementClass self) => self -> Bool -> IO ()
htmlInputElementSetReadOnly self val
  = {# call webkit_dom_html_input_element_set_read_only #}
      (toHTMLInputElement self)
      (fromBool val)

htmlInputElementGetReadOnly ::
                            (HTMLInputElementClass self) => self -> IO Bool
htmlInputElementGetReadOnly self
  = toBool <$>
      ({# call webkit_dom_html_input_element_get_read_only #}
         (toHTMLInputElement self))

htmlInputElementSetRequired ::
                            (HTMLInputElementClass self) => self -> Bool -> IO ()
htmlInputElementSetRequired self val
  = {# call webkit_dom_html_input_element_set_required #}
      (toHTMLInputElement self)
      (fromBool val)

htmlInputElementGetRequired ::
                            (HTMLInputElementClass self) => self -> IO Bool
htmlInputElementGetRequired self
  = toBool <$>
      ({# call webkit_dom_html_input_element_get_required #}
         (toHTMLInputElement self))

htmlInputElementSetSize :: (HTMLInputElementClass self) => self -> Word -> IO ()
#if WEBKIT_CHECK_VERSION(2,0,0)
htmlInputElementSetSize self val = propagateGError $ \errorPtr ->
    {# call webkit_dom_html_input_element_set_size #} (toHTMLInputElement self) (fromIntegral val) errorPtr
#else
htmlInputElementSetSize self val = {# call webkit_dom_html_input_element_set_size #} (toHTMLInputElement self) (fromIntegral val)
#endif

htmlInputElementGetSize ::
                        (HTMLInputElementClass self) => self -> IO Word
htmlInputElementGetSize self
  = fromIntegral <$>
      ({# call webkit_dom_html_input_element_get_size #}
         (toHTMLInputElement self))

htmlInputElementSetSrc ::
                       (HTMLInputElementClass self) => self -> String -> IO ()
htmlInputElementSetSrc self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_input_element_set_src #}
          (toHTMLInputElement self)
          valPtr

htmlInputElementGetSrc ::
                       (HTMLInputElementClass self) => self -> IO String
htmlInputElementGetSrc self
  = ({# call webkit_dom_html_input_element_get_src #}
       (toHTMLInputElement self))
      >>=
      readUTFString

htmlInputElementSetStep ::
                        (HTMLInputElementClass self) => self -> String -> IO ()
htmlInputElementSetStep self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_input_element_set_step #}
          (toHTMLInputElement self)
          valPtr

htmlInputElementGetStep ::
                        (HTMLInputElementClass self) => self -> IO String
htmlInputElementGetStep self
  = ({# call webkit_dom_html_input_element_get_step #}
       (toHTMLInputElement self))
      >>=
      readUTFString

htmlInputElementSetDefaultValue ::
                                (HTMLInputElementClass self) => self -> String -> IO ()
htmlInputElementSetDefaultValue self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_input_element_set_default_value #}
          (toHTMLInputElement self)
          valPtr

htmlInputElementGetDefaultValue ::
                                (HTMLInputElementClass self) => self -> IO String
htmlInputElementGetDefaultValue self
  = ({# call webkit_dom_html_input_element_get_default_value #}
       (toHTMLInputElement self))
      >>=
      readUTFString

htmlInputElementSetValue ::
                         (HTMLInputElementClass self) => self -> String -> IO ()
htmlInputElementSetValue self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_input_element_set_value #}
          (toHTMLInputElement self)
          valPtr

htmlInputElementGetValue ::
                         (HTMLInputElementClass self) => self -> IO String
htmlInputElementGetValue self
  = ({# call webkit_dom_html_input_element_get_value #}
       (toHTMLInputElement self))
      >>=
      readUTFString

htmlInputElementSetValueAsNumber ::
                                 (HTMLInputElementClass self) => self -> Double -> IO ()
htmlInputElementSetValueAsNumber self val
  = propagateGError $
      \ errorPtr_ ->
        {# call webkit_dom_html_input_element_set_value_as_number #}
          (toHTMLInputElement self)
          (realToFrac val)
          errorPtr_

htmlInputElementGetValueAsNumber ::
                                 (HTMLInputElementClass self) => self -> IO Double
htmlInputElementGetValueAsNumber self
  = realToFrac <$>
      ({# call webkit_dom_html_input_element_get_value_as_number #}
         (toHTMLInputElement self))

#if WEBKIT_CHECK_VERSION(1,10,0)
htmlInputElementSetWidth ::
                         (HTMLInputElementClass self) => self -> Word -> IO ()
htmlInputElementSetWidth self val
  = {# call webkit_dom_html_input_element_set_width #}
      (toHTMLInputElement self)
      (fromIntegral val)

htmlInputElementGetWidth ::
                         (HTMLInputElementClass self) => self -> IO Word
htmlInputElementGetWidth self
  = fromIntegral <$>
      ({# call webkit_dom_html_input_element_get_width #}
         (toHTMLInputElement self))
#endif

htmlInputElementGetWillValidate ::
                                (HTMLInputElementClass self) => self -> IO Bool
htmlInputElementGetWillValidate self
  = toBool <$>
      ({# call webkit_dom_html_input_element_get_will_validate #}
         (toHTMLInputElement self))

htmlInputElementGetValidity ::
                            (HTMLInputElementClass self) => self -> IO (Maybe ValidityState)
htmlInputElementGetValidity self
  = maybeNull (makeNewGObject mkValidityState)
      ({# call webkit_dom_html_input_element_get_validity #}
         (toHTMLInputElement self))

htmlInputElementGetValidationMessage ::
                                     (HTMLInputElementClass self) => self -> IO String
htmlInputElementGetValidationMessage self
  = ({# call webkit_dom_html_input_element_get_validation_message #}
       (toHTMLInputElement self))
      >>=
      readUTFString

htmlInputElementGetLabels ::
                          (HTMLInputElementClass self) => self -> IO (Maybe NodeList)
htmlInputElementGetLabels self
  = maybeNull (makeNewGObject mkNodeList)
      ({# call webkit_dom_html_input_element_get_labels #}
         (toHTMLInputElement self))

htmlInputElementSetAlign ::
                         (HTMLInputElementClass self) => self -> String -> IO ()
htmlInputElementSetAlign self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_input_element_set_align #}
          (toHTMLInputElement self)
          valPtr

htmlInputElementGetAlign ::
                         (HTMLInputElementClass self) => self -> IO String
htmlInputElementGetAlign self
  = ({# call webkit_dom_html_input_element_get_align #}
       (toHTMLInputElement self))
      >>=
      readUTFString

htmlInputElementSetWebkitdirectory ::
                                   (HTMLInputElementClass self) => self -> Bool -> IO ()
htmlInputElementSetWebkitdirectory self val
  = {# call webkit_dom_html_input_element_set_webkitdirectory #}
      (toHTMLInputElement self)
      (fromBool val)

htmlInputElementGetWebkitdirectory ::
                                   (HTMLInputElementClass self) => self -> IO Bool
htmlInputElementGetWebkitdirectory self
  = toBool <$>
      ({# call webkit_dom_html_input_element_get_webkitdirectory #}
         (toHTMLInputElement self))

htmlInputElementSetUseMap ::
                          (HTMLInputElementClass self) => self -> String -> IO ()
htmlInputElementSetUseMap self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_input_element_set_use_map #}
          (toHTMLInputElement self)
          valPtr

htmlInputElementGetUseMap ::
                          (HTMLInputElementClass self) => self -> IO String
htmlInputElementGetUseMap self
  = ({# call webkit_dom_html_input_element_get_use_map #}
       (toHTMLInputElement self))
      >>=
      readUTFString

htmlInputElementSetIncremental ::
                               (HTMLInputElementClass self) => self -> Bool -> IO ()
htmlInputElementSetIncremental self val
  = {# call webkit_dom_html_input_element_set_incremental #}
      (toHTMLInputElement self)
      (fromBool val)

htmlInputElementGetIncremental ::
                               (HTMLInputElementClass self) => self -> IO Bool
htmlInputElementGetIncremental self
  = toBool <$>
      ({# call webkit_dom_html_input_element_get_incremental #}
         (toHTMLInputElement self))

htmlInputElementSetWebkitSpeech ::
                                (HTMLInputElementClass self) => self -> Bool -> IO ()
htmlInputElementSetWebkitSpeech self val
  = {# call webkit_dom_html_input_element_set_webkit_speech #}
      (toHTMLInputElement self)
      (fromBool val)

htmlInputElementGetWebkitSpeech ::
                                (HTMLInputElementClass self) => self -> IO Bool
htmlInputElementGetWebkitSpeech self
  = toBool <$>
      ({# call webkit_dom_html_input_element_get_webkit_speech #}
         (toHTMLInputElement self))

htmlInputElementSetWebkitGrammar ::
                                 (HTMLInputElementClass self) => self -> Bool -> IO ()
htmlInputElementSetWebkitGrammar self val
  = {# call webkit_dom_html_input_element_set_webkit_grammar #}
      (toHTMLInputElement self)
      (fromBool val)

htmlInputElementGetWebkitGrammar ::
                                 (HTMLInputElementClass self) => self -> IO Bool
htmlInputElementGetWebkitGrammar self
  = toBool <$>
      ({# call webkit_dom_html_input_element_get_webkit_grammar #}
         (toHTMLInputElement self))

htmlInputElementOnwebkitspeechchange ::
                                     (HTMLInputElementClass self) =>
                                       Signal self (EventM UIEvent self ())
htmlInputElementOnwebkitspeechchange
  = (connect "webkitspeechchange")

#if WEBKIT_CHECK_VERSION(1,10,0)
htmlInputElementSetCapture ::
                           (HTMLInputElementClass self) => self -> String -> IO ()
htmlInputElementSetCapture self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_input_element_set_capture #}
          (toHTMLInputElement self)
          valPtr

htmlInputElementGetCapture ::
                           (HTMLInputElementClass self) => self -> IO String
htmlInputElementGetCapture self
  = ({# call webkit_dom_html_input_element_get_capture #}
       (toHTMLInputElement self))
      >>=
      readUTFString
#endif
