module Graphics.UI.Gtk.WebKit.DOM.HTMLElement
       (htmlElementInsertAdjacentElement, htmlElementInsertAdjacentHTML,
        htmlElementInsertAdjacentText, htmlElementClick,
        htmlElementSetTitle, htmlElementGetTitle, htmlElementSetLang,
        htmlElementGetLang, htmlElementSetTranslate,
        htmlElementGetTranslate, htmlElementSetDir, htmlElementGetDir,
        htmlElementSetTabIndex, htmlElementGetTabIndex,
        htmlElementSetDraggable, htmlElementGetDraggable,
        htmlElementSetWebkitdropzone, htmlElementGetWebkitdropzone,
        htmlElementSetHidden, htmlElementGetHidden,
        htmlElementSetAccessKey, htmlElementGetAccessKey,
        htmlElementSetInnerHTML, htmlElementGetInnerHTML,
        htmlElementSetInnerText, htmlElementGetInnerText,
        htmlElementSetOuterHTML, htmlElementGetOuterHTML,
        htmlElementSetOuterText, htmlElementGetOuterText,
        htmlElementGetChildren, htmlElementSetContentEditable,
        htmlElementGetContentEditable, htmlElementGetIsContentEditable,
        htmlElementSetSpellcheck, htmlElementGetSpellcheck, HTMLElement,
        HTMLElementClass, castToHTMLElement, gTypeHTMLElement,
        toHTMLElement)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
htmlElementInsertAdjacentElement ::
                                 (HTMLElementClass self, ElementClass element, GlibString string) =>
                                   self -> string -> Maybe element -> IO (Maybe Element)
