module Graphics.UI.Gtk.WebKit.DOM.HTMLDocument(
close,
clear,
captureEvents,
releaseEvents,
getEmbeds,
getPlugins,
getScripts,
getWidth,
getHeight,
setDir,
getDir,
setDesignMode,
getDesignMode,
getCompatMode,
setBgColor,
getBgColor,
setFgColor,
getFgColor,
setAlinkColor,
getAlinkColor,
setLinkColor,
getLinkColor,
setVlinkColor,
getVlinkColor,
HTMLDocument,
castToHTMLDocument,
gTypeHTMLDocument,
HTMLDocumentClass,
toHTMLDocument,
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

 
close :: (MonadIO m, HTMLDocumentClass self) => self -> m ()
close self
  = liftIO
      ({# call webkit_dom_html_document_close #} (toHTMLDocument self))
 
clear :: (MonadIO m, HTMLDocumentClass self) => self -> m ()
clear self
  = liftIO
      ({# call webkit_dom_html_document_clear #} (toHTMLDocument self))
 
captureEvents ::
              (MonadIO m, HTMLDocumentClass self) => self -> m ()
captureEvents self
  = liftIO
      ({# call webkit_dom_html_document_capture_events #}
         (toHTMLDocument self))
 
releaseEvents ::
              (MonadIO m, HTMLDocumentClass self) => self -> m ()
releaseEvents self
  = liftIO
      ({# call webkit_dom_html_document_release_events #}
         (toHTMLDocument self))
 
getEmbeds ::
          (MonadIO m, HTMLDocumentClass self) =>
            self -> m (Maybe HTMLCollection)
getEmbeds self
  = liftIO
      (maybeNull (makeNewGObject mkHTMLCollection)
         ({# call webkit_dom_html_document_get_embeds #}
            (toHTMLDocument self)))
 
getPlugins ::
           (MonadIO m, HTMLDocumentClass self) =>
             self -> m (Maybe HTMLCollection)
getPlugins self
  = liftIO
      (maybeNull (makeNewGObject mkHTMLCollection)
         ({# call webkit_dom_html_document_get_plugins #}
            (toHTMLDocument self)))
 
getScripts ::
           (MonadIO m, HTMLDocumentClass self) =>
             self -> m (Maybe HTMLCollection)
getScripts self
  = liftIO
      (maybeNull (makeNewGObject mkHTMLCollection)
         ({# call webkit_dom_html_document_get_scripts #}
            (toHTMLDocument self)))
 
getWidth :: (MonadIO m, HTMLDocumentClass self) => self -> m Int
getWidth self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_html_document_get_width #}
            (toHTMLDocument self)))
 
getHeight :: (MonadIO m, HTMLDocumentClass self) => self -> m Int
getHeight self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_html_document_get_height #}
            (toHTMLDocument self)))
 
setDir ::
       (MonadIO m, HTMLDocumentClass self, GlibString string) =>
         self -> (Maybe string) -> m ()
setDir self val
  = liftIO
      (maybeWith withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_document_set_dir #} (toHTMLDocument self)
             valPtr)
 
getDir ::
       (MonadIO m, HTMLDocumentClass self, GlibString string) =>
         self -> m (Maybe string)
getDir self
  = liftIO
      (({# call webkit_dom_html_document_get_dir #}
          (toHTMLDocument self))
         >>=
         maybePeek readUTFString)
 
setDesignMode ::
              (MonadIO m, HTMLDocumentClass self, GlibString string) =>
                self -> (Maybe string) -> m ()
setDesignMode self val
  = liftIO
      (maybeWith withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_document_set_design_mode #}
             (toHTMLDocument self)
             valPtr)
 
getDesignMode ::
              (MonadIO m, HTMLDocumentClass self, GlibString string) =>
                self -> m (Maybe string)
getDesignMode self
  = liftIO
      (({# call webkit_dom_html_document_get_design_mode #}
          (toHTMLDocument self))
         >>=
         maybePeek readUTFString)
 
getCompatMode ::
              (MonadIO m, HTMLDocumentClass self, GlibString string) =>
                self -> m string
getCompatMode self
  = liftIO
      (({# call webkit_dom_html_document_get_compat_mode #}
          (toHTMLDocument self))
         >>=
         readUTFString)
 
setBgColor ::
           (MonadIO m, HTMLDocumentClass self, GlibString string) =>
             self -> (Maybe string) -> m ()
setBgColor self val
  = liftIO
      (maybeWith withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_document_set_bg_color #}
             (toHTMLDocument self)
             valPtr)
 
getBgColor ::
           (MonadIO m, HTMLDocumentClass self, GlibString string) =>
             self -> m (Maybe string)
getBgColor self
  = liftIO
      (({# call webkit_dom_html_document_get_bg_color #}
          (toHTMLDocument self))
         >>=
         maybePeek readUTFString)
 
setFgColor ::
           (MonadIO m, HTMLDocumentClass self, GlibString string) =>
             self -> (Maybe string) -> m ()
setFgColor self val
  = liftIO
      (maybeWith withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_document_set_fg_color #}
             (toHTMLDocument self)
             valPtr)
 
getFgColor ::
           (MonadIO m, HTMLDocumentClass self, GlibString string) =>
             self -> m (Maybe string)
getFgColor self
  = liftIO
      (({# call webkit_dom_html_document_get_fg_color #}
          (toHTMLDocument self))
         >>=
         maybePeek readUTFString)
 
setAlinkColor ::
              (MonadIO m, HTMLDocumentClass self, GlibString string) =>
                self -> (Maybe string) -> m ()
setAlinkColor self val
  = liftIO
      (maybeWith withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_document_set_alink_color #}
             (toHTMLDocument self)
             valPtr)
 
getAlinkColor ::
              (MonadIO m, HTMLDocumentClass self, GlibString string) =>
                self -> m (Maybe string)
getAlinkColor self
  = liftIO
      (({# call webkit_dom_html_document_get_alink_color #}
          (toHTMLDocument self))
         >>=
         maybePeek readUTFString)
 
setLinkColor ::
             (MonadIO m, HTMLDocumentClass self, GlibString string) =>
               self -> (Maybe string) -> m ()
setLinkColor self val
  = liftIO
      (maybeWith withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_document_set_link_color #}
             (toHTMLDocument self)
             valPtr)
 
getLinkColor ::
             (MonadIO m, HTMLDocumentClass self, GlibString string) =>
               self -> m (Maybe string)
getLinkColor self
  = liftIO
      (({# call webkit_dom_html_document_get_link_color #}
          (toHTMLDocument self))
         >>=
         maybePeek readUTFString)
 
setVlinkColor ::
              (MonadIO m, HTMLDocumentClass self, GlibString string) =>
                self -> (Maybe string) -> m ()
setVlinkColor self val
  = liftIO
      (maybeWith withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_document_set_vlink_color #}
             (toHTMLDocument self)
             valPtr)
 
getVlinkColor ::
              (MonadIO m, HTMLDocumentClass self, GlibString string) =>
                self -> m (Maybe string)
getVlinkColor self
  = liftIO
      (({# call webkit_dom_html_document_get_vlink_color #}
          (toHTMLDocument self))
         >>=
         maybePeek readUTFString)
