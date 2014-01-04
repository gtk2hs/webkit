module Graphics.UI.Gtk.WebKit.DOM.HTMLKeygenElement
       (htmlKeygenElementCheckValidity,
        htmlKeygenElementSetCustomValidity, htmlKeygenElementSetAutofocus,
        htmlKeygenElementGetAutofocus, htmlKeygenElementSetChallenge,
        htmlKeygenElementGetChallenge, htmlKeygenElementSetDisabled,
        htmlKeygenElementGetDisabled, htmlKeygenElementGetForm,
        htmlKeygenElementSetKeytype, htmlKeygenElementGetKeytype,
        htmlKeygenElementSetName, htmlKeygenElementGetName,
        htmlKeygenElementGetWillValidate, htmlKeygenElementGetValidity,
        htmlKeygenElementGetValidationMessage, htmlKeygenElementGetLabels,
        HTMLKeygenElement, HTMLKeygenElementClass, castToHTMLKeygenElement,
        gTypeHTMLKeygenElement, toHTMLKeygenElement)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
htmlKeygenElementCheckValidity ::
                               (HTMLKeygenElementClass self) => self -> IO Bool
htmlKeygenElementCheckValidity self
  = toBool <$>
      ({# call webkit_dom_html_keygen_element_check_validity #}
         (toHTMLKeygenElement self))
 
htmlKeygenElementSetCustomValidity ::
                                   (HTMLKeygenElementClass self) => self -> String -> IO ()
htmlKeygenElementSetCustomValidity self error
  = withUTFString error $
      \ errorPtr ->
        {# call webkit_dom_html_keygen_element_set_custom_validity #}
          (toHTMLKeygenElement self)
          errorPtr
 
htmlKeygenElementSetAutofocus ::
                              (HTMLKeygenElementClass self) => self -> Bool -> IO ()
htmlKeygenElementSetAutofocus self val
  = {# call webkit_dom_html_keygen_element_set_autofocus #}
      (toHTMLKeygenElement self)
      (fromBool val)
 
htmlKeygenElementGetAutofocus ::
                              (HTMLKeygenElementClass self) => self -> IO Bool
htmlKeygenElementGetAutofocus self
  = toBool <$>
      ({# call webkit_dom_html_keygen_element_get_autofocus #}
         (toHTMLKeygenElement self))
 
htmlKeygenElementSetChallenge ::
                              (HTMLKeygenElementClass self) => self -> String -> IO ()
htmlKeygenElementSetChallenge self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_keygen_element_set_challenge #}
          (toHTMLKeygenElement self)
          valPtr
 
htmlKeygenElementGetChallenge ::
                              (HTMLKeygenElementClass self) => self -> IO String
htmlKeygenElementGetChallenge self
  = ({# call webkit_dom_html_keygen_element_get_challenge #}
       (toHTMLKeygenElement self))
      >>=
      readUTFString
 
htmlKeygenElementSetDisabled ::
                             (HTMLKeygenElementClass self) => self -> Bool -> IO ()
htmlKeygenElementSetDisabled self val
  = {# call webkit_dom_html_keygen_element_set_disabled #}
      (toHTMLKeygenElement self)
      (fromBool val)
 
htmlKeygenElementGetDisabled ::
                             (HTMLKeygenElementClass self) => self -> IO Bool
htmlKeygenElementGetDisabled self
  = toBool <$>
      ({# call webkit_dom_html_keygen_element_get_disabled #}
         (toHTMLKeygenElement self))
 
htmlKeygenElementGetForm ::
                         (HTMLKeygenElementClass self) => self -> IO (Maybe HTMLFormElement)
htmlKeygenElementGetForm self
  = maybeNull (makeNewGObject mkHTMLFormElement)
      ({# call webkit_dom_html_keygen_element_get_form #}
         (toHTMLKeygenElement self))
 
htmlKeygenElementSetKeytype ::
                            (HTMLKeygenElementClass self) => self -> String -> IO ()
htmlKeygenElementSetKeytype self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_keygen_element_set_keytype #}
          (toHTMLKeygenElement self)
          valPtr
 
htmlKeygenElementGetKeytype ::
                            (HTMLKeygenElementClass self) => self -> IO String
htmlKeygenElementGetKeytype self
  = ({# call webkit_dom_html_keygen_element_get_keytype #}
       (toHTMLKeygenElement self))
      >>=
      readUTFString
 
htmlKeygenElementSetName ::
                         (HTMLKeygenElementClass self) => self -> String -> IO ()
htmlKeygenElementSetName self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_keygen_element_set_name #}
          (toHTMLKeygenElement self)
          valPtr
 
htmlKeygenElementGetName ::
                         (HTMLKeygenElementClass self) => self -> IO String
htmlKeygenElementGetName self
  = ({# call webkit_dom_html_keygen_element_get_name #}
       (toHTMLKeygenElement self))
      >>=
      readUTFString
 
htmlKeygenElementGetWillValidate ::
                                 (HTMLKeygenElementClass self) => self -> IO Bool
htmlKeygenElementGetWillValidate self
  = toBool <$>
      ({# call webkit_dom_html_keygen_element_get_will_validate #}
         (toHTMLKeygenElement self))
 
htmlKeygenElementGetValidity ::
                             (HTMLKeygenElementClass self) => self -> IO (Maybe ValidityState)
htmlKeygenElementGetValidity self
  = maybeNull (makeNewGObject mkValidityState)
      ({# call webkit_dom_html_keygen_element_get_validity #}
         (toHTMLKeygenElement self))
 
htmlKeygenElementGetValidationMessage ::
                                      (HTMLKeygenElementClass self) => self -> IO String
htmlKeygenElementGetValidationMessage self
  = ({# call webkit_dom_html_keygen_element_get_validation_message #}
       (toHTMLKeygenElement self))
      >>=
      readUTFString
 
htmlKeygenElementGetLabels ::
                           (HTMLKeygenElementClass self) => self -> IO (Maybe NodeList)
htmlKeygenElementGetLabels self
  = maybeNull (makeNewGObject mkNodeList)
      ({# call webkit_dom_html_keygen_element_get_labels #}
         (toHTMLKeygenElement self))
