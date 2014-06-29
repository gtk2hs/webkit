module Graphics.UI.Gtk.WebKit.DOM.HTMLObjectElement
       (htmlObjectElementCheckValidity,
        htmlObjectElementSetCustomValidity, htmlObjectElementGetForm,
        htmlObjectElementSetCode, htmlObjectElementGetCode,
        htmlObjectElementSetAlign, htmlObjectElementGetAlign,
        htmlObjectElementSetArchive, htmlObjectElementGetArchive,
        htmlObjectElementSetBorder, htmlObjectElementGetBorder,
        htmlObjectElementSetCodeBase, htmlObjectElementGetCodeBase,
        htmlObjectElementSetCodeType, htmlObjectElementGetCodeType,
        htmlObjectElementSetData, htmlObjectElementGetData,
        htmlObjectElementSetDeclare, htmlObjectElementGetDeclare,
        htmlObjectElementSetHeight, htmlObjectElementGetHeight,
        htmlObjectElementSetHspace, htmlObjectElementGetHspace,
        htmlObjectElementSetName, htmlObjectElementGetName,
        htmlObjectElementSetStandby, htmlObjectElementGetStandby,
        htmlObjectElementSetUseMap, htmlObjectElementGetUseMap,
        htmlObjectElementSetVspace, htmlObjectElementGetVspace,
        htmlObjectElementSetWidth, htmlObjectElementGetWidth,
        htmlObjectElementGetWillValidate, htmlObjectElementGetValidity,
        htmlObjectElementGetValidationMessage,
        htmlObjectElementGetContentDocument, HTMLObjectElement,
        HTMLObjectElementClass, castToHTMLObjectElement,
        gTypeHTMLObjectElement, toHTMLObjectElement)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
htmlObjectElementCheckValidity ::
                               (HTMLObjectElementClass self) => self -> IO Bool
