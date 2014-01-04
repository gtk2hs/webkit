module Graphics.UI.Gtk.WebKit.DOM.CSSRuleList
       (cssRuleListItem, cssRuleListGetLength, CSSRuleList,
        CSSRuleListClass, castToCSSRuleList, gTypeCSSRuleList,
        toCSSRuleList)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
cssRuleListItem ::
                (CSSRuleListClass self) => self -> Word -> IO (Maybe CSSRule)
cssRuleListItem self index
  = maybeNull (makeNewGObject mkCSSRule)
      ({# call webkit_dom_css_rule_list_item #} (toCSSRuleList self)
         (fromIntegral index))
 
cssRuleListGetLength :: (CSSRuleListClass self) => self -> IO Word
cssRuleListGetLength self
  = fromIntegral <$>
      ({# call webkit_dom_css_rule_list_get_length #}
         (toCSSRuleList self))
