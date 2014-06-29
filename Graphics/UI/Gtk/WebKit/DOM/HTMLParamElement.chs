module Graphics.UI.Gtk.WebKit.DOM.HTMLParamElement
       (htmlParamElementSetName, htmlParamElementGetName,
        htmlParamElementSetValue, htmlParamElementGetValue,
        htmlParamElementSetValueType, htmlParamElementGetValueType,
        HTMLParamElement, HTMLParamElementClass, castToHTMLParamElement,
        gTypeHTMLParamElement, toHTMLParamElement)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
htmlParamElementSetName ::
                        (HTMLParamElementClass self, GlibString string) =>
                          self -> string -> IO ()
htmlParamElementSetName self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_param_element_set_name #}
          (toHTMLParamElement self)
          valPtr
 
htmlParamElementGetName ::
                        (HTMLParamElementClass self, GlibString string) =>
                          self -> IO string
htmlParamElementGetName self
  = ({# call webkit_dom_html_param_element_get_name #}
       (toHTMLParamElement self))
      >>=
      readUTFString
 
htmlParamElementSetValue ::
                         (HTMLParamElementClass self, GlibString string) =>
                           self -> string -> IO ()
htmlParamElementSetValue self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_param_element_set_value #}
          (toHTMLParamElement self)
          valPtr
 
htmlParamElementGetValue ::
                         (HTMLParamElementClass self, GlibString string) =>
                           self -> IO string
htmlParamElementGetValue self
  = ({# call webkit_dom_html_param_element_get_value #}
       (toHTMLParamElement self))
      >>=
      readUTFString
 
htmlParamElementSetValueType ::
                             (HTMLParamElementClass self, GlibString string) =>
                               self -> string -> IO ()
htmlParamElementSetValueType self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_param_element_set_value_type #}
          (toHTMLParamElement self)
          valPtr
 
htmlParamElementGetValueType ::
                             (HTMLParamElementClass self, GlibString string) =>
                               self -> IO string
htmlParamElementGetValueType self
  = ({# call webkit_dom_html_param_element_get_value_type #}
       (toHTMLParamElement self))
      >>=
      readUTFString
