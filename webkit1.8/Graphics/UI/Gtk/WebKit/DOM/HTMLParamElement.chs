module Graphics.UI.Gtk.WebKit.DOM.HTMLParamElement
       (htmlParamElementSetName, htmlParamElementGetName,
        htmlParamElementSetValue, htmlParamElementGetValue,
        htmlParamElementSetValueType, htmlParamElementGetValueType)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
htmlParamElementSetName ::
                        (HTMLParamElementClass self) => self -> String -> IO ()
htmlParamElementSetName self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_param_element_set_name #}
          (toHTMLParamElement self)
          valPtr
 
htmlParamElementGetName ::
                        (HTMLParamElementClass self) => self -> IO String
htmlParamElementGetName self
  = ({# call webkit_dom_html_param_element_get_name #}
       (toHTMLParamElement self))
      >>=
      readUTFString
 
htmlParamElementSetValue ::
                         (HTMLParamElementClass self) => self -> String -> IO ()
htmlParamElementSetValue self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_param_element_set_value #}
          (toHTMLParamElement self)
          valPtr
 
htmlParamElementGetValue ::
                         (HTMLParamElementClass self) => self -> IO String
htmlParamElementGetValue self
  = ({# call webkit_dom_html_param_element_get_value #}
       (toHTMLParamElement self))
      >>=
      readUTFString
 
htmlParamElementSetValueType ::
                             (HTMLParamElementClass self) => self -> String -> IO ()
htmlParamElementSetValueType self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_param_element_set_value_type #}
          (toHTMLParamElement self)
          valPtr
 
htmlParamElementGetValueType ::
                             (HTMLParamElementClass self) => self -> IO String
htmlParamElementGetValueType self
  = ({# call webkit_dom_html_param_element_get_value_type #}
       (toHTMLParamElement self))
      >>=
      readUTFString
