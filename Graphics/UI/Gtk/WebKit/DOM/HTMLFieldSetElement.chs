module Graphics.UI.Gtk.WebKit.DOM.HTMLFieldSetElement
       (htmlFieldSetElementCheckValidity,
        htmlFieldSetElementSetCustomValidity,
        htmlFieldSetElementSetDisabled, htmlFieldSetElementGetDisabled,
        htmlFieldSetElementGetForm, htmlFieldSetElementSetName,
        htmlFieldSetElementGetName, htmlFieldSetElementGetElements,
        htmlFieldSetElementGetWillValidate, htmlFieldSetElementGetValidity,
        htmlFieldSetElementGetValidationMessage)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
htmlFieldSetElementCheckValidity ::
                                 (HTMLFieldSetElementClass self) => self -> IO Bool
htmlFieldSetElementCheckValidity self
  = toBool <$>
      ({# call webkit_dom_html_field_set_element_check_validity #}
         (toHTMLFieldSetElement self))
 
htmlFieldSetElementSetCustomValidity ::
                                     (HTMLFieldSetElementClass self) => self -> String -> IO ()
htmlFieldSetElementSetCustomValidity self error
  = withUTFString error $
      \ errorPtr ->
        {# call webkit_dom_html_field_set_element_set_custom_validity #}
          (toHTMLFieldSetElement self)
          errorPtr
 
htmlFieldSetElementSetDisabled ::
                               (HTMLFieldSetElementClass self) => self -> Bool -> IO ()
htmlFieldSetElementSetDisabled self val
  = {# call webkit_dom_html_field_set_element_set_disabled #}
      (toHTMLFieldSetElement self)
      (fromBool val)
 
htmlFieldSetElementGetDisabled ::
                               (HTMLFieldSetElementClass self) => self -> IO Bool
htmlFieldSetElementGetDisabled self
  = toBool <$>
      ({# call webkit_dom_html_field_set_element_get_disabled #}
         (toHTMLFieldSetElement self))
 
htmlFieldSetElementGetForm ::
                           (HTMLFieldSetElementClass self) =>
                             self -> IO (Maybe HTMLFormElement)
htmlFieldSetElementGetForm self
  = maybeNull (makeNewGObject mkHTMLFormElement)
      ({# call webkit_dom_html_field_set_element_get_form #}
         (toHTMLFieldSetElement self))
 
htmlFieldSetElementSetName ::
                           (HTMLFieldSetElementClass self) => self -> String -> IO ()
htmlFieldSetElementSetName self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_field_set_element_set_name #}
          (toHTMLFieldSetElement self)
          valPtr
 
htmlFieldSetElementGetName ::
                           (HTMLFieldSetElementClass self) => self -> IO String
htmlFieldSetElementGetName self
  = ({# call webkit_dom_html_field_set_element_get_name #}
       (toHTMLFieldSetElement self))
      >>=
      readUTFString
 
htmlFieldSetElementGetElements ::
                               (HTMLFieldSetElementClass self) =>
                                 self -> IO (Maybe HTMLCollection)
htmlFieldSetElementGetElements self
  = maybeNull (makeNewGObject mkHTMLCollection)
      ({# call webkit_dom_html_field_set_element_get_elements #}
         (toHTMLFieldSetElement self))
 
htmlFieldSetElementGetWillValidate ::
                                   (HTMLFieldSetElementClass self) => self -> IO Bool
htmlFieldSetElementGetWillValidate self
  = toBool <$>
      ({# call webkit_dom_html_field_set_element_get_will_validate #}
         (toHTMLFieldSetElement self))
 
htmlFieldSetElementGetValidity ::
                               (HTMLFieldSetElementClass self) => self -> IO (Maybe ValidityState)
htmlFieldSetElementGetValidity self
  = maybeNull (makeNewGObject mkValidityState)
      ({# call webkit_dom_html_field_set_element_get_validity #}
         (toHTMLFieldSetElement self))
 
htmlFieldSetElementGetValidationMessage ::
                                        (HTMLFieldSetElementClass self) => self -> IO String
htmlFieldSetElementGetValidationMessage self
  = ({# call webkit_dom_html_field_set_element_get_validation_message
       #}
       (toHTMLFieldSetElement self))
      >>=
      readUTFString
