module Graphics.UI.Gtk.WebKit.DOM.HTMLKeygenElement(
checkValidity,
setCustomValidity,
setAutofocus,
getAutofocus,
setChallenge,
getChallenge,
setDisabled,
getDisabled,
getForm,
setKeytype,
getKeytype,
setName,
getName,
getWillValidate,
getValidity,
getValidationMessage,
getLabels,
HTMLKeygenElement,
castToHTMLKeygenElement,
gTypeHTMLKeygenElement,
HTMLKeygenElementClass,
toHTMLKeygenElement,
) where
import Prelude hiding (drop, error, print)
import Data.Typeable (Typeable)
import Foreign.Marshal (maybePeek, maybeWith)
import System.Glib.FFI (maybeNull, withForeignPtr, nullForeignPtr, Ptr, nullPtr, castPtr, Word, Int64, Word64, CChar(..), CInt(..), CUInt(..), CLong(..), CULong(..), CLLong(..), CULLong(..), CShort(..), CUShort(..), CFloat(..), CDouble(..), toBool, fromBool)
import System.Glib.UTFString (GlibString(..), readUTFString)
import Control.Applicative ((<$>))
import Control.Monad (void)
import Control.Monad.IO.Class (MonadIO(..))
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventTargetClosures
import Graphics.UI.Gtk.WebKit.DOM.EventM
{#import Graphics.UI.Gtk.WebKit.Types#}
import Graphics.UI.Gtk.WebKit.DOM.Enums

 
checkValidity ::
              (MonadIO m, HTMLKeygenElementClass self) => self -> m Bool
checkValidity self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_html_keygen_element_check_validity #}
            (toHTMLKeygenElement self)))
 
setCustomValidity ::
                  (MonadIO m, HTMLKeygenElementClass self, GlibString string) =>
                    self -> (Maybe string) -> m ()
setCustomValidity self error
  = liftIO
      (maybeWith withUTFString error $
         \ errorPtr ->
           {# call webkit_dom_html_keygen_element_set_custom_validity #}
             (toHTMLKeygenElement self)
             errorPtr)
 
setAutofocus ::
             (MonadIO m, HTMLKeygenElementClass self) => self -> Bool -> m ()
setAutofocus self val
  = liftIO
      ({# call webkit_dom_html_keygen_element_set_autofocus #}
         (toHTMLKeygenElement self)
         (fromBool val))
 
getAutofocus ::
             (MonadIO m, HTMLKeygenElementClass self) => self -> m Bool
getAutofocus self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_html_keygen_element_get_autofocus #}
            (toHTMLKeygenElement self)))
 
setChallenge ::
             (MonadIO m, HTMLKeygenElementClass self, GlibString string) =>
               self -> string -> m ()
setChallenge self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_keygen_element_set_challenge #}
             (toHTMLKeygenElement self)
             valPtr)
 
getChallenge ::
             (MonadIO m, HTMLKeygenElementClass self, GlibString string) =>
               self -> m string
getChallenge self
  = liftIO
      (({# call webkit_dom_html_keygen_element_get_challenge #}
          (toHTMLKeygenElement self))
         >>=
         readUTFString)
 
setDisabled ::
            (MonadIO m, HTMLKeygenElementClass self) => self -> Bool -> m ()
setDisabled self val
  = liftIO
      ({# call webkit_dom_html_keygen_element_set_disabled #}
         (toHTMLKeygenElement self)
         (fromBool val))
 
getDisabled ::
            (MonadIO m, HTMLKeygenElementClass self) => self -> m Bool
getDisabled self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_html_keygen_element_get_disabled #}
            (toHTMLKeygenElement self)))
 
getForm ::
        (MonadIO m, HTMLKeygenElementClass self) =>
          self -> m (Maybe HTMLFormElement)
getForm self
  = liftIO
      (maybeNull (makeNewGObject mkHTMLFormElement)
         ({# call webkit_dom_html_keygen_element_get_form #}
            (toHTMLKeygenElement self)))
 
setKeytype ::
           (MonadIO m, HTMLKeygenElementClass self, GlibString string) =>
             self -> string -> m ()
setKeytype self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_keygen_element_set_keytype #}
             (toHTMLKeygenElement self)
             valPtr)
 
getKeytype ::
           (MonadIO m, HTMLKeygenElementClass self, GlibString string) =>
             self -> m string
getKeytype self
  = liftIO
      (({# call webkit_dom_html_keygen_element_get_keytype #}
          (toHTMLKeygenElement self))
         >>=
         readUTFString)
 
setName ::
        (MonadIO m, HTMLKeygenElementClass self, GlibString string) =>
          self -> string -> m ()
setName self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_keygen_element_set_name #}
             (toHTMLKeygenElement self)
             valPtr)
 
getName ::
        (MonadIO m, HTMLKeygenElementClass self, GlibString string) =>
          self -> m string
getName self
  = liftIO
      (({# call webkit_dom_html_keygen_element_get_name #}
          (toHTMLKeygenElement self))
         >>=
         readUTFString)
 
getWillValidate ::
                (MonadIO m, HTMLKeygenElementClass self) => self -> m Bool
getWillValidate self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_html_keygen_element_get_will_validate #}
            (toHTMLKeygenElement self)))
 
getValidity ::
            (MonadIO m, HTMLKeygenElementClass self) =>
              self -> m (Maybe ValidityState)
getValidity self
  = liftIO
      (maybeNull (makeNewGObject mkValidityState)
         ({# call webkit_dom_html_keygen_element_get_validity #}
            (toHTMLKeygenElement self)))
 
getValidationMessage ::
                     (MonadIO m, HTMLKeygenElementClass self, GlibString string) =>
                       self -> m string
getValidationMessage self
  = liftIO
      (({# call webkit_dom_html_keygen_element_get_validation_message #}
          (toHTMLKeygenElement self))
         >>=
         readUTFString)
 
getLabels ::
          (MonadIO m, HTMLKeygenElementClass self) =>
            self -> m (Maybe NodeList)
getLabels self
  = liftIO
      (maybeNull (makeNewGObject mkNodeList)
         ({# call webkit_dom_html_keygen_element_get_labels #}
            (toHTMLKeygenElement self)))
