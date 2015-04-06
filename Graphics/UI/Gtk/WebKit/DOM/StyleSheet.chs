module Graphics.UI.Gtk.WebKit.DOM.StyleSheet(
setDisabled,
getDisabled,
getOwnerNode,
getParentStyleSheet,
getHref,
getTitle,
getMedia,
StyleSheet,
castToStyleSheet,
gTypeStyleSheet,
StyleSheetClass,
toStyleSheet,
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

 
setDisabled ::
            (MonadIO m, StyleSheetClass self) => self -> Bool -> m ()
setDisabled self val
  = liftIO
      ({# call webkit_dom_style_sheet_set_disabled #} (toStyleSheet self)
         (fromBool val))
 
getDisabled :: (MonadIO m, StyleSheetClass self) => self -> m Bool
getDisabled self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_style_sheet_get_disabled #}
            (toStyleSheet self)))
 
getOwnerNode ::
             (MonadIO m, StyleSheetClass self) => self -> m (Maybe Node)
getOwnerNode self
  = liftIO
      (maybeNull (makeNewGObject mkNode)
         ({# call webkit_dom_style_sheet_get_owner_node #}
            (toStyleSheet self)))
 
getParentStyleSheet ::
                    (MonadIO m, StyleSheetClass self) => self -> m (Maybe StyleSheet)
getParentStyleSheet self
  = liftIO
      (maybeNull (makeNewGObject mkStyleSheet)
         ({# call webkit_dom_style_sheet_get_parent_style_sheet #}
            (toStyleSheet self)))
 
getHref ::
        (MonadIO m, StyleSheetClass self, GlibString string) =>
          self -> m string
getHref self
  = liftIO
      (({# call webkit_dom_style_sheet_get_href #} (toStyleSheet self))
         >>=
         readUTFString)
 
getTitle ::
         (MonadIO m, StyleSheetClass self, GlibString string) =>
           self -> m string
getTitle self
  = liftIO
      (({# call webkit_dom_style_sheet_get_title #} (toStyleSheet self))
         >>=
         readUTFString)
 
getMedia ::
         (MonadIO m, StyleSheetClass self) => self -> m (Maybe MediaList)
getMedia self
  = liftIO
      (maybeNull (makeNewGObject mkMediaList)
         ({# call webkit_dom_style_sheet_get_media #} (toStyleSheet self)))
