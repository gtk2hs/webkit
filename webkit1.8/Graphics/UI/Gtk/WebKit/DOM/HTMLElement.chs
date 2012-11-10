module Graphics.UI.Gtk.WebKit.DOM.HTMLElement
       (htmlElementInsertAdjacentElement, htmlElementInsertAdjacentHTML,
        htmlElementInsertAdjacentText, htmlElementClick, htmlElementSetId,
        htmlElementGetId, htmlElementSetTitle, htmlElementGetTitle,
        htmlElementSetLang, htmlElementGetLang, htmlElementSetTranslate,
        htmlElementGetTranslate, htmlElementSetDir, htmlElementGetDir,
        htmlElementSetClassName, htmlElementGetClassName,
        htmlElementGetClassList, htmlElementSetTabIndex,
        htmlElementGetTabIndex, htmlElementSetDraggable,
        htmlElementGetDraggable, htmlElementSetWebkitdropzone,
        htmlElementGetWebkitdropzone, htmlElementSetHidden,
        htmlElementGetHidden, htmlElementSetAccessKey,
        htmlElementGetAccessKey, htmlElementSetInnerHTML,
        htmlElementGetInnerHTML, htmlElementSetInnerText,
        htmlElementGetInnerText, htmlElementSetOuterHTML,
        htmlElementGetOuterHTML, htmlElementSetOuterText,
        htmlElementGetOuterText, htmlElementGetChildren,
        htmlElementSetContentEditable, htmlElementGetContentEditable,
        htmlElementGetIsContentEditable, htmlElementSetSpellcheck,
        htmlElementGetSpellcheck, htmlElementSetItemScope,
        htmlElementGetItemScope, htmlElementGetItemType,
        htmlElementSetItemId, htmlElementGetItemId, htmlElementGetItemRef,
        htmlElementGetItemProp)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
htmlElementInsertAdjacentElement ::
                                 (HTMLElementClass self, ElementClass element) =>
                                   self -> String -> Maybe element -> IO (Maybe Element)
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
                              (HTMLElementClass self) => self -> String -> String -> IO ()
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
                              (HTMLElementClass self) => self -> String -> String -> IO ()
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
 
htmlElementSetId ::
                 (HTMLElementClass self) => self -> String -> IO ()
htmlElementSetId self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_element_set_id #} (toHTMLElement self)
          valPtr
 
