module Graphics.UI.Gtk.WebKit.DOM.HTMLFieldSetElement
       (htmlFieldSetElementCheckValidity,
        htmlFieldSetElementSetCustomValidity, htmlFieldSetElementGetForm,
        htmlFieldSetElementGetValidity, htmlFieldSetElementGetWillValidate,
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
 
htmlFieldSetElementGetForm ::
                           (HTMLFieldSetElementClass self) =>
                             self -> IO (Maybe HTMLFormElement)
htmlFieldSetElementGetForm self
  = maybeNull (makeNewGObject mkHTMLFormElement)
      ({# call webkit_dom_html_field_set_element_get_form #}
         (toHTMLFieldSetElement self))
 
htmlFieldSetElementGetValidity ::
                               (HTMLFieldSetElementClass self) => self -> IO (Maybe ValidityState)
htmlFieldSetElementGetValidity self
  = maybeNull (makeNewGObject mkValidityState)
      ({# call webkit_dom_html_field_set_element_get_validity #}
         (toHTMLFieldSetElement self))
 
htmlFieldSetElementGetWillValidate ::
                                   (HTMLFieldSetElementClass self) => self -> IO Bool
htmlFieldSetElementGetWillValidate self
  = toBool <$>
      ({# call webkit_dom_html_field_set_element_get_will_validate #}
         (toHTMLFieldSetElement self))
 
htmlFieldSetElementGetValidationMessage ::
                                        (HTMLFieldSetElementClass self) => self -> IO String
htmlFieldSetElementGetValidationMessage self
  = ({# call webkit_dom_html_field_set_element_get_validation_message
       #}
       (toHTMLFieldSetElement self))
      >>=
      readUTFString
