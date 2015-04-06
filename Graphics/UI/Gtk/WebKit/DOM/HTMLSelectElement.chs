module Graphics.UI.Gtk.WebKit.DOM.HTMLSelectElement(
item,
namedItem,
add,
remove,
checkValidity,
setCustomValidity,
setAutofocus,
getAutofocus,
setDisabled,
getDisabled,
getForm,
setMultiple,
getMultiple,
setName,
getName,
setRequired,
getRequired,
setSize,
getSize,
getOptions,
setLength,
getLength,
getSelectedOptions,
setSelectedIndex,
getSelectedIndex,
setValue,
getValue,
getWillValidate,
getValidity,
getValidationMessage,
getLabels,
HTMLSelectElement,
castToHTMLSelectElement,
gTypeHTMLSelectElement,
HTMLSelectElementClass,
toHTMLSelectElement,
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

 
item ::
     (MonadIO m, HTMLSelectElementClass self) =>
       self -> Word -> m (Maybe Node)
item self index
  = liftIO
      (maybeNull (makeNewGObject mkNode)
         ({# call webkit_dom_html_select_element_item #}
            (toHTMLSelectElement self)
            (fromIntegral index)))
 
namedItem ::
          (MonadIO m, HTMLSelectElementClass self, GlibString string) =>
            self -> string -> m (Maybe Node)
namedItem self name
  = liftIO
      (maybeNull (makeNewGObject mkNode)
         (withUTFString name $
            \ namePtr ->
              {# call webkit_dom_html_select_element_named_item #}
                (toHTMLSelectElement self)
                namePtr))
 
add ::
    (MonadIO m, HTMLSelectElementClass self, HTMLElementClass element,
     HTMLElementClass before) =>
      self -> Maybe element -> Maybe before -> m ()
add self element before
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_html_select_element_add #}
             (toHTMLSelectElement self)
             (maybe (HTMLElement nullForeignPtr) toHTMLElement element)
             (maybe (HTMLElement nullForeignPtr) toHTMLElement before)
             errorPtr_)
 
remove ::
       (MonadIO m, HTMLSelectElementClass self) => self -> Int -> m ()
remove self index
  = liftIO
      ({# call webkit_dom_html_select_element_remove #}
         (toHTMLSelectElement self)
         (fromIntegral index))
 
checkValidity ::
              (MonadIO m, HTMLSelectElementClass self) => self -> m Bool
checkValidity self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_html_select_element_check_validity #}
            (toHTMLSelectElement self)))
 
setCustomValidity ::
                  (MonadIO m, HTMLSelectElementClass self, GlibString string) =>
                    self -> string -> m ()
setCustomValidity self error
  = liftIO
      (withUTFString error $
         \ errorPtr ->
           {# call webkit_dom_html_select_element_set_custom_validity #}
             (toHTMLSelectElement self)
             errorPtr)
 
setAutofocus ::
             (MonadIO m, HTMLSelectElementClass self) => self -> Bool -> m ()
setAutofocus self val
  = liftIO
      ({# call webkit_dom_html_select_element_set_autofocus #}
         (toHTMLSelectElement self)
         (fromBool val))
 
getAutofocus ::
             (MonadIO m, HTMLSelectElementClass self) => self -> m Bool
getAutofocus self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_html_select_element_get_autofocus #}
            (toHTMLSelectElement self)))
 
setDisabled ::
            (MonadIO m, HTMLSelectElementClass self) => self -> Bool -> m ()
setDisabled self val
  = liftIO
      ({# call webkit_dom_html_select_element_set_disabled #}
         (toHTMLSelectElement self)
         (fromBool val))
 
getDisabled ::
            (MonadIO m, HTMLSelectElementClass self) => self -> m Bool
getDisabled self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_html_select_element_get_disabled #}
            (toHTMLSelectElement self)))
 
getForm ::
        (MonadIO m, HTMLSelectElementClass self) =>
          self -> m (Maybe HTMLFormElement)
getForm self
  = liftIO
      (maybeNull (makeNewGObject mkHTMLFormElement)
         ({# call webkit_dom_html_select_element_get_form #}
            (toHTMLSelectElement self)))
 
setMultiple ::
            (MonadIO m, HTMLSelectElementClass self) => self -> Bool -> m ()
setMultiple self val
  = liftIO
      ({# call webkit_dom_html_select_element_set_multiple #}
         (toHTMLSelectElement self)
         (fromBool val))
 
getMultiple ::
            (MonadIO m, HTMLSelectElementClass self) => self -> m Bool
getMultiple self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_html_select_element_get_multiple #}
            (toHTMLSelectElement self)))
 
