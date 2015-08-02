module Graphics.UI.Gtk.WebKit.DOM.CSSStyleSheet(
insertRule,
deleteRule,
addRule,
removeRule,
getOwnerRule,
getCssRules,
getRules,
CSSStyleSheet,
castToCSSStyleSheet,
gTypeCSSStyleSheet,
CSSStyleSheetClass,
toCSSStyleSheet,
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

 
insertRule ::
           (MonadIO m, CSSStyleSheetClass self, GlibString string) =>
             self -> string -> Word -> m Word
insertRule self rule index
  = liftIO
      (fromIntegral <$>
         (propagateGError $
            \ errorPtr_ ->
              withUTFString rule $
                \ rulePtr ->
                  {# call webkit_dom_css_style_sheet_insert_rule #}
                    (toCSSStyleSheet self)
                    rulePtr
                (fromIntegral index)
                errorPtr_))
 
deleteRule ::
           (MonadIO m, CSSStyleSheetClass self) => self -> Word -> m ()
deleteRule self index
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_css_style_sheet_delete_rule #}
             (toCSSStyleSheet self)
             (fromIntegral index)
             errorPtr_)
 
addRule ::
        (MonadIO m, CSSStyleSheetClass self, GlibString string) =>
          self -> string -> string -> Word -> m Int
addRule self selector style index
  = liftIO
      (fromIntegral <$>
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
                errorPtr_))
 
removeRule ::
           (MonadIO m, CSSStyleSheetClass self) => self -> Word -> m ()
removeRule self index
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_css_style_sheet_remove_rule #}
             (toCSSStyleSheet self)
             (fromIntegral index)
             errorPtr_)
 
getOwnerRule ::
             (MonadIO m, CSSStyleSheetClass self) => self -> m (Maybe CSSRule)
getOwnerRule self
  = liftIO
      (maybeNull (makeNewGObject mkCSSRule)
         ({# call webkit_dom_css_style_sheet_get_owner_rule #}
            (toCSSStyleSheet self)))
 
getCssRules ::
            (MonadIO m, CSSStyleSheetClass self) =>
              self -> m (Maybe CSSRuleList)
getCssRules self
  = liftIO
      (maybeNull (makeNewGObject mkCSSRuleList)
         ({# call webkit_dom_css_style_sheet_get_css_rules #}
            (toCSSStyleSheet self)))
 
getRules ::
         (MonadIO m, CSSStyleSheetClass self) =>
           self -> m (Maybe CSSRuleList)
getRules self
  = liftIO
      (maybeNull (makeNewGObject mkCSSRuleList)
         ({# call webkit_dom_css_style_sheet_get_rules #}
            (toCSSStyleSheet self)))
