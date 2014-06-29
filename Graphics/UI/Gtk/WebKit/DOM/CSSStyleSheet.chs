module Graphics.UI.Gtk.WebKit.DOM.CSSStyleSheet
       (cssStyleSheetInsertRule, cssStyleSheetDeleteRule,
        cssStyleSheetAddRule, cssStyleSheetRemoveRule,
        cssStyleSheetGetOwnerRule, cssStyleSheetGetCssRules,
        cssStyleSheetGetRules, CSSStyleSheet, CSSStyleSheetClass,
        castToCSSStyleSheet, gTypeCSSStyleSheet, toCSSStyleSheet)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
cssStyleSheetInsertRule ::
                        (CSSStyleSheetClass self, GlibString string) =>
                          self -> string -> Word -> IO Word
cssStyleSheetInsertRule self rule index
  = fromIntegral <$>
      (propagateGError $
         \ errorPtr_ ->
           withUTFString rule $
             \ rulePtr ->
               {# call webkit_dom_css_style_sheet_insert_rule #}
                 (toCSSStyleSheet self)
                 rulePtr
             (fromIntegral index)
             errorPtr_)
 
cssStyleSheetDeleteRule ::
                        (CSSStyleSheetClass self) => self -> Word -> IO ()
cssStyleSheetDeleteRule self index
  = propagateGError $
      \ errorPtr_ ->
        {# call webkit_dom_css_style_sheet_delete_rule #}
          (toCSSStyleSheet self)
          (fromIntegral index)
          errorPtr_
 
cssStyleSheetAddRule ::
                     (CSSStyleSheetClass self, GlibString string) =>
                       self -> string -> string -> Word -> IO Int
cssStyleSheetAddRule self selector style index
  = fromIntegral <$>
      (propagateGError $
         \ errorPtr_ ->
           withUTFString style $
             \ stylePtr ->
               withUTFString selector $
                 \ selectorPtr ->
                   {# call webkit_dom_css_style_sheet_add_rule #}
                     (toCSSStyleSheet self)
                     selectorPtr
                 stylePtr
             (fromIntegral index)
             errorPtr_)
 
cssStyleSheetRemoveRule ::
                        (CSSStyleSheetClass self) => self -> Word -> IO ()
cssStyleSheetRemoveRule self index
  = propagateGError $
      \ errorPtr_ ->
        {# call webkit_dom_css_style_sheet_remove_rule #}
          (toCSSStyleSheet self)
          (fromIntegral index)
          errorPtr_
 
cssStyleSheetGetOwnerRule ::
                          (CSSStyleSheetClass self) => self -> IO (Maybe CSSRule)
cssStyleSheetGetOwnerRule self
  = maybeNull (makeNewGObject mkCSSRule)
      ({# call webkit_dom_css_style_sheet_get_owner_rule #}
         (toCSSStyleSheet self))
 
cssStyleSheetGetCssRules ::
                         (CSSStyleSheetClass self) => self -> IO (Maybe CSSRuleList)
cssStyleSheetGetCssRules self
  = maybeNull (makeNewGObject mkCSSRuleList)
      ({# call webkit_dom_css_style_sheet_get_css_rules #}
         (toCSSStyleSheet self))
 
cssStyleSheetGetRules ::
                      (CSSStyleSheetClass self) => self -> IO (Maybe CSSRuleList)
cssStyleSheetGetRules self
  = maybeNull (makeNewGObject mkCSSRuleList)
      ({# call webkit_dom_css_style_sheet_get_rules #}
         (toCSSStyleSheet self))
