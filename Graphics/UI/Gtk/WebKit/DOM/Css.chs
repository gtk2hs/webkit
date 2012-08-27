module Graphics.UI.Gtk.WebKit.DOM.Css (CSSRule, CSSRuleClass) where
 
data CSSRule = CSSRule
 
class CSSRuleClass a
 
instance CSSRuleClass CSSRule
