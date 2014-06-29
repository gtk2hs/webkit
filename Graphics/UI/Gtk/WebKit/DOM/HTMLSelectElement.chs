module Graphics.UI.Gtk.WebKit.DOM.HTMLSelectElement
       (htmlSelectElementItem, htmlSelectElementNamedItem,
        htmlSelectElementAdd, htmlSelectElementRemove,
        htmlSelectElementCheckValidity, htmlSelectElementSetCustomValidity,
        htmlSelectElementSetAutofocus, htmlSelectElementGetAutofocus,
        htmlSelectElementSetDisabled, htmlSelectElementGetDisabled,
        htmlSelectElementGetForm, htmlSelectElementSetMultiple,
        htmlSelectElementGetMultiple, htmlSelectElementSetName,
        htmlSelectElementGetName, htmlSelectElementSetRequired,
        htmlSelectElementGetRequired, htmlSelectElementSetSize,
        htmlSelectElementGetSize, htmlSelectElementGetOptions,
        htmlSelectElementSetLength, htmlSelectElementGetLength,
#if WEBKIT_CHECK_VERSION(1,10,0)
        htmlSelectElementGetSelectedOptions,
#endif
        htmlSelectElementSetSelectedIndex,
        htmlSelectElementGetSelectedIndex, htmlSelectElementSetValue,
        htmlSelectElementGetValue, htmlSelectElementGetWillValidate,
        htmlSelectElementGetValidity,
        htmlSelectElementGetValidationMessage, htmlSelectElementGetLabels,
        HTMLSelectElement, HTMLSelectElementClass, castToHTMLSelectElement,
        gTypeHTMLSelectElement, toHTMLSelectElement)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
htmlSelectElementItem ::
                      (HTMLSelectElementClass self) => self -> Word -> IO (Maybe Node)
