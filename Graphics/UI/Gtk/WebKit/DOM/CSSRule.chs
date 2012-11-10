module Graphics.UI.Gtk.WebKit.DOM.CSSRule
       (cUNKNOWN_RULE, cSTYLE_RULE, cCHARSET_RULE, cIMPORT_RULE,
        cMEDIA_RULE, cFONT_FACE_RULE, cPAGE_RULE, cWEBKIT_KEYFRAMES_RULE,
        cWEBKIT_KEYFRAME_RULE, cssRuleSetCssText, cssRuleGetCssText,
        cssRuleGetParentStyleSheet, cssRuleGetParentRule)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
cUNKNOWN_RULE = 0
cSTYLE_RULE = 1
cCHARSET_RULE = 2
cIMPORT_RULE = 3
cMEDIA_RULE = 4
cFONT_FACE_RULE = 5
cPAGE_RULE = 6
cWEBKIT_KEYFRAMES_RULE = 7
cWEBKIT_KEYFRAME_RULE = 8
 
cssRuleSetCssText :: (CSSRuleClass self) => self -> String -> IO ()
cssRuleSetCssText self val
  = propagateGError $
      \ errorPtr_ ->
        withUTFString val $
          \ valPtr ->
            {# call webkit_dom_css_rule_set_css_text #} (toCSSRule self) valPtr
          errorPtr_
 
cssRuleGetCssText :: (CSSRuleClass self) => self -> IO String
cssRuleGetCssText self
  = ({# call webkit_dom_css_rule_get_css_text #} (toCSSRule self))
      >>=
      readUTFString
 
cssRuleGetParentStyleSheet ::
                           (CSSRuleClass self) => self -> IO (Maybe CSSStyleSheet)
cssRuleGetParentStyleSheet self
  = maybeNull (makeNewGObject mkCSSStyleSheet)
      ({# call webkit_dom_css_rule_get_parent_style_sheet #}
         (toCSSRule self))
 
cssRuleGetParentRule ::
                     (CSSRuleClass self) => self -> IO (Maybe CSSRule)
cssRuleGetParentRule self
  = maybeNull (makeNewGObject mkCSSRule)
      ({# call webkit_dom_css_rule_get_parent_rule #} (toCSSRule self))
