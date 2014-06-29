module Graphics.UI.Gtk.WebKit.DOM.HTMLButtonElement
       (htmlButtonElementCheckValidity,
        htmlButtonElementSetCustomValidity, htmlButtonElementSetAutofocus,
        htmlButtonElementGetAutofocus, htmlButtonElementSetDisabled,
        htmlButtonElementGetDisabled, htmlButtonElementGetForm,
        htmlButtonElementSetFormAction, htmlButtonElementGetFormAction,
        htmlButtonElementSetFormEnctype, htmlButtonElementGetFormEnctype,
        htmlButtonElementSetFormMethod, htmlButtonElementGetFormMethod,
        htmlButtonElementSetFormNoValidate,
        htmlButtonElementGetFormNoValidate, htmlButtonElementSetFormTarget,
        htmlButtonElementGetFormTarget, htmlButtonElementSetName,
        htmlButtonElementGetName, htmlButtonElementSetValue,
        htmlButtonElementGetValue, htmlButtonElementGetWillValidate,
        htmlButtonElementGetValidity,
        htmlButtonElementGetValidationMessage, htmlButtonElementGetLabels,
        HTMLButtonElement, HTMLButtonElementClass, castToHTMLButtonElement,
        gTypeHTMLButtonElement, toHTMLButtonElement)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
htmlButtonElementCheckValidity ::
                               (HTMLButtonElementClass self) => self -> IO Bool