htmlSelectElementItem self index
  = maybeNull (makeNewGObject mkNode)
      ({# call webkit_dom_html_select_element_item #}
         (toHTMLSelectElement self)
         (fromIntegral index))
 
htmlSelectElementNamedItem ::
                           (HTMLSelectElementClass self, GlibString string) =>
                             self -> string -> IO (Maybe Node)
htmlSelectElementNamedItem self name
  = maybeNull (makeNewGObject mkNode)
      (withUTFString name $
         \ namePtr ->
           {# call webkit_dom_html_select_element_named_item #}
             (toHTMLSelectElement self)
             namePtr)
 
htmlSelectElementAdd ::
                     (HTMLSelectElementClass self, HTMLElementClass element,
                      HTMLElementClass before) =>
                       self -> Maybe element -> Maybe before -> IO ()
htmlSelectElementAdd self element before
  = propagateGError $
      \ errorPtr_ ->
        {# call webkit_dom_html_select_element_add #}
          (toHTMLSelectElement self)
          (maybe (HTMLElement nullForeignPtr) toHTMLElement element)
          (maybe (HTMLElement nullForeignPtr) toHTMLElement before)
          errorPtr_
 
htmlSelectElementRemove ::
                        (HTMLSelectElementClass self) => self -> Int -> IO ()
htmlSelectElementRemove self index
  = {# call webkit_dom_html_select_element_remove #}
      (toHTMLSelectElement self)
      (fromIntegral index)
 
htmlSelectElementCheckValidity ::
                               (HTMLSelectElementClass self) => self -> IO Bool
htmlSelectElementCheckValidity self
  = toBool <$>
      ({# call webkit_dom_html_select_element_check_validity #}
         (toHTMLSelectElement self))
 
htmlSelectElementSetCustomValidity ::
                                   (HTMLSelectElementClass self, GlibString string) =>
                                     self -> string -> IO ()
htmlSelectElementSetCustomValidity self error
  = withUTFString error $
      \ errorPtr ->
        {# call webkit_dom_html_select_element_set_custom_validity #}
          (toHTMLSelectElement self)
          errorPtr
 
htmlSelectElementSetAutofocus ::
                              (HTMLSelectElementClass self) => self -> Bool -> IO ()
htmlSelectElementSetAutofocus self val
  = {# call webkit_dom_html_select_element_set_autofocus #}
      (toHTMLSelectElement self)
      (fromBool val)
 
htmlSelectElementGetAutofocus ::
                              (HTMLSelectElementClass self) => self -> IO Bool
htmlSelectElementGetAutofocus self
  = toBool <$>
      ({# call webkit_dom_html_select_element_get_autofocus #}
         (toHTMLSelectElement self))
 
htmlSelectElementSetDisabled ::
                             (HTMLSelectElementClass self) => self -> Bool -> IO ()
htmlSelectElementSetDisabled self val
  = {# call webkit_dom_html_select_element_set_disabled #}
      (toHTMLSelectElement self)
      (fromBool val)
 
htmlSelectElementGetDisabled ::
                             (HTMLSelectElementClass self) => self -> IO Bool
htmlSelectElementGetDisabled self
  = toBool <$>
      ({# call webkit_dom_html_select_element_get_disabled #}
         (toHTMLSelectElement self))
 
htmlSelectElementGetForm ::
                         (HTMLSelectElementClass self) => self -> IO (Maybe HTMLFormElement)
htmlSelectElementGetForm self
  = maybeNull (makeNewGObject mkHTMLFormElement)
      ({# call webkit_dom_html_select_element_get_form #}
         (toHTMLSelectElement self))
 
htmlSelectElementSetMultiple ::
                             (HTMLSelectElementClass self) => self -> Bool -> IO ()
htmlSelectElementSetMultiple self val
  = {# call webkit_dom_html_select_element_set_multiple #}
      (toHTMLSelectElement self)
      (fromBool val)
 
htmlSelectElementGetMultiple ::
                             (HTMLSelectElementClass self) => self -> IO Bool
htmlSelectElementGetMultiple self
  = toBool <$>
      ({# call webkit_dom_html_select_element_get_multiple #}
         (toHTMLSelectElement self))
 
htmlSelectElementSetName ::
                         (HTMLSelectElementClass self, GlibString string) =>
                           self -> string -> IO ()
htmlSelectElementSetName self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_select_element_set_name #}
          (toHTMLSelectElement self)
          valPtr
 
htmlSelectElementGetName ::
                         (HTMLSelectElementClass self, GlibString string) =>
                           self -> IO string
htmlSelectElementGetName self
  = ({# call webkit_dom_html_select_element_get_name #}
       (toHTMLSelectElement self))
      >>=
      readUTFString
 
htmlSelectElementSetRequired ::
                             (HTMLSelectElementClass self) => self -> Bool -> IO ()
htmlSelectElementSetRequired self val
  = {# call webkit_dom_html_select_element_set_required #}
      (toHTMLSelectElement self)
      (fromBool val)
 
htmlSelectElementGetRequired ::
                             (HTMLSelectElementClass self) => self -> IO Bool
htmlSelectElementGetRequired self
  = toBool <$>
      ({# call webkit_dom_html_select_element_get_required #}
         (toHTMLSelectElement self))
 
htmlSelectElementSetSize ::
                         (HTMLSelectElementClass self) => self -> Int -> IO ()
htmlSelectElementSetSize self val
  = {# call webkit_dom_html_select_element_set_size #}
      (toHTMLSelectElement self)
      (fromIntegral val)
 
htmlSelectElementGetSize ::
                         (HTMLSelectElementClass self) => self -> IO Int
htmlSelectElementGetSize self
  = fromIntegral <$>
      ({# call webkit_dom_html_select_element_get_size #}
         (toHTMLSelectElement self))
 
htmlSelectElementGetOptions ::
                            (HTMLSelectElementClass self) =>
                              self -> IO (Maybe HTMLOptionsCollection)
htmlSelectElementGetOptions self
  = maybeNull (makeNewGObject mkHTMLOptionsCollection)
      ({# call webkit_dom_html_select_element_get_options #}
         (toHTMLSelectElement self))
 
htmlSelectElementSetLength ::
                           (HTMLSelectElementClass self) => self -> Word -> IO ()
htmlSelectElementSetLength self val
  = propagateGError $
      \ errorPtr_ ->
        {# call webkit_dom_html_select_element_set_length #}
          (toHTMLSelectElement self)
          (fromIntegral val)
          errorPtr_
 
htmlSelectElementGetLength ::
                           (HTMLSelectElementClass self) => self -> IO Word
htmlSelectElementGetLength self
  = fromIntegral <$>
      ({# call webkit_dom_html_select_element_get_length #}
         (toHTMLSelectElement self))
 
#if WEBKIT_CHECK_VERSION(1,10,0)
htmlSelectElementGetSelectedOptions ::
                                    (HTMLSelectElementClass self) =>
                                      self -> IO (Maybe HTMLCollection)
htmlSelectElementGetSelectedOptions self
  = maybeNull (makeNewGObject mkHTMLCollection)
      ({# call webkit_dom_html_select_element_get_selected_options #}
         (toHTMLSelectElement self))
#endif
 
htmlSelectElementSetSelectedIndex ::
                                  (HTMLSelectElementClass self) => self -> Int -> IO ()
htmlSelectElementSetSelectedIndex self val
  = {# call webkit_dom_html_select_element_set_selected_index #}
      (toHTMLSelectElement self)
      (fromIntegral val)
 
htmlSelectElementGetSelectedIndex ::
                                  (HTMLSelectElementClass self) => self -> IO Int
htmlSelectElementGetSelectedIndex self
  = fromIntegral <$>
      ({# call webkit_dom_html_select_element_get_selected_index #}
         (toHTMLSelectElement self))
 
htmlSelectElementSetValue ::
                          (HTMLSelectElementClass self, GlibString string) =>
                            self -> string -> IO ()
htmlSelectElementSetValue self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_select_element_set_value #}
          (toHTMLSelectElement self)
          valPtr
 
htmlSelectElementGetValue ::
                          (HTMLSelectElementClass self, GlibString string) =>
                            self -> IO string
htmlSelectElementGetValue self
  = ({# call webkit_dom_html_select_element_get_value #}
       (toHTMLSelectElement self))
      >>=
      readUTFString
 
htmlSelectElementGetWillValidate ::
                                 (HTMLSelectElementClass self) => self -> IO Bool
htmlSelectElementGetWillValidate self
  = toBool <$>
      ({# call webkit_dom_html_select_element_get_will_validate #}
         (toHTMLSelectElement self))
 
htmlSelectElementGetValidity ::
                             (HTMLSelectElementClass self) => self -> IO (Maybe ValidityState)
htmlSelectElementGetValidity self
  = maybeNull (makeNewGObject mkValidityState)
      ({# call webkit_dom_html_select_element_get_validity #}
         (toHTMLSelectElement self))
 
htmlSelectElementGetValidationMessage ::
                                      (HTMLSelectElementClass self, GlibString string) =>
                                        self -> IO string
htmlSelectElementGetValidationMessage self
  = ({# call webkit_dom_html_select_element_get_validation_message #}
       (toHTMLSelectElement self))
      >>=
      readUTFString
 
htmlSelectElementGetLabels ::
                           (HTMLSelectElementClass self) => self -> IO (Maybe NodeList)
htmlSelectElementGetLabels self
  = maybeNull (makeNewGObject mkNodeList)
      ({# call webkit_dom_html_select_element_get_labels #}
         (toHTMLSelectElement self))
