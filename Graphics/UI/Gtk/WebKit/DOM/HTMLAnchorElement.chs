module Graphics.UI.Gtk.WebKit.DOM.HTMLAnchorElement(
setCharset,
getCharset,
setCoords,
getCoords,
setDownload,
getDownload,
setHref,
getHref,
setHreflang,
getHreflang,
setName,
getName,
setPing,
getPing,
setRel,
getRel,
setRev,
getRev,
setShape,
getShape,
setTarget,
getTarget,
setHash,
getHash,
setHost,
getHost,
setHostname,
getHostname,
setPathname,
getPathname,
setPort,
getPort,
setProtocol,
getProtocol,
setSearch,
getSearch,
getOrigin,
#if WEBKIT_CHECK_VERSION(99,0,0)
setText,
#endif
getText,
#if WEBKIT_CHECK_VERSION(99,0,0)
getRelList,
#endif
HTMLAnchorElement,
castToHTMLAnchorElement,
gTypeHTMLAnchorElement,
HTMLAnchorElementClass,
toHTMLAnchorElement,
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

 
setCharset ::
           (MonadIO m, HTMLAnchorElementClass self, GlibString string) =>
             self -> string -> m ()
setCharset self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_anchor_element_set_charset #}
             (toHTMLAnchorElement self)
             valPtr)
 
getCharset ::
           (MonadIO m, HTMLAnchorElementClass self, GlibString string) =>
             self -> m string
getCharset self
  = liftIO
      (({# call webkit_dom_html_anchor_element_get_charset #}
          (toHTMLAnchorElement self))
         >>=
         readUTFString)
 
setCoords ::
          (MonadIO m, HTMLAnchorElementClass self, GlibString string) =>
            self -> string -> m ()
setCoords self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_anchor_element_set_coords #}
             (toHTMLAnchorElement self)
             valPtr)
 
getCoords ::
          (MonadIO m, HTMLAnchorElementClass self, GlibString string) =>
            self -> m string
getCoords self
  = liftIO
      (({# call webkit_dom_html_anchor_element_get_coords #}
          (toHTMLAnchorElement self))
         >>=
         readUTFString)
 
setDownload ::
            (MonadIO m, HTMLAnchorElementClass self, GlibString string) =>
              self -> string -> m ()
setDownload self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_anchor_element_set_download #}
             (toHTMLAnchorElement self)
             valPtr)
 
getDownload ::
            (MonadIO m, HTMLAnchorElementClass self, GlibString string) =>
              self -> m string
getDownload self
  = liftIO
      (({# call webkit_dom_html_anchor_element_get_download #}
          (toHTMLAnchorElement self))
         >>=
         readUTFString)
 
setHref ::
        (MonadIO m, HTMLAnchorElementClass self, GlibString string) =>
          self -> string -> m ()
setHref self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_anchor_element_set_href #}
             (toHTMLAnchorElement self)
             valPtr)
 
getHref ::
        (MonadIO m, HTMLAnchorElementClass self, GlibString string) =>
          self -> m string
getHref self
  = liftIO
      (({# call webkit_dom_html_anchor_element_get_href #}
          (toHTMLAnchorElement self))
         >>=
         readUTFString)
 
setHreflang ::
            (MonadIO m, HTMLAnchorElementClass self, GlibString string) =>
              self -> string -> m ()
setHreflang self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_anchor_element_set_hreflang #}
             (toHTMLAnchorElement self)
             valPtr)
 
getHreflang ::
            (MonadIO m, HTMLAnchorElementClass self, GlibString string) =>
              self -> m string
getHreflang self
  = liftIO
      (({# call webkit_dom_html_anchor_element_get_hreflang #}
          (toHTMLAnchorElement self))
         >>=
         readUTFString)
 
setName ::
        (MonadIO m, HTMLAnchorElementClass self, GlibString string) =>
          self -> string -> m ()
setName self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_anchor_element_set_name #}
             (toHTMLAnchorElement self)
             valPtr)
 