htmlButtonElementCheckValidity self
  = toBool <$>
      ({# call webkit_dom_html_button_element_check_validity #}
         (toHTMLButtonElement self))
 
htmlButtonElementSetCustomValidity ::
                                   (HTMLButtonElementClass self, GlibString string) =>
                                     self -> string -> IO ()
htmlButtonElementSetCustomValidity self error
  = withUTFString error $
      \ errorPtr ->
        {# call webkit_dom_html_button_element_set_custom_validity #}
          (toHTMLButtonElement self)
          errorPtr
 
htmlButtonElementSetAutofocus ::
                              (HTMLButtonElementClass self) => self -> Bool -> IO ()
htmlButtonElementSetAutofocus self val
  = {# call webkit_dom_html_button_element_set_autofocus #}
      (toHTMLButtonElement self)
      (fromBool val)
 
htmlButtonElementGetAutofocus ::
                              (HTMLButtonElementClass self) => self -> IO Bool
htmlButtonElementGetAutofocus self
  = toBool <$>
      ({# call webkit_dom_html_button_element_get_autofocus #}
         (toHTMLButtonElement self))
 
htmlButtonElementSetDisabled ::
                             (HTMLButtonElementClass self) => self -> Bool -> IO ()
htmlButtonElementSetDisabled self val
  = {# call webkit_dom_html_button_element_set_disabled #}
      (toHTMLButtonElement self)
      (fromBool val)
 
htmlButtonElementGetDisabled ::
                             (HTMLButtonElementClass self) => self -> IO Bool
htmlButtonElementGetDisabled self
  = toBool <$>
      ({# call webkit_dom_html_button_element_get_disabled #}
         (toHTMLButtonElement self))
 
htmlButtonElementGetForm ::
                         (HTMLButtonElementClass self) => self -> IO (Maybe HTMLFormElement)
htmlButtonElementGetForm self
  = maybeNull (makeNewGObject mkHTMLFormElement)
      ({# call webkit_dom_html_button_element_get_form #}
         (toHTMLButtonElement self))
 
htmlButtonElementSetFormAction ::
                               (HTMLButtonElementClass self, GlibString string) =>
                                 self -> string -> IO ()
htmlButtonElementSetFormAction self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_button_element_set_form_action #}
          (toHTMLButtonElement self)
          valPtr
 
htmlButtonElementGetFormAction ::
                               (HTMLButtonElementClass self, GlibString string) =>
                                 self -> IO string
htmlButtonElementGetFormAction self
  = ({# call webkit_dom_html_button_element_get_form_action #}
       (toHTMLButtonElement self))
      >>=
      readUTFString
 
htmlButtonElementSetFormEnctype ::
                                (HTMLButtonElementClass self, GlibString string) =>
                                  self -> string -> IO ()
htmlButtonElementSetFormEnctype self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_button_element_set_form_enctype #}
          (toHTMLButtonElement self)
          valPtr
 
htmlButtonElementGetFormEnctype ::
                                (HTMLButtonElementClass self, GlibString string) =>
                                  self -> IO string
htmlButtonElementGetFormEnctype self
  = ({# call webkit_dom_html_button_element_get_form_enctype #}
       (toHTMLButtonElement self))
      >>=
      readUTFString
 
htmlButtonElementSetFormMethod ::
                               (HTMLButtonElementClass self, GlibString string) =>
                                 self -> string -> IO ()
htmlButtonElementSetFormMethod self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_button_element_set_form_method #}
          (toHTMLButtonElement self)
          valPtr
 
htmlButtonElementGetFormMethod ::
                               (HTMLButtonElementClass self, GlibString string) =>
                                 self -> IO string
htmlButtonElementGetFormMethod self
  = ({# call webkit_dom_html_button_element_get_form_method #}
       (toHTMLButtonElement self))
      >>=
      readUTFString
 
htmlButtonElementSetFormNoValidate ::
                                   (HTMLButtonElementClass self) => self -> Bool -> IO ()
htmlButtonElementSetFormNoValidate self val
  = {# call webkit_dom_html_button_element_set_form_no_validate #}
      (toHTMLButtonElement self)
      (fromBool val)
 
htmlButtonElementGetFormNoValidate ::
                                   (HTMLButtonElementClass self) => self -> IO Bool
htmlButtonElementGetFormNoValidate self
  = toBool <$>
      ({# call webkit_dom_html_button_element_get_form_no_validate #}
         (toHTMLButtonElement self))
 
htmlButtonElementSetFormTarget ::
                               (HTMLButtonElementClass self, GlibString string) =>
                                 self -> string -> IO ()
htmlButtonElementSetFormTarget self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_button_element_set_form_target #}
          (toHTMLButtonElement self)
          valPtr
 
htmlButtonElementGetFormTarget ::
                               (HTMLButtonElementClass self, GlibString string) =>
                                 self -> IO string
htmlButtonElementGetFormTarget self
  = ({# call webkit_dom_html_button_element_get_form_target #}
       (toHTMLButtonElement self))
      >>=
      readUTFString
 
htmlButtonElementSetName ::
                         (HTMLButtonElementClass self, GlibString string) =>
                           self -> string -> IO ()
htmlButtonElementSetName self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_button_element_set_name #}
          (toHTMLButtonElement self)
          valPtr
 
htmlButtonElementGetName ::
                         (HTMLButtonElementClass self, GlibString string) =>
                           self -> IO string
htmlButtonElementGetName self
  = ({# call webkit_dom_html_button_element_get_name #}
       (toHTMLButtonElement self))
      >>=
      readUTFString
 
htmlButtonElementSetValue ::
                          (HTMLButtonElementClass self, GlibString string) =>
                            self -> string -> IO ()
htmlButtonElementSetValue self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_button_element_set_value #}
          (toHTMLButtonElement self)
          valPtr
 
htmlButtonElementGetValue ::
                          (HTMLButtonElementClass self, GlibString string) =>
                            self -> IO string
htmlButtonElementGetValue self
  = ({# call webkit_dom_html_button_element_get_value #}
       (toHTMLButtonElement self))
      >>=
      readUTFString
 
htmlButtonElementGetWillValidate ::
                                 (HTMLButtonElementClass self) => self -> IO Bool
htmlButtonElementGetWillValidate self
  = toBool <$>
      ({# call webkit_dom_html_button_element_get_will_validate #}
         (toHTMLButtonElement self))
 
htmlButtonElementGetValidity ::
                             (HTMLButtonElementClass self) => self -> IO (Maybe ValidityState)
htmlButtonElementGetValidity self
  = maybeNull (makeNewGObject mkValidityState)
      ({# call webkit_dom_html_button_element_get_validity #}
         (toHTMLButtonElement self))
 
htmlButtonElementGetValidationMessage ::
                                      (HTMLButtonElementClass self, GlibString string) =>
                                        self -> IO string
htmlButtonElementGetValidationMessage self
  = ({# call webkit_dom_html_button_element_get_validation_message #}
       (toHTMLButtonElement self))
      >>=
      readUTFString
 
htmlButtonElementGetLabels ::
                           (HTMLButtonElementClass self) => self -> IO (Maybe NodeList)
htmlButtonElementGetLabels self
  = maybeNull (makeNewGObject mkNodeList)
      ({# call webkit_dom_html_button_element_get_labels #}
         (toHTMLButtonElement self))
