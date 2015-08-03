module Graphics.UI.Gtk.WebKit.DOM.HTMLFormElement(
submit,
reset,
checkValidity,
#if WEBKIT_CHECK_VERSION(99,0,0)
requestAutocomplete,
#endif
setAcceptCharset,
getAcceptCharset,
setAction,
getAction,
setAutocomplete,
getAutocomplete,
setEnctype,
getEnctype,
setEncoding,
getEncoding,
setMethod,
getMethod,
setName,
getName,
setNoValidate,
getNoValidate,
setTarget,
getTarget,
getElements,
getLength,
#if WEBKIT_CHECK_VERSION(2,4,0)
setAutocorrect,
getAutocorrect,
setAutocapitalize,
getAutocapitalize,
#endif
autocomplete,
autocompleteerror,
HTMLFormElement,
castToHTMLFormElement,
gTypeHTMLFormElement,
HTMLFormElementClass,
toHTMLFormElement,
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

 
submit :: (MonadIO m, HTMLFormElementClass self) => self -> m ()
submit self
  = liftIO
      ({# call webkit_dom_html_form_element_submit #}
         (toHTMLFormElement self))
 
reset :: (MonadIO m, HTMLFormElementClass self) => self -> m ()
reset self
  = liftIO
      ({# call webkit_dom_html_form_element_reset #}
         (toHTMLFormElement self))
 
checkValidity ::
              (MonadIO m, HTMLFormElementClass self) => self -> m Bool
checkValidity self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_html_form_element_check_validity #}
            (toHTMLFormElement self)))

#if WEBKIT_CHECK_VERSION(99,0,0) 
requestAutocomplete ::
                    (MonadIO m, HTMLFormElementClass self) => self -> m ()
requestAutocomplete self
  = liftIO
      ({# call webkit_dom_html_form_element_request_autocomplete #}
         (toHTMLFormElement self))
#endif
 
setAcceptCharset ::
                 (MonadIO m, HTMLFormElementClass self, GlibString string) =>
                   self -> string -> m ()
setAcceptCharset self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_form_element_set_accept_charset #}
             (toHTMLFormElement self)
             valPtr)
 
getAcceptCharset ::
                 (MonadIO m, HTMLFormElementClass self, GlibString string) =>
                   self -> m string
getAcceptCharset self
  = liftIO
      (({# call webkit_dom_html_form_element_get_accept_charset #}
          (toHTMLFormElement self))
         >>=
         readUTFString)
 
setAction ::
          (MonadIO m, HTMLFormElementClass self, GlibString string) =>
            self -> string -> m ()
setAction self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_form_element_set_action #}
             (toHTMLFormElement self)
             valPtr)
 
getAction ::
          (MonadIO m, HTMLFormElementClass self, GlibString string) =>
            self -> m string
getAction self
  = liftIO
      (({# call webkit_dom_html_form_element_get_action #}
          (toHTMLFormElement self))
         >>=
         readUTFString)
 
setAutocomplete ::
                (MonadIO m, HTMLFormElementClass self, GlibString string) =>
                  self -> string -> m ()
setAutocomplete self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_form_element_set_autocomplete #}
             (toHTMLFormElement self)
             valPtr)
 
getAutocomplete ::
                (MonadIO m, HTMLFormElementClass self, GlibString string) =>
                  self -> m string
getAutocomplete self
  = liftIO
      (({# call webkit_dom_html_form_element_get_autocomplete #}
          (toHTMLFormElement self))
         >>=
         readUTFString)
 
setEnctype ::
           (MonadIO m, HTMLFormElementClass self, GlibString string) =>
             self -> (Maybe string) -> m ()
setEnctype self val
  = liftIO
      (maybeWith withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_form_element_set_enctype #}
             (toHTMLFormElement self)
             valPtr)
 
getEnctype ::
           (MonadIO m, HTMLFormElementClass self, GlibString string) =>
             self -> m (Maybe string)
getEnctype self
  = liftIO
      (({# call webkit_dom_html_form_element_get_enctype #}
          (toHTMLFormElement self))
         >>=
         maybePeek readUTFString)
 
setEncoding ::
            (MonadIO m, HTMLFormElementClass self, GlibString string) =>
              self -> (Maybe string) -> m ()
setEncoding self val
  = liftIO
      (maybeWith withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_form_element_set_encoding #}
             (toHTMLFormElement self)
             valPtr)
 
getEncoding ::
            (MonadIO m, HTMLFormElementClass self, GlibString string) =>
              self -> m (Maybe string)
getEncoding self
  = liftIO
      (({# call webkit_dom_html_form_element_get_encoding #}
          (toHTMLFormElement self))
         >>=
         maybePeek readUTFString)
 
setMethod ::
          (MonadIO m, HTMLFormElementClass self, GlibString string) =>
            self -> (Maybe string) -> m ()
setMethod self val
  = liftIO
      (maybeWith withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_form_element_set_method #}
             (toHTMLFormElement self)
             valPtr)
 
getMethod ::
          (MonadIO m, HTMLFormElementClass self, GlibString string) =>
            self -> m (Maybe string)
getMethod self
  = liftIO
      (({# call webkit_dom_html_form_element_get_method #}
          (toHTMLFormElement self))
         >>=
         maybePeek readUTFString)
 
setName ::
        (MonadIO m, HTMLFormElementClass self, GlibString string) =>
          self -> string -> m ()
setName self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_form_element_set_name #}
             (toHTMLFormElement self)
             valPtr)
 
getName ::
        (MonadIO m, HTMLFormElementClass self, GlibString string) =>
          self -> m string
getName self
  = liftIO
      (({# call webkit_dom_html_form_element_get_name #}
          (toHTMLFormElement self))
         >>=
         readUTFString)
 
setNoValidate ::
              (MonadIO m, HTMLFormElementClass self) => self -> Bool -> m ()
setNoValidate self val
  = liftIO
      ({# call webkit_dom_html_form_element_set_no_validate #}
         (toHTMLFormElement self)
         (fromBool val))
 
getNoValidate ::
              (MonadIO m, HTMLFormElementClass self) => self -> m Bool
getNoValidate self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_html_form_element_get_no_validate #}
            (toHTMLFormElement self)))
 
setTarget ::
          (MonadIO m, HTMLFormElementClass self, GlibString string) =>
            self -> string -> m ()
setTarget self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_form_element_set_target #}
             (toHTMLFormElement self)
             valPtr)
 
getTarget ::
          (MonadIO m, HTMLFormElementClass self, GlibString string) =>
            self -> m string
getTarget self
  = liftIO
      (({# call webkit_dom_html_form_element_get_target #}
          (toHTMLFormElement self))
         >>=
         readUTFString)
 
getElements ::
            (MonadIO m, HTMLFormElementClass self) =>
              self -> m (Maybe HTMLCollection)
getElements self
  = liftIO
      (maybeNull (makeNewGObject mkHTMLCollection)
         ({# call webkit_dom_html_form_element_get_elements #}
            (toHTMLFormElement self)))
 
getLength ::
          (MonadIO m, HTMLFormElementClass self) => self -> m Int
getLength self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_html_form_element_get_length #}
            (toHTMLFormElement self)))

#if WEBKIT_CHECK_VERSION(2,4,0) 
setAutocorrect ::
               (MonadIO m, HTMLFormElementClass self) => self -> Bool -> m ()
setAutocorrect self val
  = liftIO
      ({# call webkit_dom_html_form_element_set_autocorrect #}
         (toHTMLFormElement self)
         (fromBool val))
 
getAutocorrect ::
               (MonadIO m, HTMLFormElementClass self) => self -> m Bool
getAutocorrect self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_html_form_element_get_autocorrect #}
            (toHTMLFormElement self)))
 
setAutocapitalize ::
                  (MonadIO m, HTMLFormElementClass self, GlibString string) =>
                    self -> (Maybe string) -> m ()
setAutocapitalize self val
  = liftIO
      (maybeWith withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_form_element_set_autocapitalize #}
             (toHTMLFormElement self)
             valPtr)
 
getAutocapitalize ::
                  (MonadIO m, HTMLFormElementClass self, GlibString string) =>
                    self -> m (Maybe string)
getAutocapitalize self
  = liftIO
      (({# call webkit_dom_html_form_element_get_autocapitalize #}
          (toHTMLFormElement self))
         >>=
         maybePeek readUTFString)
#endif
 
autocomplete :: (HTMLFormElementClass self) => EventName self Event
autocomplete = EventName "autocomplete"
 
autocompleteerror ::
                  (HTMLFormElementClass self) => EventName self Event
autocompleteerror = EventName "autocompleteerror"
