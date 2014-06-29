module Graphics.UI.Gtk.WebKit.DOM.HTMLFormElement
       (htmlFormElementSubmit, htmlFormElementReset,
        htmlFormElementCheckValidity, htmlFormElementSetAcceptCharset,
        htmlFormElementGetAcceptCharset, htmlFormElementSetAction,
        htmlFormElementGetAction, htmlFormElementSetAutocomplete,
        htmlFormElementGetAutocomplete, htmlFormElementSetEnctype,
        htmlFormElementGetEnctype, htmlFormElementSetEncoding,
        htmlFormElementGetEncoding, htmlFormElementSetMethod,
        htmlFormElementGetMethod, htmlFormElementSetName,
        htmlFormElementGetName, htmlFormElementSetNoValidate,
        htmlFormElementGetNoValidate, htmlFormElementSetTarget,
        htmlFormElementGetTarget, htmlFormElementGetElements,
        htmlFormElementGetLength, HTMLFormElement, HTMLFormElementClass,
        castToHTMLFormElement, gTypeHTMLFormElement, toHTMLFormElement)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
htmlFormElementSubmit ::
                      (HTMLFormElementClass self) => self -> IO ()
htmlFormElementSubmit self
  = {# call webkit_dom_html_form_element_submit #}
      (toHTMLFormElement self)
 
htmlFormElementReset ::
                     (HTMLFormElementClass self) => self -> IO ()
htmlFormElementReset self
  = {# call webkit_dom_html_form_element_reset #}
      (toHTMLFormElement self)
 
htmlFormElementCheckValidity ::
                             (HTMLFormElementClass self) => self -> IO Bool
htmlFormElementCheckValidity self
  = toBool <$>
      ({# call webkit_dom_html_form_element_check_validity #}
         (toHTMLFormElement self))
 
htmlFormElementSetAcceptCharset ::
                                (HTMLFormElementClass self, GlibString string) =>
                                  self -> string -> IO ()
htmlFormElementSetAcceptCharset self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_form_element_set_accept_charset #}
          (toHTMLFormElement self)
          valPtr
 
htmlFormElementGetAcceptCharset ::
                                (HTMLFormElementClass self, GlibString string) => self -> IO string
htmlFormElementGetAcceptCharset self
  = ({# call webkit_dom_html_form_element_get_accept_charset #}
       (toHTMLFormElement self))
      >>=
      readUTFString
 
htmlFormElementSetAction ::
                         (HTMLFormElementClass self, GlibString string) =>
                           self -> string -> IO ()
htmlFormElementSetAction self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_form_element_set_action #}
          (toHTMLFormElement self)
          valPtr
 
htmlFormElementGetAction ::
                         (HTMLFormElementClass self, GlibString string) => self -> IO string
htmlFormElementGetAction self
  = ({# call webkit_dom_html_form_element_get_action #}
       (toHTMLFormElement self))
      >>=
      readUTFString
 
htmlFormElementSetAutocomplete ::
                               (HTMLFormElementClass self, GlibString string) =>
                                 self -> string -> IO ()
htmlFormElementSetAutocomplete self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_form_element_set_autocomplete #}
          (toHTMLFormElement self)
          valPtr
 
htmlFormElementGetAutocomplete ::
                               (HTMLFormElementClass self, GlibString string) => self -> IO string
htmlFormElementGetAutocomplete self
  = ({# call webkit_dom_html_form_element_get_autocomplete #}
       (toHTMLFormElement self))
      >>=
      readUTFString
 
htmlFormElementSetEnctype ::
                          (HTMLFormElementClass self, GlibString string) =>
                            self -> string -> IO ()
htmlFormElementSetEnctype self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_form_element_set_enctype #}
          (toHTMLFormElement self)
          valPtr
 
htmlFormElementGetEnctype ::
                          (HTMLFormElementClass self, GlibString string) => self -> IO string
htmlFormElementGetEnctype self
  = ({# call webkit_dom_html_form_element_get_enctype #}
       (toHTMLFormElement self))
      >>=
      readUTFString
 
htmlFormElementSetEncoding ::
                           (HTMLFormElementClass self, GlibString string) =>
                             self -> string -> IO ()
htmlFormElementSetEncoding self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_form_element_set_encoding #}
          (toHTMLFormElement self)
          valPtr
 
htmlFormElementGetEncoding ::
                           (HTMLFormElementClass self, GlibString string) => self -> IO string
htmlFormElementGetEncoding self
  = ({# call webkit_dom_html_form_element_get_encoding #}
       (toHTMLFormElement self))
      >>=
      readUTFString
 
htmlFormElementSetMethod ::
                         (HTMLFormElementClass self, GlibString string) =>
                           self -> string -> IO ()
htmlFormElementSetMethod self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_form_element_set_method #}
          (toHTMLFormElement self)
          valPtr
 
htmlFormElementGetMethod ::
                         (HTMLFormElementClass self, GlibString string) => self -> IO string
htmlFormElementGetMethod self
  = ({# call webkit_dom_html_form_element_get_method #}
       (toHTMLFormElement self))
      >>=
      readUTFString
 
htmlFormElementSetName ::
                       (HTMLFormElementClass self, GlibString string) =>
                         self -> string -> IO ()
htmlFormElementSetName self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_form_element_set_name #}
          (toHTMLFormElement self)
          valPtr
 
htmlFormElementGetName ::
                       (HTMLFormElementClass self, GlibString string) => self -> IO string
htmlFormElementGetName self
  = ({# call webkit_dom_html_form_element_get_name #}
       (toHTMLFormElement self))
      >>=
      readUTFString
 
htmlFormElementSetNoValidate ::
                             (HTMLFormElementClass self) => self -> Bool -> IO ()
htmlFormElementSetNoValidate self val
  = {# call webkit_dom_html_form_element_set_no_validate #}
      (toHTMLFormElement self)
      (fromBool val)
 
htmlFormElementGetNoValidate ::
                             (HTMLFormElementClass self) => self -> IO Bool
htmlFormElementGetNoValidate self
  = toBool <$>
      ({# call webkit_dom_html_form_element_get_no_validate #}
         (toHTMLFormElement self))
 
htmlFormElementSetTarget ::
                         (HTMLFormElementClass self, GlibString string) =>
                           self -> string -> IO ()
htmlFormElementSetTarget self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_form_element_set_target #}
          (toHTMLFormElement self)
          valPtr
 
htmlFormElementGetTarget ::
                         (HTMLFormElementClass self, GlibString string) => self -> IO string
htmlFormElementGetTarget self
  = ({# call webkit_dom_html_form_element_get_target #}
       (toHTMLFormElement self))
      >>=
      readUTFString
 
htmlFormElementGetElements ::
                           (HTMLFormElementClass self) => self -> IO (Maybe HTMLCollection)
htmlFormElementGetElements self
  = maybeNull (makeNewGObject mkHTMLCollection)
      ({# call webkit_dom_html_form_element_get_elements #}
         (toHTMLFormElement self))
 
htmlFormElementGetLength ::
                         (HTMLFormElementClass self) => self -> IO Int
htmlFormElementGetLength self
  = fromIntegral <$>
      ({# call webkit_dom_html_form_element_get_length #}
         (toHTMLFormElement self))
