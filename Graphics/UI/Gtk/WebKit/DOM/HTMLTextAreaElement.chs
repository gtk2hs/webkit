module Graphics.UI.Gtk.WebKit.DOM.HTMLTextAreaElement
       (htmlTextAreaElementCheckValidity,
        htmlTextAreaElementSetCustomValidity, htmlTextAreaElementSelect,
#if WEBKIT_CHECK_VERSION(2,2,2)
        htmlTextAreaElementSetRangeText,
#endif
        htmlTextAreaElementSetSelectionRange,
        htmlTextAreaElementSetAutofocus, htmlTextAreaElementGetAutofocus,
        htmlTextAreaElementSetCols, htmlTextAreaElementGetCols,
        htmlTextAreaElementSetDirName, htmlTextAreaElementGetDirName,
        htmlTextAreaElementSetDisabled, htmlTextAreaElementGetDisabled,
        htmlTextAreaElementGetForm, htmlTextAreaElementSetMaxLength,
        htmlTextAreaElementGetMaxLength, htmlTextAreaElementSetName,
        htmlTextAreaElementGetName, htmlTextAreaElementSetPlaceholder,
        htmlTextAreaElementGetPlaceholder, htmlTextAreaElementSetReadOnly,
        htmlTextAreaElementGetReadOnly, htmlTextAreaElementSetRequired,
        htmlTextAreaElementGetRequired, htmlTextAreaElementSetRows,
        htmlTextAreaElementGetRows, htmlTextAreaElementSetWrap,
        htmlTextAreaElementGetWrap, htmlTextAreaElementSetDefaultValue,
        htmlTextAreaElementGetDefaultValue, htmlTextAreaElementSetValue,
        htmlTextAreaElementGetValue, htmlTextAreaElementGetTextLength,
        htmlTextAreaElementGetWillValidate, htmlTextAreaElementGetValidity,
        htmlTextAreaElementGetValidationMessage,
        htmlTextAreaElementGetLabels, htmlTextAreaElementSetSelectionStart,
        htmlTextAreaElementGetSelectionStart,
        htmlTextAreaElementSetSelectionEnd,
        htmlTextAreaElementGetSelectionEnd,
        htmlTextAreaElementSetSelectionDirection,
        htmlTextAreaElementGetSelectionDirection)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
htmlTextAreaElementCheckValidity ::
                                 (HTMLTextAreaElementClass self) => self -> IO Bool
