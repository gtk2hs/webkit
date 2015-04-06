module Graphics.UI.Gtk.WebKit.DOM.HTMLOptionElement(
setDisabled,
getDisabled,
getForm,
setLabel,
getLabel,
setDefaultSelected,
getDefaultSelected,
setSelected,
getSelected,
setValue,
getValue,
getText,
getIndex,
HTMLOptionElement,
castToHTMLOptionElement,
gTypeHTMLOptionElement,
HTMLOptionElementClass,
toHTMLOptionElement,
) where
import Prelude hiding (drop, error, print)
import System.Glib.FFI (maybeNull, withForeignPtr, nullForeignPtr, Ptr, nullPtr, castPtr, Word, Int64, Word64, CChar(..), CInt(..), CUInt(..), CLong(..), CULong(..), CShort(..), CUShort(..), CFloat(..), CDouble(..), toBool, fromBool)
import System.Glib.UTFString (GlibString(..), readUTFString)
import Control.Applicative ((<$>))
import Control.Monad (void)
import Control.Monad.IO.Class (MonadIO(..))
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventTargetClosures
import Graphics.UI.Gtk.WebKit.DOM.EventM
import Graphics.UI.Gtk.WebKit.DOM.Enums

 
setDisabled ::
            (MonadIO m, HTMLOptionElementClass self) => self -> Bool -> m ()
setDisabled self val
  = liftIO
      ({# call webkit_dom_html_option_element_set_disabled #}
         (toHTMLOptionElement self)
         (fromBool val))
 
getDisabled ::
            (MonadIO m, HTMLOptionElementClass self) => self -> m Bool
getDisabled self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_html_option_element_get_disabled #}
            (toHTMLOptionElement self)))
 
getForm ::
        (MonadIO m, HTMLOptionElementClass self) =>
          self -> m (Maybe HTMLFormElement)
getForm self
  = liftIO
      (maybeNull (makeNewGObject mkHTMLFormElement)
         ({# call webkit_dom_html_option_element_get_form #}
            (toHTMLOptionElement self)))
 
setLabel ::
         (MonadIO m, HTMLOptionElementClass self, GlibString string) =>
           self -> string -> m ()
setLabel self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_option_element_set_label #}
             (toHTMLOptionElement self)
             valPtr)
 
getLabel ::
         (MonadIO m, HTMLOptionElementClass self, GlibString string) =>
           self -> m string
getLabel self
  = liftIO
      (({# call webkit_dom_html_option_element_get_label #}
          (toHTMLOptionElement self))
         >>=
         readUTFString)
 
setDefaultSelected ::
                   (MonadIO m, HTMLOptionElementClass self) => self -> Bool -> m ()
setDefaultSelected self val
  = liftIO
      ({# call webkit_dom_html_option_element_set_default_selected #}
         (toHTMLOptionElement self)
         (fromBool val))
 
getDefaultSelected ::
                   (MonadIO m, HTMLOptionElementClass self) => self -> m Bool
getDefaultSelected self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_html_option_element_get_default_selected #}
            (toHTMLOptionElement self)))
 
setSelected ::
            (MonadIO m, HTMLOptionElementClass self) => self -> Bool -> m ()
setSelected self val
  = liftIO
      ({# call webkit_dom_html_option_element_set_selected #}
         (toHTMLOptionElement self)
         (fromBool val))
 
getSelected ::
            (MonadIO m, HTMLOptionElementClass self) => self -> m Bool
getSelected self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_html_option_element_get_selected #}
            (toHTMLOptionElement self)))
 
setValue ::
         (MonadIO m, HTMLOptionElementClass self, GlibString string) =>
           self -> string -> m ()
setValue self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_option_element_set_value #}
             (toHTMLOptionElement self)
             valPtr)
 
getValue ::
         (MonadIO m, HTMLOptionElementClass self, GlibString string) =>
           self -> m string
getValue self
  = liftIO
      (({# call webkit_dom_html_option_element_get_value #}
          (toHTMLOptionElement self))
         >>=
         readUTFString)
 
getText ::
        (MonadIO m, HTMLOptionElementClass self, GlibString string) =>
          self -> m string
getText self
  = liftIO
      (({# call webkit_dom_html_option_element_get_text #}
          (toHTMLOptionElement self))
         >>=
         readUTFString)
 
getIndex ::
         (MonadIO m, HTMLOptionElementClass self) => self -> m Int
getIndex self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_html_option_element_get_index #}
            (toHTMLOptionElement self)))
