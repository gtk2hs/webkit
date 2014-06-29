module Graphics.UI.Gtk.WebKit.DOM.HTMLOptionElement
       (htmlOptionElementSetDisabled, htmlOptionElementGetDisabled,
        htmlOptionElementGetForm, htmlOptionElementSetLabel,
        htmlOptionElementGetLabel, htmlOptionElementSetDefaultSelected,
        htmlOptionElementGetDefaultSelected, htmlOptionElementSetSelected,
        htmlOptionElementGetSelected, htmlOptionElementSetValue,
        htmlOptionElementGetValue, htmlOptionElementGetText,
        htmlOptionElementGetIndex, HTMLOptionElement,
        HTMLOptionElementClass, castToHTMLOptionElement,
        gTypeHTMLOptionElement, toHTMLOptionElement)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
htmlOptionElementSetDisabled ::
                             (HTMLOptionElementClass self) => self -> Bool -> IO ()
htmlOptionElementSetDisabled self val
  = {# call webkit_dom_html_option_element_set_disabled #}
      (toHTMLOptionElement self)
      (fromBool val)
 
htmlOptionElementGetDisabled ::
                             (HTMLOptionElementClass self) => self -> IO Bool
htmlOptionElementGetDisabled self
  = toBool <$>
      ({# call webkit_dom_html_option_element_get_disabled #}
         (toHTMLOptionElement self))
 
htmlOptionElementGetForm ::
                         (HTMLOptionElementClass self) => self -> IO (Maybe HTMLFormElement)
htmlOptionElementGetForm self
  = maybeNull (makeNewGObject mkHTMLFormElement)
      ({# call webkit_dom_html_option_element_get_form #}
         (toHTMLOptionElement self))
 
htmlOptionElementSetLabel ::
                          (HTMLOptionElementClass self, GlibString string) =>
                            self -> string -> IO ()
htmlOptionElementSetLabel self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_option_element_set_label #}
          (toHTMLOptionElement self)
          valPtr
 
htmlOptionElementGetLabel ::
                          (HTMLOptionElementClass self, GlibString string) =>
                            self -> IO string
htmlOptionElementGetLabel self
  = ({# call webkit_dom_html_option_element_get_label #}
       (toHTMLOptionElement self))
      >>=
      readUTFString
 
htmlOptionElementSetDefaultSelected ::
                                    (HTMLOptionElementClass self) => self -> Bool -> IO ()
htmlOptionElementSetDefaultSelected self val
  = {# call webkit_dom_html_option_element_set_default_selected #}
      (toHTMLOptionElement self)
      (fromBool val)
 
htmlOptionElementGetDefaultSelected ::
                                    (HTMLOptionElementClass self) => self -> IO Bool
htmlOptionElementGetDefaultSelected self
  = toBool <$>
      ({# call webkit_dom_html_option_element_get_default_selected #}
         (toHTMLOptionElement self))
 
htmlOptionElementSetSelected ::
                             (HTMLOptionElementClass self) => self -> Bool -> IO ()
htmlOptionElementSetSelected self val
  = {# call webkit_dom_html_option_element_set_selected #}
      (toHTMLOptionElement self)
      (fromBool val)
 
htmlOptionElementGetSelected ::
                             (HTMLOptionElementClass self) => self -> IO Bool
htmlOptionElementGetSelected self
  = toBool <$>
      ({# call webkit_dom_html_option_element_get_selected #}
         (toHTMLOptionElement self))
 
htmlOptionElementSetValue ::
                          (HTMLOptionElementClass self, GlibString string) =>
                            self -> string -> IO ()
htmlOptionElementSetValue self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_option_element_set_value #}
          (toHTMLOptionElement self)
          valPtr
 
htmlOptionElementGetValue ::
                          (HTMLOptionElementClass self, GlibString string) =>
                            self -> IO string
htmlOptionElementGetValue self
  = ({# call webkit_dom_html_option_element_get_value #}
       (toHTMLOptionElement self))
      >>=
      readUTFString
 
htmlOptionElementGetText ::
                         (HTMLOptionElementClass self, GlibString string) =>
                           self -> IO string
htmlOptionElementGetText self
  = ({# call webkit_dom_html_option_element_get_text #}
       (toHTMLOptionElement self))
      >>=
      readUTFString
 
htmlOptionElementGetIndex ::
                          (HTMLOptionElementClass self) => self -> IO Int
htmlOptionElementGetIndex self
  = fromIntegral <$>
      ({# call webkit_dom_html_option_element_get_index #}
         (toHTMLOptionElement self))