setName ::
        (MonadIO m, HTMLSelectElementClass self, GlibString string) =>
          self -> string -> m ()
setName self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_select_element_set_name #}
             (toHTMLSelectElement self)
             valPtr)
 
getName ::
        (MonadIO m, HTMLSelectElementClass self, GlibString string) =>
          self -> m string
getName self
  = liftIO
      (({# call webkit_dom_html_select_element_get_name #}
          (toHTMLSelectElement self))
         >>=
         readUTFString)
 
setRequired ::
            (MonadIO m, HTMLSelectElementClass self) => self -> Bool -> m ()
setRequired self val
  = liftIO
      ({# call webkit_dom_html_select_element_set_required #}
         (toHTMLSelectElement self)
         (fromBool val))
 
getRequired ::
            (MonadIO m, HTMLSelectElementClass self) => self -> m Bool
getRequired self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_html_select_element_get_required #}
            (toHTMLSelectElement self)))
 
setSize ::
        (MonadIO m, HTMLSelectElementClass self) => self -> Int -> m ()
setSize self val
  = liftIO
      ({# call webkit_dom_html_select_element_set_size #}
         (toHTMLSelectElement self)
         (fromIntegral val))
 
getSize ::
        (MonadIO m, HTMLSelectElementClass self) => self -> m Int
getSize self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_html_select_element_get_size #}
            (toHTMLSelectElement self)))
 
getOptions ::
           (MonadIO m, HTMLSelectElementClass self) =>
             self -> m (Maybe HTMLOptionsCollection)
getOptions self
  = liftIO
      (maybeNull (makeNewGObject mkHTMLOptionsCollection)
         ({# call webkit_dom_html_select_element_get_options #}
            (toHTMLSelectElement self)))
 
setLength ::
          (MonadIO m, HTMLSelectElementClass self) => self -> Word -> m ()
setLength self val
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_html_select_element_set_length #}
             (toHTMLSelectElement self)
             (fromIntegral val)
             errorPtr_)
 
getLength ::
          (MonadIO m, HTMLSelectElementClass self) => self -> m Word
getLength self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_html_select_element_get_length #}
            (toHTMLSelectElement self)))
 
getSelectedOptions ::
                   (MonadIO m, HTMLSelectElementClass self) =>
                     self -> m (Maybe HTMLCollection)
getSelectedOptions self
  = liftIO
      (maybeNull (makeNewGObject mkHTMLCollection)
         ({# call webkit_dom_html_select_element_get_selected_options #}
            (toHTMLSelectElement self)))
 
setSelectedIndex ::
                 (MonadIO m, HTMLSelectElementClass self) => self -> Int -> m ()
setSelectedIndex self val
  = liftIO
      ({# call webkit_dom_html_select_element_set_selected_index #}
         (toHTMLSelectElement self)
         (fromIntegral val))
 
getSelectedIndex ::
                 (MonadIO m, HTMLSelectElementClass self) => self -> m Int
getSelectedIndex self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_html_select_element_get_selected_index #}
            (toHTMLSelectElement self)))
 
setValue ::
         (MonadIO m, HTMLSelectElementClass self, GlibString string) =>
           self -> string -> m ()
setValue self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_select_element_set_value #}
             (toHTMLSelectElement self)
             valPtr)
 
getValue ::
         (MonadIO m, HTMLSelectElementClass self, GlibString string) =>
           self -> m string
getValue self
  = liftIO
      (({# call webkit_dom_html_select_element_get_value #}
          (toHTMLSelectElement self))
         >>=
         readUTFString)
 
getWillValidate ::
                (MonadIO m, HTMLSelectElementClass self) => self -> m Bool
getWillValidate self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_html_select_element_get_will_validate #}
            (toHTMLSelectElement self)))
 
getValidity ::
            (MonadIO m, HTMLSelectElementClass self) =>
              self -> m (Maybe ValidityState)
getValidity self
  = liftIO
      (maybeNull (makeNewGObject mkValidityState)
         ({# call webkit_dom_html_select_element_get_validity #}
            (toHTMLSelectElement self)))
 
getValidationMessage ::
                     (MonadIO m, HTMLSelectElementClass self, GlibString string) =>
                       self -> m string
getValidationMessage self
  = liftIO
      (({# call webkit_dom_html_select_element_get_validation_message #}
          (toHTMLSelectElement self))
         >>=
         readUTFString)
 
getLabels ::
          (MonadIO m, HTMLSelectElementClass self) =>
            self -> m (Maybe NodeList)
getLabels self
  = liftIO
      (maybeNull (makeNewGObject mkNodeList)
         ({# call webkit_dom_html_select_element_get_labels #}
            (toHTMLSelectElement self)))