getName ::
        (MonadIO m, HTMLAnchorElementClass self, GlibString string) =>
          self -> m string
getName self
  = liftIO
      (({# call webkit_dom_html_anchor_element_get_name #}
          (toHTMLAnchorElement self))
         >>=
         readUTFString)
 
setPing ::
        (MonadIO m, HTMLAnchorElementClass self, GlibString string) =>
          self -> string -> m ()
setPing self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_anchor_element_set_ping #}
             (toHTMLAnchorElement self)
             valPtr)
 
getPing ::
        (MonadIO m, HTMLAnchorElementClass self, GlibString string) =>
          self -> m string
getPing self
  = liftIO
      (({# call webkit_dom_html_anchor_element_get_ping #}
          (toHTMLAnchorElement self))
         >>=
         readUTFString)
 
setRel ::
       (MonadIO m, HTMLAnchorElementClass self, GlibString string) =>
         self -> string -> m ()
setRel self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_anchor_element_set_rel #}
             (toHTMLAnchorElement self)
             valPtr)
 
getRel ::
       (MonadIO m, HTMLAnchorElementClass self, GlibString string) =>
         self -> m string
getRel self
  = liftIO
      (({# call webkit_dom_html_anchor_element_get_rel #}
          (toHTMLAnchorElement self))
         >>=
         readUTFString)
 
setRev ::
       (MonadIO m, HTMLAnchorElementClass self, GlibString string) =>
         self -> string -> m ()
setRev self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_anchor_element_set_rev #}
             (toHTMLAnchorElement self)
             valPtr)
 
getRev ::
       (MonadIO m, HTMLAnchorElementClass self, GlibString string) =>
         self -> m string
getRev self
  = liftIO
      (({# call webkit_dom_html_anchor_element_get_rev #}
          (toHTMLAnchorElement self))
         >>=
         readUTFString)
 
setShape ::
         (MonadIO m, HTMLAnchorElementClass self, GlibString string) =>
           self -> string -> m ()
setShape self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_anchor_element_set_shape #}
             (toHTMLAnchorElement self)
             valPtr)
 
getShape ::
         (MonadIO m, HTMLAnchorElementClass self, GlibString string) =>
           self -> m string
getShape self
  = liftIO
      (({# call webkit_dom_html_anchor_element_get_shape #}
          (toHTMLAnchorElement self))
         >>=
         readUTFString)
 
setTarget ::
          (MonadIO m, HTMLAnchorElementClass self, GlibString string) =>
            self -> string -> m ()
setTarget self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_anchor_element_set_target #}
             (toHTMLAnchorElement self)
             valPtr)
 
getTarget ::
          (MonadIO m, HTMLAnchorElementClass self, GlibString string) =>
            self -> m string
getTarget self
  = liftIO
      (({# call webkit_dom_html_anchor_element_get_target #}
          (toHTMLAnchorElement self))
         >>=
         readUTFString)
 
setHash ::
        (MonadIO m, HTMLAnchorElementClass self, GlibString string) =>
          self -> string -> m ()
setHash self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_anchor_element_set_hash #}
             (toHTMLAnchorElement self)
             valPtr)
 
getHash ::
        (MonadIO m, HTMLAnchorElementClass self, GlibString string) =>
          self -> m string
getHash self
  = liftIO
      (({# call webkit_dom_html_anchor_element_get_hash #}
          (toHTMLAnchorElement self))
         >>=
         readUTFString)
 
setHost ::
        (MonadIO m, HTMLAnchorElementClass self, GlibString string) =>
          self -> string -> m ()
setHost self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_anchor_element_set_host #}
             (toHTMLAnchorElement self)
             valPtr)
 
getHost ::
        (MonadIO m, HTMLAnchorElementClass self, GlibString string) =>
          self -> m string
getHost self
  = liftIO
      (({# call webkit_dom_html_anchor_element_get_host #}
          (toHTMLAnchorElement self))
         >>=
         readUTFString)
 
setHostname ::
            (MonadIO m, HTMLAnchorElementClass self, GlibString string) =>
              self -> string -> m ()
setHostname self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_anchor_element_set_hostname #}
             (toHTMLAnchorElement self)
             valPtr)
 
