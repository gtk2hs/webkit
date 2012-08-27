module Graphics.UI.Gtk.WebKit.DOM.StyleSheet
       (styleSheetSetDisabled, styleSheetGetDisabled,
        styleSheetGetOwnerNode, styleSheetGetParentStyleSheet,
        styleSheetGetHref, styleSheetGetTitle, styleSheetGetMedia)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
styleSheetSetDisabled ::
                      (StyleSheetClass self) => self -> Bool -> IO ()
styleSheetSetDisabled self val
  = {# call webkit_dom_style_sheet_set_disabled #}
      (toStyleSheet self)
      (fromBool val)
 
styleSheetGetDisabled :: (StyleSheetClass self) => self -> IO Bool
styleSheetGetDisabled self
  = toBool <$>
      ({# call webkit_dom_style_sheet_get_disabled #}
         (toStyleSheet self))
 
styleSheetGetOwnerNode ::
                       (StyleSheetClass self) => self -> IO (Maybe Node)
styleSheetGetOwnerNode self
  = maybeNull (makeNewGObject mkNode)
      ({# call webkit_dom_style_sheet_get_owner_node #}
         (toStyleSheet self))
 
styleSheetGetParentStyleSheet ::
                              (StyleSheetClass self) => self -> IO (Maybe StyleSheet)
styleSheetGetParentStyleSheet self
  = maybeNull (makeNewGObject mkStyleSheet)
      ({# call webkit_dom_style_sheet_get_parent_style_sheet #}
         (toStyleSheet self))
 
styleSheetGetHref :: (StyleSheetClass self) => self -> IO String
styleSheetGetHref self
  = ({# call webkit_dom_style_sheet_get_href #} (toStyleSheet self))
      >>=
      readUTFString
 
styleSheetGetTitle :: (StyleSheetClass self) => self -> IO String
styleSheetGetTitle self
  = ({# call webkit_dom_style_sheet_get_title #} (toStyleSheet self))
      >>=
      readUTFString
 
styleSheetGetMedia ::
                   (StyleSheetClass self) => self -> IO (Maybe MediaList)
styleSheetGetMedia self
  = maybeNull (makeNewGObject mkMediaList)
      ({# call webkit_dom_style_sheet_get_media #} (toStyleSheet self))