htmlObjectElementCheckValidity self
  = toBool <$>
      ({# call webkit_dom_html_object_element_check_validity #}
         (toHTMLObjectElement self))
 
htmlObjectElementSetCustomValidity ::
                                   (HTMLObjectElementClass self, GlibString string) =>
                                     self -> string -> IO ()
htmlObjectElementSetCustomValidity self error
  = withUTFString error $
      \ errorPtr ->
        {# call webkit_dom_html_object_element_set_custom_validity #}
          (toHTMLObjectElement self)
          errorPtr
 
htmlObjectElementGetForm ::
                         (HTMLObjectElementClass self) => self -> IO (Maybe HTMLFormElement)
htmlObjectElementGetForm self
  = maybeNull (makeNewGObject mkHTMLFormElement)
      ({# call webkit_dom_html_object_element_get_form #}
         (toHTMLObjectElement self))
 
htmlObjectElementSetCode ::
                         (HTMLObjectElementClass self, GlibString string) =>
                           self -> string -> IO ()
htmlObjectElementSetCode self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_object_element_set_code #}
          (toHTMLObjectElement self)
          valPtr
 
htmlObjectElementGetCode ::
                         (HTMLObjectElementClass self, GlibString string) =>
                           self -> IO string
htmlObjectElementGetCode self
  = ({# call webkit_dom_html_object_element_get_code #}
       (toHTMLObjectElement self))
      >>=
      readUTFString
 
htmlObjectElementSetAlign ::
                          (HTMLObjectElementClass self, GlibString string) =>
                            self -> string -> IO ()
htmlObjectElementSetAlign self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_object_element_set_align #}
          (toHTMLObjectElement self)
          valPtr
 
htmlObjectElementGetAlign ::
                          (HTMLObjectElementClass self, GlibString string) =>
                            self -> IO string
htmlObjectElementGetAlign self
  = ({# call webkit_dom_html_object_element_get_align #}
       (toHTMLObjectElement self))
      >>=
      readUTFString
 
htmlObjectElementSetArchive ::
                            (HTMLObjectElementClass self, GlibString string) =>
                              self -> string -> IO ()
htmlObjectElementSetArchive self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_object_element_set_archive #}
          (toHTMLObjectElement self)
          valPtr
 
htmlObjectElementGetArchive ::
                            (HTMLObjectElementClass self, GlibString string) =>
                              self -> IO string
htmlObjectElementGetArchive self
  = ({# call webkit_dom_html_object_element_get_archive #}
       (toHTMLObjectElement self))
      >>=
      readUTFString
 
htmlObjectElementSetBorder ::
                           (HTMLObjectElementClass self, GlibString string) =>
                             self -> string -> IO ()
htmlObjectElementSetBorder self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_object_element_set_border #}
          (toHTMLObjectElement self)
          valPtr
 
htmlObjectElementGetBorder ::
                           (HTMLObjectElementClass self, GlibString string) =>
                             self -> IO string
htmlObjectElementGetBorder self
  = ({# call webkit_dom_html_object_element_get_border #}
       (toHTMLObjectElement self))
      >>=
      readUTFString
 
htmlObjectElementSetCodeBase ::
                             (HTMLObjectElementClass self, GlibString string) =>
                               self -> string -> IO ()
htmlObjectElementSetCodeBase self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_object_element_set_code_base #}
          (toHTMLObjectElement self)
          valPtr
 
htmlObjectElementGetCodeBase ::
                             (HTMLObjectElementClass self, GlibString string) =>
                               self -> IO string
htmlObjectElementGetCodeBase self
  = ({# call webkit_dom_html_object_element_get_code_base #}
       (toHTMLObjectElement self))
      >>=
      readUTFString
 
htmlObjectElementSetCodeType ::
                             (HTMLObjectElementClass self, GlibString string) =>
                               self -> string -> IO ()
htmlObjectElementSetCodeType self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_object_element_set_code_type #}
          (toHTMLObjectElement self)
          valPtr
 
htmlObjectElementGetCodeType ::
                             (HTMLObjectElementClass self, GlibString string) =>
                               self -> IO string
htmlObjectElementGetCodeType self
  = ({# call webkit_dom_html_object_element_get_code_type #}
       (toHTMLObjectElement self))
      >>=
      readUTFString
 
htmlObjectElementSetData ::
                         (HTMLObjectElementClass self, GlibString string) =>
                           self -> string -> IO ()
htmlObjectElementSetData self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_object_element_set_data #}
          (toHTMLObjectElement self)
          valPtr
 
htmlObjectElementGetData ::
                         (HTMLObjectElementClass self, GlibString string) =>
                           self -> IO string
htmlObjectElementGetData self
  = ({# call webkit_dom_html_object_element_get_data #}
       (toHTMLObjectElement self))
      >>=
      readUTFString
 
htmlObjectElementSetDeclare ::
                            (HTMLObjectElementClass self) => self -> Bool -> IO ()
htmlObjectElementSetDeclare self val
  = {# call webkit_dom_html_object_element_set_declare #}
      (toHTMLObjectElement self)
      (fromBool val)
 
htmlObjectElementGetDeclare ::
                            (HTMLObjectElementClass self) => self -> IO Bool
htmlObjectElementGetDeclare self
  = toBool <$>
      ({# call webkit_dom_html_object_element_get_declare #}
         (toHTMLObjectElement self))
 
htmlObjectElementSetHeight ::
                           (HTMLObjectElementClass self, GlibString string) =>
                             self -> string -> IO ()
htmlObjectElementSetHeight self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_object_element_set_height #}
          (toHTMLObjectElement self)
          valPtr
 
htmlObjectElementGetHeight ::
                           (HTMLObjectElementClass self, GlibString string) =>
                             self -> IO string
htmlObjectElementGetHeight self
  = ({# call webkit_dom_html_object_element_get_height #}
       (toHTMLObjectElement self))
      >>=
      readUTFString
 
htmlObjectElementSetHspace ::
                           (HTMLObjectElementClass self) => self -> Int -> IO ()
htmlObjectElementSetHspace self val
  = {# call webkit_dom_html_object_element_set_hspace #}
      (toHTMLObjectElement self)
      (fromIntegral val)
 
htmlObjectElementGetHspace ::
                           (HTMLObjectElementClass self) => self -> IO Int
htmlObjectElementGetHspace self
  = fromIntegral <$>
      ({# call webkit_dom_html_object_element_get_hspace #}
         (toHTMLObjectElement self))
 
htmlObjectElementSetName ::
                         (HTMLObjectElementClass self, GlibString string) =>
                           self -> string -> IO ()
htmlObjectElementSetName self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_object_element_set_name #}
          (toHTMLObjectElement self)
          valPtr
 
htmlObjectElementGetName ::
                         (HTMLObjectElementClass self, GlibString string) =>
                           self -> IO string
htmlObjectElementGetName self
  = ({# call webkit_dom_html_object_element_get_name #}
       (toHTMLObjectElement self))
      >>=
      readUTFString
 
htmlObjectElementSetStandby ::
                            (HTMLObjectElementClass self, GlibString string) =>
                              self -> string -> IO ()
htmlObjectElementSetStandby self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_object_element_set_standby #}
          (toHTMLObjectElement self)
          valPtr
 
htmlObjectElementGetStandby ::
                            (HTMLObjectElementClass self, GlibString string) =>
                              self -> IO string
htmlObjectElementGetStandby self
  = ({# call webkit_dom_html_object_element_get_standby #}
       (toHTMLObjectElement self))
      >>=
      readUTFString
 
htmlObjectElementSetUseMap ::
                           (HTMLObjectElementClass self, GlibString string) =>
                             self -> string -> IO ()
htmlObjectElementSetUseMap self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_object_element_set_use_map #}
          (toHTMLObjectElement self)
          valPtr
 
htmlObjectElementGetUseMap ::
                           (HTMLObjectElementClass self, GlibString string) =>
                             self -> IO string
htmlObjectElementGetUseMap self
  = ({# call webkit_dom_html_object_element_get_use_map #}
       (toHTMLObjectElement self))
      >>=
      readUTFString
 
htmlObjectElementSetVspace ::
                           (HTMLObjectElementClass self) => self -> Int -> IO ()
htmlObjectElementSetVspace self val
  = {# call webkit_dom_html_object_element_set_vspace #}
      (toHTMLObjectElement self)
      (fromIntegral val)
 
htmlObjectElementGetVspace ::
                           (HTMLObjectElementClass self) => self -> IO Int
htmlObjectElementGetVspace self
  = fromIntegral <$>
      ({# call webkit_dom_html_object_element_get_vspace #}
         (toHTMLObjectElement self))
 
htmlObjectElementSetWidth ::
                          (HTMLObjectElementClass self, GlibString string) =>
                            self -> string -> IO ()
htmlObjectElementSetWidth self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_object_element_set_width #}
          (toHTMLObjectElement self)
          valPtr
 
htmlObjectElementGetWidth ::
                          (HTMLObjectElementClass self, GlibString string) =>
                            self -> IO string
htmlObjectElementGetWidth self
  = ({# call webkit_dom_html_object_element_get_width #}
       (toHTMLObjectElement self))
      >>=
      readUTFString
 
htmlObjectElementGetWillValidate ::
                                 (HTMLObjectElementClass self) => self -> IO Bool
htmlObjectElementGetWillValidate self
  = toBool <$>
      ({# call webkit_dom_html_object_element_get_will_validate #}
         (toHTMLObjectElement self))
 
htmlObjectElementGetValidity ::
                             (HTMLObjectElementClass self) => self -> IO (Maybe ValidityState)
htmlObjectElementGetValidity self
  = maybeNull (makeNewGObject mkValidityState)
      ({# call webkit_dom_html_object_element_get_validity #}
         (toHTMLObjectElement self))
 
htmlObjectElementGetValidationMessage ::
                                      (HTMLObjectElementClass self, GlibString string) =>
                                        self -> IO string
htmlObjectElementGetValidationMessage self
  = ({# call webkit_dom_html_object_element_get_validation_message #}
       (toHTMLObjectElement self))
      >>=
      readUTFString
 
htmlObjectElementGetContentDocument ::
                                    (HTMLObjectElementClass self) => self -> IO (Maybe Document)
htmlObjectElementGetContentDocument self
  = maybeNull (makeNewGObject mkDocument)
      ({# call webkit_dom_html_object_element_get_content_document #}
         (toHTMLObjectElement self))
