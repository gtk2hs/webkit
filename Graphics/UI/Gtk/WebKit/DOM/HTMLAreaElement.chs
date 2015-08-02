module Graphics.UI.Gtk.WebKit.DOM.HTMLAreaElement(
setAlt,
getAlt,
setCoords,
getCoords,
setHref,
getHref,
setNoHref,
getNoHref,
setPing,
getPing,
#if WEBKIT_CHECK_VERSION(99,0,0)
setRel,
getRel,
#endif
setShape,
getShape,
setTarget,
getTarget,
getHash,
getHost,
getHostname,
getPathname,
getPort,
getProtocol,
getSearch,
#if WEBKIT_CHECK_VERSION(99,0,0)
getRelList,
#endif
HTMLAreaElement,
castToHTMLAreaElement,
gTypeHTMLAreaElement,
HTMLAreaElementClass,
toHTMLAreaElement,
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

 
setAlt ::
       (MonadIO m, HTMLAreaElementClass self, GlibString string) =>
         self -> string -> m ()
setAlt self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_area_element_set_alt #}
             (toHTMLAreaElement self)
             valPtr)
 
getAlt ::
       (MonadIO m, HTMLAreaElementClass self, GlibString string) =>
         self -> m string
getAlt self
  = liftIO
      (({# call webkit_dom_html_area_element_get_alt #}
          (toHTMLAreaElement self))
         >>=
         readUTFString)
 
setCoords ::
          (MonadIO m, HTMLAreaElementClass self, GlibString string) =>
            self -> string -> m ()
setCoords self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_area_element_set_coords #}
             (toHTMLAreaElement self)
             valPtr)
 
getCoords ::
          (MonadIO m, HTMLAreaElementClass self, GlibString string) =>
            self -> m string
getCoords self
  = liftIO
      (({# call webkit_dom_html_area_element_get_coords #}
          (toHTMLAreaElement self))
         >>=
         readUTFString)
 
setHref ::
        (MonadIO m, HTMLAreaElementClass self, GlibString string) =>
          self -> string -> m ()
setHref self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_area_element_set_href #}
             (toHTMLAreaElement self)
             valPtr)
 
getHref ::
        (MonadIO m, HTMLAreaElementClass self, GlibString string) =>
          self -> m string
getHref self
  = liftIO
      (({# call webkit_dom_html_area_element_get_href #}
          (toHTMLAreaElement self))
         >>=
         readUTFString)
 
setNoHref ::
          (MonadIO m, HTMLAreaElementClass self) => self -> Bool -> m ()
setNoHref self val
  = liftIO
      ({# call webkit_dom_html_area_element_set_no_href #}
         (toHTMLAreaElement self)
         (fromBool val))
 
getNoHref ::
          (MonadIO m, HTMLAreaElementClass self) => self -> m Bool
getNoHref self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_html_area_element_get_no_href #}
            (toHTMLAreaElement self)))
 
setPing ::
        (MonadIO m, HTMLAreaElementClass self, GlibString string) =>
          self -> string -> m ()
setPing self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_area_element_set_ping #}
             (toHTMLAreaElement self)
             valPtr)
 
getPing ::
        (MonadIO m, HTMLAreaElementClass self, GlibString string) =>
          self -> m string
getPing self
  = liftIO
      (({# call webkit_dom_html_area_element_get_ping #}
          (toHTMLAreaElement self))
         >>=
         readUTFString)

#if WEBKIT_CHECK_VERSION(99,0,0) 
setRel ::
       (MonadIO m, HTMLAreaElementClass self, GlibString string) =>
         self -> string -> m ()
setRel self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_area_element_set_rel #}
             (toHTMLAreaElement self)
             valPtr)
 
getRel ::
       (MonadIO m, HTMLAreaElementClass self, GlibString string) =>
         self -> m string
getRel self
  = liftIO
      (({# call webkit_dom_html_area_element_get_rel #}
          (toHTMLAreaElement self))
         >>=
         readUTFString)
#endif
 
setShape ::
         (MonadIO m, HTMLAreaElementClass self, GlibString string) =>
           self -> string -> m ()
setShape self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_area_element_set_shape #}
             (toHTMLAreaElement self)
             valPtr)
 
getShape ::
         (MonadIO m, HTMLAreaElementClass self, GlibString string) =>
           self -> m string
getShape self
  = liftIO
      (({# call webkit_dom_html_area_element_get_shape #}
          (toHTMLAreaElement self))
         >>=
         readUTFString)
 
setTarget ::
          (MonadIO m, HTMLAreaElementClass self, GlibString string) =>
            self -> string -> m ()
setTarget self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_area_element_set_target #}
             (toHTMLAreaElement self)
             valPtr)
 
getTarget ::
          (MonadIO m, HTMLAreaElementClass self, GlibString string) =>
            self -> m string
getTarget self
  = liftIO
      (({# call webkit_dom_html_area_element_get_target #}
          (toHTMLAreaElement self))
         >>=
         readUTFString)
 
getHash ::
        (MonadIO m, HTMLAreaElementClass self, GlibString string) =>
          self -> m string
getHash self
  = liftIO
      (({# call webkit_dom_html_area_element_get_hash #}
          (toHTMLAreaElement self))
         >>=
         readUTFString)
 
getHost ::
        (MonadIO m, HTMLAreaElementClass self, GlibString string) =>
          self -> m string
getHost self
  = liftIO
      (({# call webkit_dom_html_area_element_get_host #}
          (toHTMLAreaElement self))
         >>=
         readUTFString)
 
getHostname ::
            (MonadIO m, HTMLAreaElementClass self, GlibString string) =>
              self -> m string
getHostname self
  = liftIO
      (({# call webkit_dom_html_area_element_get_hostname #}
          (toHTMLAreaElement self))
         >>=
         readUTFString)
 
getPathname ::
            (MonadIO m, HTMLAreaElementClass self, GlibString string) =>
              self -> m string
getPathname self
  = liftIO
      (({# call webkit_dom_html_area_element_get_pathname #}
          (toHTMLAreaElement self))
         >>=
         readUTFString)
 
getPort ::
        (MonadIO m, HTMLAreaElementClass self, GlibString string) =>
          self -> m string
getPort self
  = liftIO
      (({# call webkit_dom_html_area_element_get_port #}
          (toHTMLAreaElement self))
         >>=
         readUTFString)
 
getProtocol ::
            (MonadIO m, HTMLAreaElementClass self, GlibString string) =>
              self -> m string
getProtocol self
  = liftIO
      (({# call webkit_dom_html_area_element_get_protocol #}
          (toHTMLAreaElement self))
         >>=
         readUTFString)
 
getSearch ::
          (MonadIO m, HTMLAreaElementClass self, GlibString string) =>
            self -> m string
getSearch self
  = liftIO
      (({# call webkit_dom_html_area_element_get_search #}
          (toHTMLAreaElement self))
         >>=
         readUTFString)

#if WEBKIT_CHECK_VERSION(99,0,0) 
getRelList ::
           (MonadIO m, HTMLAreaElementClass self) =>
             self -> m (Maybe DOMTokenList)
getRelList self
  = liftIO
      (maybeNull (makeNewGObject mkDOMTokenList)
         ({# call webkit_dom_html_area_element_get_rel_list #}
            (toHTMLAreaElement self)))
#endif
