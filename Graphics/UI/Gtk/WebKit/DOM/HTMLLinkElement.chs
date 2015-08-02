module Graphics.UI.Gtk.WebKit.DOM.HTMLLinkElement(
setDisabled,
getDisabled,
setCharset,
getCharset,
setHref,
getHref,
setHreflang,
getHreflang,
setMedia,
getMedia,
setRel,
getRel,
setRev,
getRev,
setTarget,
getTarget,
getSheet,
#if WEBKIT_CHECK_VERSION(99,0,0)
getRelList,
#endif
HTMLLinkElement,
castToHTMLLinkElement,
gTypeHTMLLinkElement,
HTMLLinkElementClass,
toHTMLLinkElement,
) where
import Prelude hiding (drop, error, print)
import Data.Typeable (Typeable)
import Foreign.Marshal (maybePeek, maybeWith)
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

 
setDisabled ::
            (MonadIO m, HTMLLinkElementClass self) => self -> Bool -> m ()
setDisabled self val
  = liftIO
      ({# call webkit_dom_html_link_element_set_disabled #}
         (toHTMLLinkElement self)
         (fromBool val))
 
getDisabled ::
            (MonadIO m, HTMLLinkElementClass self) => self -> m Bool
getDisabled self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_html_link_element_get_disabled #}
            (toHTMLLinkElement self)))
 
setCharset ::
           (MonadIO m, HTMLLinkElementClass self, GlibString string) =>
             self -> string -> m ()
setCharset self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_link_element_set_charset #}
             (toHTMLLinkElement self)
             valPtr)
 
getCharset ::
           (MonadIO m, HTMLLinkElementClass self, GlibString string) =>
             self -> m string
getCharset self
  = liftIO
      (({# call webkit_dom_html_link_element_get_charset #}
          (toHTMLLinkElement self))
         >>=
         readUTFString)
 
setHref ::
        (MonadIO m, HTMLLinkElementClass self, GlibString string) =>
          self -> string -> m ()
setHref self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_link_element_set_href #}
             (toHTMLLinkElement self)
             valPtr)
 
getHref ::
        (MonadIO m, HTMLLinkElementClass self, GlibString string) =>
          self -> m string
getHref self
  = liftIO
      (({# call webkit_dom_html_link_element_get_href #}
          (toHTMLLinkElement self))
         >>=
         readUTFString)
 
setHreflang ::
            (MonadIO m, HTMLLinkElementClass self, GlibString string) =>
              self -> string -> m ()
setHreflang self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_link_element_set_hreflang #}
             (toHTMLLinkElement self)
             valPtr)
 
getHreflang ::
            (MonadIO m, HTMLLinkElementClass self, GlibString string) =>
              self -> m string
getHreflang self
  = liftIO
      (({# call webkit_dom_html_link_element_get_hreflang #}
          (toHTMLLinkElement self))
         >>=
         readUTFString)
 
setMedia ::
         (MonadIO m, HTMLLinkElementClass self, GlibString string) =>
           self -> string -> m ()
setMedia self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_link_element_set_media #}
             (toHTMLLinkElement self)
             valPtr)
 
getMedia ::
         (MonadIO m, HTMLLinkElementClass self, GlibString string) =>
           self -> m string
getMedia self
  = liftIO
      (({# call webkit_dom_html_link_element_get_media #}
          (toHTMLLinkElement self))
         >>=
         readUTFString)
 
setRel ::
       (MonadIO m, HTMLLinkElementClass self, GlibString string) =>
         self -> string -> m ()
setRel self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_link_element_set_rel #}
             (toHTMLLinkElement self)
             valPtr)
 
getRel ::
       (MonadIO m, HTMLLinkElementClass self, GlibString string) =>
         self -> m string
getRel self
  = liftIO
      (({# call webkit_dom_html_link_element_get_rel #}
          (toHTMLLinkElement self))
         >>=
         readUTFString)
 
setRev ::
       (MonadIO m, HTMLLinkElementClass self, GlibString string) =>
         self -> string -> m ()
setRev self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_link_element_set_rev #}
             (toHTMLLinkElement self)
             valPtr)
 
getRev ::
       (MonadIO m, HTMLLinkElementClass self, GlibString string) =>
         self -> m string
getRev self
  = liftIO
      (({# call webkit_dom_html_link_element_get_rev #}
          (toHTMLLinkElement self))
         >>=
         readUTFString)
 
setTarget ::
          (MonadIO m, HTMLLinkElementClass self, GlibString string) =>
            self -> string -> m ()
setTarget self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_link_element_set_target #}
             (toHTMLLinkElement self)
             valPtr)
 
getTarget ::
          (MonadIO m, HTMLLinkElementClass self, GlibString string) =>
            self -> m string
getTarget self
  = liftIO
      (({# call webkit_dom_html_link_element_get_target #}
          (toHTMLLinkElement self))
         >>=
         readUTFString)
 
getSheet ::
         (MonadIO m, HTMLLinkElementClass self) =>
           self -> m (Maybe StyleSheet)
getSheet self
  = liftIO
      (maybeNull (makeNewGObject mkStyleSheet)
         ({# call webkit_dom_html_link_element_get_sheet #}
            (toHTMLLinkElement self)))

#if WEBKIT_CHECK_VERSION(99,0,0) 
getRelList ::
           (MonadIO m, HTMLLinkElementClass self) =>
             self -> m (Maybe DOMTokenList)
getRelList self
  = liftIO
      (maybeNull (makeNewGObject mkDOMTokenList)
         ({# call webkit_dom_html_link_element_get_rel_list #}
            (toHTMLLinkElement self)))
#endif