htmlElementInsertAdjacentElement self where' element
  = maybeNull (makeNewGObject mkElement)
      (propagateGError $
         \ errorPtr_ ->
           withUTFString where' $
             \ wherePtr ->
               {# call webkit_dom_html_element_insert_adjacent_element #}
                 (toHTMLElement self)
                 wherePtr
             (maybe (Element nullForeignPtr) toElement element)
             errorPtr_)
 
htmlElementInsertAdjacentHTML ::
                              (HTMLElementClass self, GlibString string) =>
                                self -> string -> string -> IO ()
htmlElementInsertAdjacentHTML self where' html
  = propagateGError $
      \ errorPtr_ ->
        withUTFString html $
          \ htmlPtr ->
            withUTFString where' $
              \ wherePtr ->
                {# call webkit_dom_html_element_insert_adjacent_html #}
                  (toHTMLElement self)
                  wherePtr
              htmlPtr
          errorPtr_
 
htmlElementInsertAdjacentText ::
                              (HTMLElementClass self, GlibString string) =>
                                self -> string -> string -> IO ()
htmlElementInsertAdjacentText self where' text
  = propagateGError $
      \ errorPtr_ ->
        withUTFString text $
          \ textPtr ->
            withUTFString where' $
              \ wherePtr ->
                {# call webkit_dom_html_element_insert_adjacent_text #}
                  (toHTMLElement self)
                  wherePtr
              textPtr
          errorPtr_
 
htmlElementClick :: (HTMLElementClass self) => self -> IO ()
htmlElementClick self
  = {# call webkit_dom_html_element_click #} (toHTMLElement self)
 
htmlElementSetTitle ::
                    (HTMLElementClass self, GlibString string) =>
                      self -> string -> IO ()
htmlElementSetTitle self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_element_set_title #} (toHTMLElement self)
          valPtr
 
htmlElementGetTitle ::
                    (HTMLElementClass self, GlibString string) => self -> IO string
htmlElementGetTitle self
  = ({# call webkit_dom_html_element_get_title #}
       (toHTMLElement self))
      >>=
      readUTFString
 
htmlElementSetLang ::
                   (HTMLElementClass self, GlibString string) =>
                     self -> string -> IO ()
htmlElementSetLang self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_element_set_lang #} (toHTMLElement self)
          valPtr
 
htmlElementGetLang ::
                   (HTMLElementClass self, GlibString string) => self -> IO string
htmlElementGetLang self
  = ({# call webkit_dom_html_element_get_lang #}
       (toHTMLElement self))
      >>=
      readUTFString
 
htmlElementSetTranslate ::
                        (HTMLElementClass self) => self -> Bool -> IO ()
htmlElementSetTranslate self val
  = {# call webkit_dom_html_element_set_translate #}
      (toHTMLElement self)
      (fromBool val)
 
htmlElementGetTranslate ::
                        (HTMLElementClass self) => self -> IO Bool
htmlElementGetTranslate self
  = toBool <$>
      ({# call webkit_dom_html_element_get_translate #}
         (toHTMLElement self))
 
htmlElementSetDir ::
                  (HTMLElementClass self, GlibString string) =>
                    self -> string -> IO ()
htmlElementSetDir self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_element_set_dir #} (toHTMLElement self)
          valPtr
 
htmlElementGetDir ::
                  (HTMLElementClass self, GlibString string) => self -> IO string
htmlElementGetDir self
  = ({# call webkit_dom_html_element_get_dir #} (toHTMLElement self))
      >>=
      readUTFString
 
htmlElementSetTabIndex ::
                       (HTMLElementClass self) => self -> Int -> IO ()
htmlElementSetTabIndex self val
  = {# call webkit_dom_html_element_set_tab_index #}
      (toHTMLElement self)
      (fromIntegral val)
 
htmlElementGetTabIndex :: (HTMLElementClass self) => self -> IO Int
htmlElementGetTabIndex self
  = fromIntegral <$>
      ({# call webkit_dom_html_element_get_tab_index #}
         (toHTMLElement self))
 
htmlElementSetDraggable ::
                        (HTMLElementClass self) => self -> Bool -> IO ()
htmlElementSetDraggable self val
  = {# call webkit_dom_html_element_set_draggable #}
      (toHTMLElement self)
      (fromBool val)
 
htmlElementGetDraggable ::
                        (HTMLElementClass self) => self -> IO Bool
htmlElementGetDraggable self
  = toBool <$>
      ({# call webkit_dom_html_element_get_draggable #}
         (toHTMLElement self))
 
htmlElementSetWebkitdropzone ::
                             (HTMLElementClass self, GlibString string) =>
                               self -> string -> IO ()
htmlElementSetWebkitdropzone self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_element_set_webkitdropzone #}
          (toHTMLElement self)
          valPtr
 
htmlElementGetWebkitdropzone ::
                             (HTMLElementClass self, GlibString string) => self -> IO string
htmlElementGetWebkitdropzone self
  = ({# call webkit_dom_html_element_get_webkitdropzone #}
       (toHTMLElement self))
      >>=
      readUTFString
 
htmlElementSetHidden ::
                     (HTMLElementClass self) => self -> Bool -> IO ()
htmlElementSetHidden self val
  = {# call webkit_dom_html_element_set_hidden #}
      (toHTMLElement self)
      (fromBool val)
 
htmlElementGetHidden :: (HTMLElementClass self) => self -> IO Bool
htmlElementGetHidden self
  = toBool <$>
      ({# call webkit_dom_html_element_get_hidden #}
         (toHTMLElement self))
 
htmlElementSetAccessKey ::
                        (HTMLElementClass self, GlibString string) =>
                          self -> string -> IO ()
htmlElementSetAccessKey self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_element_set_access_key #}
          (toHTMLElement self)
          valPtr
 
htmlElementGetAccessKey ::
                        (HTMLElementClass self, GlibString string) => self -> IO string
htmlElementGetAccessKey self
  = ({# call webkit_dom_html_element_get_access_key #}
       (toHTMLElement self))
      >>=
      readUTFString
 
htmlElementSetInnerHTML ::
                        (HTMLElementClass self, GlibString string) =>
                          self -> string -> IO ()
htmlElementSetInnerHTML self val
  = propagateGError $
      \ errorPtr_ ->
        withUTFString val $
          \ valPtr ->
            {# call webkit_dom_html_element_set_inner_html #}
              (toHTMLElement self)
              valPtr
          errorPtr_
 
htmlElementGetInnerHTML ::
                        (HTMLElementClass self, GlibString string) => self -> IO string
htmlElementGetInnerHTML self
  = ({# call webkit_dom_html_element_get_inner_html #}
       (toHTMLElement self))
      >>=
      readUTFString
 
htmlElementSetInnerText ::
                        (HTMLElementClass self, GlibString string) =>
                          self -> string -> IO ()
htmlElementSetInnerText self val
  = propagateGError $
      \ errorPtr_ ->
        withUTFString val $
          \ valPtr ->
            {# call webkit_dom_html_element_set_inner_text #}
              (toHTMLElement self)
              valPtr
          errorPtr_
 
htmlElementGetInnerText ::
                        (HTMLElementClass self, GlibString string) => self -> IO string
htmlElementGetInnerText self
  = ({# call webkit_dom_html_element_get_inner_text #}
       (toHTMLElement self))
      >>=
      readUTFString
 
htmlElementSetOuterHTML ::
                        (HTMLElementClass self, GlibString string) =>
                          self -> string -> IO ()
htmlElementSetOuterHTML self val
  = propagateGError $
      \ errorPtr_ ->
        withUTFString val $
          \ valPtr ->
            {# call webkit_dom_html_element_set_outer_html #}
              (toHTMLElement self)
              valPtr
          errorPtr_
 
htmlElementGetOuterHTML ::
                        (HTMLElementClass self, GlibString string) => self -> IO string
htmlElementGetOuterHTML self
  = ({# call webkit_dom_html_element_get_outer_html #}
       (toHTMLElement self))
      >>=
      readUTFString
 
htmlElementSetOuterText ::
                        (HTMLElementClass self, GlibString string) =>
                          self -> string -> IO ()
htmlElementSetOuterText self val
  = propagateGError $
      \ errorPtr_ ->
        withUTFString val $
          \ valPtr ->
            {# call webkit_dom_html_element_set_outer_text #}
              (toHTMLElement self)
              valPtr
          errorPtr_
 
htmlElementGetOuterText ::
                        (HTMLElementClass self, GlibString string) => self -> IO string
htmlElementGetOuterText self
  = ({# call webkit_dom_html_element_get_outer_text #}
       (toHTMLElement self))
      >>=
      readUTFString
 
htmlElementGetChildren ::
                       (HTMLElementClass self) => self -> IO (Maybe HTMLCollection)
htmlElementGetChildren self
  = maybeNull (makeNewGObject mkHTMLCollection)
      ({# call webkit_dom_html_element_get_children #}
         (toHTMLElement self))
 
htmlElementSetContentEditable ::
                              (HTMLElementClass self, GlibString string) =>
                                self -> string -> IO ()
htmlElementSetContentEditable self val
  = propagateGError $
      \ errorPtr_ ->
        withUTFString val $
          \ valPtr ->
            {# call webkit_dom_html_element_set_content_editable #}
              (toHTMLElement self)
              valPtr
          errorPtr_
 
htmlElementGetContentEditable ::
                              (HTMLElementClass self, GlibString string) => self -> IO string
htmlElementGetContentEditable self
  = ({# call webkit_dom_html_element_get_content_editable #}
       (toHTMLElement self))
      >>=
      readUTFString
 
htmlElementGetIsContentEditable ::
                                (HTMLElementClass self) => self -> IO Bool
htmlElementGetIsContentEditable self
  = toBool <$>
      ({# call webkit_dom_html_element_get_is_content_editable #}
         (toHTMLElement self))
 
htmlElementSetSpellcheck ::
                         (HTMLElementClass self) => self -> Bool -> IO ()
htmlElementSetSpellcheck self val
  = {# call webkit_dom_html_element_set_spellcheck #}
      (toHTMLElement self)
      (fromBool val)
 
htmlElementGetSpellcheck ::
                         (HTMLElementClass self) => self -> IO Bool
htmlElementGetSpellcheck self
  = toBool <$>
      ({# call webkit_dom_html_element_get_spellcheck #}
         (toHTMLElement self))