getHostname ::
            (MonadIO m, HTMLAnchorElementClass self, GlibString string) =>
              self -> m string
getHostname self
  = liftIO
      (({# call webkit_dom_html_anchor_element_get_hostname #}
          (toHTMLAnchorElement self))
         >>=
         readUTFString)
 
setPathname ::
            (MonadIO m, HTMLAnchorElementClass self, GlibString string) =>
              self -> string -> m ()
setPathname self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_anchor_element_set_pathname #}
             (toHTMLAnchorElement self)
             valPtr)
 
getPathname ::
            (MonadIO m, HTMLAnchorElementClass self, GlibString string) =>
              self -> m string
getPathname self
  = liftIO
      (({# call webkit_dom_html_anchor_element_get_pathname #}
          (toHTMLAnchorElement self))
         >>=
         readUTFString)
 
setPort ::
        (MonadIO m, HTMLAnchorElementClass self, GlibString string) =>
          self -> string -> m ()
setPort self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_anchor_element_set_port #}
             (toHTMLAnchorElement self)
             valPtr)
 
getPort ::
        (MonadIO m, HTMLAnchorElementClass self, GlibString string) =>
          self -> m string
getPort self
  = liftIO
      (({# call webkit_dom_html_anchor_element_get_port #}
          (toHTMLAnchorElement self))
         >>=
         readUTFString)
 
setProtocol ::
            (MonadIO m, HTMLAnchorElementClass self, GlibString string) =>
              self -> string -> m ()
setProtocol self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_anchor_element_set_protocol #}
             (toHTMLAnchorElement self)
             valPtr)
 
getProtocol ::
            (MonadIO m, HTMLAnchorElementClass self, GlibString string) =>
              self -> m string
getProtocol self
  = liftIO
      (({# call webkit_dom_html_anchor_element_get_protocol #}
          (toHTMLAnchorElement self))
         >>=
         readUTFString)
 
setSearch ::
          (MonadIO m, HTMLAnchorElementClass self, GlibString string) =>
            self -> string -> m ()
setSearch self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_anchor_element_set_search #}
             (toHTMLAnchorElement self)
             valPtr)
 
getSearch ::
          (MonadIO m, HTMLAnchorElementClass self, GlibString string) =>
            self -> m string
getSearch self
  = liftIO
      (({# call webkit_dom_html_anchor_element_get_search #}
          (toHTMLAnchorElement self))
         >>=
         readUTFString)
 
getOrigin ::
          (MonadIO m, HTMLAnchorElementClass self, GlibString string) =>
            self -> m string
getOrigin self
  = liftIO
      (({# call webkit_dom_html_anchor_element_get_origin #}
          (toHTMLAnchorElement self))
         >>=
         readUTFString)

#if WEBKIT_CHECK_VERSION(99,0,0) 
setText ::
        (MonadIO m, HTMLAnchorElementClass self, GlibString string) =>
          self -> string -> m ()
setText self val
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           withUTFString val $
             \ valPtr ->
               {# call webkit_dom_html_anchor_element_set_text #}
                 (toHTMLAnchorElement self)
                 valPtr
             errorPtr_)
#endif
 
getText ::
        (MonadIO m, HTMLAnchorElementClass self, GlibString string) =>
          self -> m string
getText self
  = liftIO
      (({# call webkit_dom_html_anchor_element_get_text #}
          (toHTMLAnchorElement self))
         >>=
         readUTFString)

#if WEBKIT_CHECK_VERSION(99,0,0) 
getRelList ::
           (MonadIO m, HTMLAnchorElementClass self) =>
             self -> m (Maybe DOMTokenList)
getRelList self
  = liftIO
      (maybeNull (makeNewGObject mkDOMTokenList)
         ({# call webkit_dom_html_anchor_element_get_rel_list #}
            (toHTMLAnchorElement self)))
#endif
