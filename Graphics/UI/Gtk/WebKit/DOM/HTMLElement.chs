module Graphics.UI.Gtk.WebKit.DOM.HTMLElement(
insertAdjacentElement,
insertAdjacentHTML,
insertAdjacentText,
click,
setTitle,
getTitle,
setLang,
getLang,
setTranslate,
getTranslate,
setDir,
getDir,
setTabIndex,
getTabIndex,
setDraggable,
getDraggable,
setWebkitdropzone,
getWebkitdropzone,
setHidden,
getHidden,
setAccessKey,
getAccessKey,
setInnerText,
getInnerText,
setOuterText,
getOuterText,
getChildren,
setContentEditable,
getContentEditable,
getIsContentEditable,
setSpellcheck,
getSpellcheck,
HTMLElement,
castToHTMLElement,
gTypeHTMLElement,
HTMLElementClass,
toHTMLElement,
) where
import Prelude hiding (drop, error, print)
import System.Glib.FFI (maybeNull, withForeignPtr, nullForeignPtr, Ptr, nullPtr, castPtr, Word, Int64, Word64, CChar(..), CInt(..), CUInt(..), CLong(..), CULong(..), CShort(..), CUShort(..), CFloat(..), CDouble(..), toBool, fromBool)
import System.Glib.UTFString (GlibString(..), readUTFString)
import Control.Applicative ((<$>))
import Control.Monad (void)
import Control.Monad.IO.Class (MonadIO(..))
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventTargetClosures
import Graphics.UI.Gtk.WebKit.DOM.EventM
{#import Graphics.UI.Gtk.WebKit.Types#}
import Graphics.UI.Gtk.WebKit.DOM.Enums

 
insertAdjacentElement ::
                      (MonadIO m, HTMLElementClass self, ElementClass element,
                       GlibString string) =>
                        self -> string -> Maybe element -> m (Maybe Element)
insertAdjacentElement self where' element
  = liftIO
      (maybeNull (makeNewGObject mkElement)
         (propagateGError $
            \ errorPtr_ ->
              withUTFString where' $
                \ wherePtr ->
                  {# call webkit_dom_html_element_insert_adjacent_element #}
                    (toHTMLElement self)
                    wherePtr
                (maybe (Element nullForeignPtr) toElement element)
                errorPtr_))
 
insertAdjacentHTML ::
                   (MonadIO m, HTMLElementClass self, GlibString string) =>
                     self -> string -> string -> m ()
insertAdjacentHTML self where' html
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           withUTFString html $
             \ htmlPtr ->
               withUTFString where' $
                 \ wherePtr ->
                   {# call webkit_dom_html_element_insert_adjacent_html #}
                     (toHTMLElement self)
                     wherePtr
                 htmlPtr
             errorPtr_)
 
insertAdjacentText ::
                   (MonadIO m, HTMLElementClass self, GlibString string) =>
                     self -> string -> string -> m ()
insertAdjacentText self where' text
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           withUTFString text $
             \ textPtr ->
               withUTFString where' $
                 \ wherePtr ->
                   {# call webkit_dom_html_element_insert_adjacent_text #}
                     (toHTMLElement self)
                     wherePtr
                 textPtr
             errorPtr_)
 
click :: (MonadIO m, HTMLElementClass self) => self -> m ()
click self
  = liftIO
      ({# call webkit_dom_html_element_click #} (toHTMLElement self))
 
setTitle ::
         (MonadIO m, HTMLElementClass self, GlibString string) =>
           self -> string -> m ()
setTitle self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_element_set_title #} (toHTMLElement self)
             valPtr)
 
getTitle ::
         (MonadIO m, HTMLElementClass self, GlibString string) =>
           self -> m string
getTitle self
  = liftIO
      (({# call webkit_dom_html_element_get_title #}
          (toHTMLElement self))
         >>=
         readUTFString)
 
setLang ::
        (MonadIO m, HTMLElementClass self, GlibString string) =>
          self -> string -> m ()
setLang self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_element_set_lang #} (toHTMLElement self)
             valPtr)
 
getLang ::
        (MonadIO m, HTMLElementClass self, GlibString string) =>
          self -> m string
getLang self
  = liftIO
      (({# call webkit_dom_html_element_get_lang #} (toHTMLElement self))
         >>=
         readUTFString)
 
setTranslate ::
             (MonadIO m, HTMLElementClass self) => self -> Bool -> m ()
setTranslate self val
  = liftIO
      ({# call webkit_dom_html_element_set_translate #}
         (toHTMLElement self)
         (fromBool val))
 
getTranslate ::
             (MonadIO m, HTMLElementClass self) => self -> m Bool
getTranslate self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_html_element_get_translate #}
            (toHTMLElement self)))
 
setDir ::
       (MonadIO m, HTMLElementClass self, GlibString string) =>
         self -> string -> m ()
setDir self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_element_set_dir #} (toHTMLElement self)
             valPtr)
 
getDir ::
       (MonadIO m, HTMLElementClass self, GlibString string) =>
         self -> m string
getDir self
  = liftIO
      (({# call webkit_dom_html_element_get_dir #} (toHTMLElement self))
         >>=
         readUTFString)
 
setTabIndex ::
            (MonadIO m, HTMLElementClass self) => self -> Int -> m ()
setTabIndex self val
  = liftIO
      ({# call webkit_dom_html_element_set_tab_index #}
         (toHTMLElement self)
         (fromIntegral val))
 
getTabIndex :: (MonadIO m, HTMLElementClass self) => self -> m Int
getTabIndex self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_html_element_get_tab_index #}
            (toHTMLElement self)))
 
setDraggable ::
             (MonadIO m, HTMLElementClass self) => self -> Bool -> m ()
setDraggable self val
  = liftIO
      ({# call webkit_dom_html_element_set_draggable #}
         (toHTMLElement self)
         (fromBool val))
 
getDraggable ::
             (MonadIO m, HTMLElementClass self) => self -> m Bool
getDraggable self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_html_element_get_draggable #}
            (toHTMLElement self)))
 
setWebkitdropzone ::
                  (MonadIO m, HTMLElementClass self, GlibString string) =>
                    self -> string -> m ()
setWebkitdropzone self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_element_set_webkitdropzone #}
             (toHTMLElement self)
             valPtr)
 
getWebkitdropzone ::
                  (MonadIO m, HTMLElementClass self, GlibString string) =>
                    self -> m string
getWebkitdropzone self
  = liftIO
      (({# call webkit_dom_html_element_get_webkitdropzone #}
          (toHTMLElement self))
         >>=
         readUTFString)
 
setHidden ::
          (MonadIO m, HTMLElementClass self) => self -> Bool -> m ()
setHidden self val
  = liftIO
      ({# call webkit_dom_html_element_set_hidden #} (toHTMLElement self)
         (fromBool val))
 
getHidden :: (MonadIO m, HTMLElementClass self) => self -> m Bool
getHidden self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_html_element_get_hidden #}
            (toHTMLElement self)))
 
setAccessKey ::
             (MonadIO m, HTMLElementClass self, GlibString string) =>
               self -> string -> m ()
setAccessKey self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_element_set_access_key #}
             (toHTMLElement self)
             valPtr)
 
getAccessKey ::
             (MonadIO m, HTMLElementClass self, GlibString string) =>
               self -> m string
getAccessKey self
  = liftIO
      (({# call webkit_dom_html_element_get_access_key #}
          (toHTMLElement self))
         >>=
         readUTFString)
 
setInnerText ::
             (MonadIO m, HTMLElementClass self, GlibString string) =>
               self -> string -> m ()
setInnerText self val
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           withUTFString val $
             \ valPtr ->
               {# call webkit_dom_html_element_set_inner_text #}
                 (toHTMLElement self)
                 valPtr
             errorPtr_)
 
getInnerText ::
             (MonadIO m, HTMLElementClass self, GlibString string) =>
               self -> m string
getInnerText self
  = liftIO
      (({# call webkit_dom_html_element_get_inner_text #}
          (toHTMLElement self))
         >>=
         readUTFString)
 
setOuterText ::
             (MonadIO m, HTMLElementClass self, GlibString string) =>
               self -> string -> m ()
setOuterText self val
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           withUTFString val $
             \ valPtr ->
               {# call webkit_dom_html_element_set_outer_text #}
                 (toHTMLElement self)
                 valPtr
             errorPtr_)
 
getOuterText ::
             (MonadIO m, HTMLElementClass self, GlibString string) =>
               self -> m string
getOuterText self
  = liftIO
      (({# call webkit_dom_html_element_get_outer_text #}
          (toHTMLElement self))
         >>=
         readUTFString)
 
getChildren ::
            (MonadIO m, HTMLElementClass self) =>
              self -> m (Maybe HTMLCollection)
getChildren self
  = liftIO
      (maybeNull (makeNewGObject mkHTMLCollection)
         ({# call webkit_dom_html_element_get_children #}
            (toHTMLElement self)))
 
setContentEditable ::
                   (MonadIO m, HTMLElementClass self, GlibString string) =>
                     self -> string -> m ()
setContentEditable self val
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           withUTFString val $
             \ valPtr ->
               {# call webkit_dom_html_element_set_content_editable #}
                 (toHTMLElement self)
                 valPtr
             errorPtr_)
 
getContentEditable ::
                   (MonadIO m, HTMLElementClass self, GlibString string) =>
                     self -> m string
getContentEditable self
  = liftIO
      (({# call webkit_dom_html_element_get_content_editable #}
          (toHTMLElement self))
         >>=
         readUTFString)
 
getIsContentEditable ::
                     (MonadIO m, HTMLElementClass self) => self -> m Bool
getIsContentEditable self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_html_element_get_is_content_editable #}
            (toHTMLElement self)))
 
setSpellcheck ::
              (MonadIO m, HTMLElementClass self) => self -> Bool -> m ()
setSpellcheck self val
  = liftIO
      ({# call webkit_dom_html_element_set_spellcheck #}
         (toHTMLElement self)
         (fromBool val))
 
getSpellcheck ::
              (MonadIO m, HTMLElementClass self) => self -> m Bool
getSpellcheck self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_html_element_get_spellcheck #}
            (toHTMLElement self)))