htmlElementGetId :: (HTMLElementClass self) => self -> IO String
htmlElementGetId self
  = ({# call webkit_dom_html_element_get_id #} (toHTMLElement self))
      >>=
      readUTFString
 
htmlElementSetTitle ::
                    (HTMLElementClass self) => self -> String -> IO ()
htmlElementSetTitle self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_element_set_title #} (toHTMLElement self)
          valPtr
 
htmlElementGetTitle :: (HTMLElementClass self) => self -> IO String
htmlElementGetTitle self
  = ({# call webkit_dom_html_element_get_title #}
       (toHTMLElement self))
      >>=
      readUTFString
 
htmlElementSetLang ::
                   (HTMLElementClass self) => self -> String -> IO ()
htmlElementSetLang self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_element_set_lang #} (toHTMLElement self)
          valPtr
 
htmlElementGetLang :: (HTMLElementClass self) => self -> IO String
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
                  (HTMLElementClass self) => self -> String -> IO ()
htmlElementSetDir self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_element_set_dir #} (toHTMLElement self)
          valPtr
 
htmlElementGetDir :: (HTMLElementClass self) => self -> IO String
htmlElementGetDir self
  = ({# call webkit_dom_html_element_get_dir #} (toHTMLElement self))
      >>=
      readUTFString
 
htmlElementSetClassName ::
                        (HTMLElementClass self) => self -> String -> IO ()
htmlElementSetClassName self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_element_set_class_name #}
          (toHTMLElement self)
          valPtr
 
htmlElementGetClassName ::
                        (HTMLElementClass self) => self -> IO String
htmlElementGetClassName self
  = ({# call webkit_dom_html_element_get_class_name #}
       (toHTMLElement self))
      >>=
      readUTFString
 
htmlElementGetClassList ::
                        (HTMLElementClass self) => self -> IO (Maybe DOMTokenList)
htmlElementGetClassList self
  = maybeNull (makeNewGObject mkDOMTokenList)
      ({# call webkit_dom_html_element_get_class_list #}
         (toHTMLElement self))
 
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
                             (HTMLElementClass self) => self -> String -> IO ()
htmlElementSetWebkitdropzone self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_element_set_webkitdropzone #}
          (toHTMLElement self)
          valPtr
 
htmlElementGetWebkitdropzone ::
                             (HTMLElementClass self) => self -> IO String
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
                        (HTMLElementClass self) => self -> String -> IO ()
htmlElementSetAccessKey self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_element_set_access_key #}
          (toHTMLElement self)
          valPtr
 
htmlElementGetAccessKey ::
                        (HTMLElementClass self) => self -> IO String
htmlElementGetAccessKey self
  = ({# call webkit_dom_html_element_get_access_key #}
       (toHTMLElement self))
      >>=
      readUTFString
 
htmlElementSetInnerHTML ::
                        (HTMLElementClass self) => self -> String -> IO ()
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
                        (HTMLElementClass self) => self -> IO String
htmlElementGetInnerHTML self
  = ({# call webkit_dom_html_element_get_inner_html #}
       (toHTMLElement self))
      >>=
      readUTFString
 
htmlElementSetInnerText ::
                        (HTMLElementClass self) => self -> String -> IO ()
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
                        (HTMLElementClass self) => self -> IO String
htmlElementGetInnerText self
  = ({# call webkit_dom_html_element_get_inner_text #}
       (toHTMLElement self))
      >>=
      readUTFString
 
htmlElementSetOuterHTML ::
                        (HTMLElementClass self) => self -> String -> IO ()
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
                        (HTMLElementClass self) => self -> IO String
htmlElementGetOuterHTML self
  = ({# call webkit_dom_html_element_get_outer_html #}
       (toHTMLElement self))
      >>=
      readUTFString
 
htmlElementSetOuterText ::
                        (HTMLElementClass self) => self -> String -> IO ()
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
                        (HTMLElementClass self) => self -> IO String
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
                              (HTMLElementClass self) => self -> String -> IO ()
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
                              (HTMLElementClass self) => self -> IO String
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
 
htmlElementSetItemScope ::
                        (HTMLElementClass self) => self -> Bool -> IO ()
htmlElementSetItemScope self val
  = {# call webkit_dom_html_element_set_item_scope #}
      (toHTMLElement self)
      (fromBool val)
 
htmlElementGetItemScope ::
                        (HTMLElementClass self) => self -> IO Bool
htmlElementGetItemScope self
  = toBool <$>
      ({# call webkit_dom_html_element_get_item_scope #}
         (toHTMLElement self))
 
htmlElementGetItemType ::
                       (HTMLElementClass self) => self -> IO (Maybe DOMSettableTokenList)
htmlElementGetItemType self
  = maybeNull (makeNewGObject mkDOMSettableTokenList)
      ({# call webkit_dom_html_element_get_item_type #}
         (toHTMLElement self))
 
htmlElementSetItemId ::
                     (HTMLElementClass self) => self -> String -> IO ()
htmlElementSetItemId self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_element_set_item_id #} (toHTMLElement self)
          valPtr
 
htmlElementGetItemId ::
                     (HTMLElementClass self) => self -> IO String
htmlElementGetItemId self
  = ({# call webkit_dom_html_element_get_item_id #}
       (toHTMLElement self))
      >>=
      readUTFString
 
htmlElementGetItemRef ::
                      (HTMLElementClass self) => self -> IO (Maybe DOMSettableTokenList)
htmlElementGetItemRef self
  = maybeNull (makeNewGObject mkDOMSettableTokenList)
      ({# call webkit_dom_html_element_get_item_ref #}
         (toHTMLElement self))
 
htmlElementGetItemProp ::
                       (HTMLElementClass self) => self -> IO (Maybe DOMSettableTokenList)
htmlElementGetItemProp self
  = maybeNull (makeNewGObject mkDOMSettableTokenList)
      ({# call webkit_dom_html_element_get_item_prop #}
         (toHTMLElement self))