htmlTextAreaElementCheckValidity self
  = toBool <$>
      ({# call webkit_dom_html_text_area_element_check_validity #}
         (toHTMLTextAreaElement self))
 
htmlTextAreaElementSetCustomValidity ::
                                     (HTMLTextAreaElementClass self) => self -> String -> IO ()
htmlTextAreaElementSetCustomValidity self error
  = withUTFString error $
      \ errorPtr ->
        {# call webkit_dom_html_text_area_element_set_custom_validity #}
          (toHTMLTextAreaElement self)
          errorPtr
 
htmlTextAreaElementSelect ::
                          (HTMLTextAreaElementClass self) => self -> IO ()
htmlTextAreaElementSelect self
  = {# call webkit_dom_html_text_area_element_select #}
      (toHTMLTextAreaElement self)
 
#if WEBKIT_CHECK_VERSION(2,2,2)
htmlTextAreaElementSetRangeText ::
                                (HTMLTextAreaElementClass self) =>
                                  self -> String -> Word -> Word -> String -> IO ()
htmlTextAreaElementSetRangeText self replacement start end
  selectionMode
  = propagateGError $
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
          errorPtr_
#endif

htmlTextAreaElementSetSelectionRange ::
                                     (HTMLTextAreaElementClass self) =>
                                       self -> Int -> Int -> String -> IO ()
htmlTextAreaElementSetSelectionRange self start end direction
  = withUTFString direction $
      \ directionPtr ->
        {# call webkit_dom_html_text_area_element_set_selection_range #}
          (toHTMLTextAreaElement self)
          (fromIntegral start)
          (fromIntegral end)
          directionPtr
 
htmlTextAreaElementSetAutofocus ::
                                (HTMLTextAreaElementClass self) => self -> Bool -> IO ()
htmlTextAreaElementSetAutofocus self val
  = {# call webkit_dom_html_text_area_element_set_autofocus #}
      (toHTMLTextAreaElement self)
      (fromBool val)
 
htmlTextAreaElementGetAutofocus ::
                                (HTMLTextAreaElementClass self) => self -> IO Bool
htmlTextAreaElementGetAutofocus self
  = toBool <$>
      ({# call webkit_dom_html_text_area_element_get_autofocus #}
         (toHTMLTextAreaElement self))
 
htmlTextAreaElementSetCols ::
                           (HTMLTextAreaElementClass self) => self -> Int -> IO ()
htmlTextAreaElementSetCols self val
  = {# call webkit_dom_html_text_area_element_set_cols #}
      (toHTMLTextAreaElement self)
      (fromIntegral val)
 
htmlTextAreaElementGetCols ::
                           (HTMLTextAreaElementClass self) => self -> IO Int
htmlTextAreaElementGetCols self
  = fromIntegral <$>
      ({# call webkit_dom_html_text_area_element_get_cols #}
         (toHTMLTextAreaElement self))
 
htmlTextAreaElementSetDirName ::
                              (HTMLTextAreaElementClass self) => self -> String -> IO ()
htmlTextAreaElementSetDirName self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_text_area_element_set_dir_name #}
          (toHTMLTextAreaElement self)
          valPtr
 
htmlTextAreaElementGetDirName ::
                              (HTMLTextAreaElementClass self) => self -> IO String
htmlTextAreaElementGetDirName self
  = ({# call webkit_dom_html_text_area_element_get_dir_name #}
       (toHTMLTextAreaElement self))
      >>=
      readUTFString
 
htmlTextAreaElementSetDisabled ::
                               (HTMLTextAreaElementClass self) => self -> Bool -> IO ()
htmlTextAreaElementSetDisabled self val
  = {# call webkit_dom_html_text_area_element_set_disabled #}
      (toHTMLTextAreaElement self)
      (fromBool val)
 
htmlTextAreaElementGetDisabled ::
                               (HTMLTextAreaElementClass self) => self -> IO Bool
htmlTextAreaElementGetDisabled self
  = toBool <$>
      ({# call webkit_dom_html_text_area_element_get_disabled #}
         (toHTMLTextAreaElement self))
 
htmlTextAreaElementGetForm ::
                           (HTMLTextAreaElementClass self) =>
                             self -> IO (Maybe HTMLFormElement)
htmlTextAreaElementGetForm self
  = maybeNull (makeNewGObject mkHTMLFormElement)
      ({# call webkit_dom_html_text_area_element_get_form #}
         (toHTMLTextAreaElement self))
 
htmlTextAreaElementSetMaxLength ::
                                (HTMLTextAreaElementClass self) => self -> Int -> IO ()
htmlTextAreaElementSetMaxLength self val
  = propagateGError $
      \ errorPtr_ ->
        {# call webkit_dom_html_text_area_element_set_max_length #}
          (toHTMLTextAreaElement self)
          (fromIntegral val)
          errorPtr_
 
htmlTextAreaElementGetMaxLength ::
                                (HTMLTextAreaElementClass self) => self -> IO Int
htmlTextAreaElementGetMaxLength self
  = fromIntegral <$>
      ({# call webkit_dom_html_text_area_element_get_max_length #}
         (toHTMLTextAreaElement self))
 
htmlTextAreaElementSetName ::
                           (HTMLTextAreaElementClass self) => self -> String -> IO ()
htmlTextAreaElementSetName self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_text_area_element_set_name #}
          (toHTMLTextAreaElement self)
          valPtr
 
htmlTextAreaElementGetName ::
                           (HTMLTextAreaElementClass self) => self -> IO String
htmlTextAreaElementGetName self
  = ({# call webkit_dom_html_text_area_element_get_name #}
       (toHTMLTextAreaElement self))
      >>=
      readUTFString
 
htmlTextAreaElementSetPlaceholder ::
                                  (HTMLTextAreaElementClass self) => self -> String -> IO ()
htmlTextAreaElementSetPlaceholder self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_text_area_element_set_placeholder #}
          (toHTMLTextAreaElement self)
          valPtr
 
htmlTextAreaElementGetPlaceholder ::
                                  (HTMLTextAreaElementClass self) => self -> IO String
htmlTextAreaElementGetPlaceholder self
  = ({# call webkit_dom_html_text_area_element_get_placeholder #}
       (toHTMLTextAreaElement self))
      >>=
      readUTFString
 
htmlTextAreaElementSetReadOnly ::
                               (HTMLTextAreaElementClass self) => self -> Bool -> IO ()
htmlTextAreaElementSetReadOnly self val
  = {# call webkit_dom_html_text_area_element_set_read_only #}
      (toHTMLTextAreaElement self)
      (fromBool val)
 
htmlTextAreaElementGetReadOnly ::
                               (HTMLTextAreaElementClass self) => self -> IO Bool
htmlTextAreaElementGetReadOnly self
  = toBool <$>
      ({# call webkit_dom_html_text_area_element_get_read_only #}
         (toHTMLTextAreaElement self))
 
htmlTextAreaElementSetRequired ::
                               (HTMLTextAreaElementClass self) => self -> Bool -> IO ()
htmlTextAreaElementSetRequired self val
  = {# call webkit_dom_html_text_area_element_set_required #}
      (toHTMLTextAreaElement self)
      (fromBool val)
 
htmlTextAreaElementGetRequired ::
                               (HTMLTextAreaElementClass self) => self -> IO Bool
htmlTextAreaElementGetRequired self
  = toBool <$>
      ({# call webkit_dom_html_text_area_element_get_required #}
         (toHTMLTextAreaElement self))
 
htmlTextAreaElementSetRows ::
                           (HTMLTextAreaElementClass self) => self -> Int -> IO ()
htmlTextAreaElementSetRows self val
  = {# call webkit_dom_html_text_area_element_set_rows #}
      (toHTMLTextAreaElement self)
      (fromIntegral val)
 
htmlTextAreaElementGetRows ::
                           (HTMLTextAreaElementClass self) => self -> IO Int
htmlTextAreaElementGetRows self
  = fromIntegral <$>
      ({# call webkit_dom_html_text_area_element_get_rows #}
         (toHTMLTextAreaElement self))
 
htmlTextAreaElementSetWrap ::
                           (HTMLTextAreaElementClass self) => self -> String -> IO ()
htmlTextAreaElementSetWrap self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_text_area_element_set_wrap #}
          (toHTMLTextAreaElement self)
          valPtr
 
htmlTextAreaElementGetWrap ::
                           (HTMLTextAreaElementClass self) => self -> IO String
htmlTextAreaElementGetWrap self
  = ({# call webkit_dom_html_text_area_element_get_wrap #}
       (toHTMLTextAreaElement self))
      >>=
      readUTFString
 
htmlTextAreaElementSetDefaultValue ::
                                   (HTMLTextAreaElementClass self) => self -> String -> IO ()
htmlTextAreaElementSetDefaultValue self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_text_area_element_set_default_value #}
          (toHTMLTextAreaElement self)
          valPtr
 
htmlTextAreaElementGetDefaultValue ::
                                   (HTMLTextAreaElementClass self) => self -> IO String
htmlTextAreaElementGetDefaultValue self
  = ({# call webkit_dom_html_text_area_element_get_default_value #}
       (toHTMLTextAreaElement self))
      >>=
      readUTFString
 
htmlTextAreaElementSetValue ::
                            (HTMLTextAreaElementClass self) => self -> String -> IO ()
htmlTextAreaElementSetValue self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_text_area_element_set_value #}
          (toHTMLTextAreaElement self)
          valPtr
 
htmlTextAreaElementGetValue ::
                            (HTMLTextAreaElementClass self) => self -> IO String
htmlTextAreaElementGetValue self
  = ({# call webkit_dom_html_text_area_element_get_value #}
       (toHTMLTextAreaElement self))
      >>=
      readUTFString
 
htmlTextAreaElementGetTextLength ::
                                 (HTMLTextAreaElementClass self) => self -> IO Word
htmlTextAreaElementGetTextLength self
  = fromIntegral <$>
      ({# call webkit_dom_html_text_area_element_get_text_length #}
         (toHTMLTextAreaElement self))
 
htmlTextAreaElementGetWillValidate ::
                                   (HTMLTextAreaElementClass self) => self -> IO Bool
htmlTextAreaElementGetWillValidate self
  = toBool <$>
      ({# call webkit_dom_html_text_area_element_get_will_validate #}
         (toHTMLTextAreaElement self))
 
htmlTextAreaElementGetValidity ::
                               (HTMLTextAreaElementClass self) => self -> IO (Maybe ValidityState)
htmlTextAreaElementGetValidity self
  = maybeNull (makeNewGObject mkValidityState)
      ({# call webkit_dom_html_text_area_element_get_validity #}
         (toHTMLTextAreaElement self))
 
htmlTextAreaElementGetValidationMessage ::
                                        (HTMLTextAreaElementClass self) => self -> IO String
htmlTextAreaElementGetValidationMessage self
  = ({# call webkit_dom_html_text_area_element_get_validation_message
       #}
       (toHTMLTextAreaElement self))
      >>=
      readUTFString
 
htmlTextAreaElementGetLabels ::
                             (HTMLTextAreaElementClass self) => self -> IO (Maybe NodeList)
htmlTextAreaElementGetLabels self
  = maybeNull (makeNewGObject mkNodeList)
      ({# call webkit_dom_html_text_area_element_get_labels #}
         (toHTMLTextAreaElement self))
 
htmlTextAreaElementSetSelectionStart ::
                                     (HTMLTextAreaElementClass self) => self -> Int -> IO ()
htmlTextAreaElementSetSelectionStart self val
  = {# call webkit_dom_html_text_area_element_set_selection_start #}
      (toHTMLTextAreaElement self)
      (fromIntegral val)
 
htmlTextAreaElementGetSelectionStart ::
                                     (HTMLTextAreaElementClass self) => self -> IO Int
htmlTextAreaElementGetSelectionStart self
  = fromIntegral <$>
      ({# call webkit_dom_html_text_area_element_get_selection_start #}
         (toHTMLTextAreaElement self))
 
htmlTextAreaElementSetSelectionEnd ::
                                   (HTMLTextAreaElementClass self) => self -> Int -> IO ()
htmlTextAreaElementSetSelectionEnd self val
  = {# call webkit_dom_html_text_area_element_set_selection_end #}
      (toHTMLTextAreaElement self)
      (fromIntegral val)
 
htmlTextAreaElementGetSelectionEnd ::
                                   (HTMLTextAreaElementClass self) => self -> IO Int
htmlTextAreaElementGetSelectionEnd self
  = fromIntegral <$>
      ({# call webkit_dom_html_text_area_element_get_selection_end #}
         (toHTMLTextAreaElement self))
 
htmlTextAreaElementSetSelectionDirection ::
                                         (HTMLTextAreaElementClass self) => self -> String -> IO ()
htmlTextAreaElementSetSelectionDirection self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_text_area_element_set_selection_direction
          #}
          (toHTMLTextAreaElement self)
          valPtr
 
htmlTextAreaElementGetSelectionDirection ::
                                         (HTMLTextAreaElementClass self) => self -> IO String
htmlTextAreaElementGetSelectionDirection self
  = ({# call
       webkit_dom_html_text_area_element_get_selection_direction
       #}
       (toHTMLTextAreaElement self))
      >>=
      readUTFString
