module Graphics.UI.Gtk.WebKit.DOM.CSSRule(
pattern UNKNOWN_RULE,
pattern STYLE_RULE,
pattern CHARSET_RULE,
pattern IMPORT_RULE,
pattern MEDIA_RULE,
pattern FONT_FACE_RULE,
pattern PAGE_RULE,
pattern KEYFRAMES_RULE,
pattern KEYFRAME_RULE,
pattern SUPPORTS_RULE,
pattern WEBKIT_VIEWPORT_RULE,
pattern WEBKIT_REGION_RULE,
pattern WEBKIT_KEYFRAMES_RULE,
pattern WEBKIT_KEYFRAME_RULE,
setCssText,
getCssText,
getParentStyleSheet,
getParentRule,
CSSRule,
castToCSSRule,
gTypeCSSRule,
CSSRuleClass,
toCSSRule,
) where
import Prelude hiding (drop, error, print)
import System.Glib.FFI (maybeNull, withForeignPtr, nullForeignPtr, Ptr, nullPtr, castPtr, Word, Int64, Word64, CChar(..), CInt(..), CUInt(..), CLong(..), CULong(..), CShort(..), CUShort(..), CFloat(..), CDouble(..), toBool, fromBool)
import System.Glib.UTFString (GlibString(..), readUTFString)
import Control.Applicative ((<$>))
import Control.Monad (void)
import Control.Monad.IO.Class (MonadIO(..))
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventTargetClosures
import Graphics.UI.Gtk.WebKit.DOM.EventM
import Graphics.UI.Gtk.WebKit.DOM.Enums

pattern UNKNOWN_RULE = 0
pattern STYLE_RULE = 1
pattern CHARSET_RULE = 2
pattern IMPORT_RULE = 3
pattern MEDIA_RULE = 4
pattern FONT_FACE_RULE = 5
pattern PAGE_RULE = 6
pattern KEYFRAMES_RULE = 7
pattern KEYFRAME_RULE = 8
pattern SUPPORTS_RULE = 12
pattern WEBKIT_VIEWPORT_RULE = 15
pattern WEBKIT_REGION_RULE = 16
pattern WEBKIT_KEYFRAMES_RULE = 7
pattern WEBKIT_KEYFRAME_RULE = 8
 
setCssText ::
           (MonadIO m, CSSRuleClass self, GlibString string) =>
             self -> string -> m ()
setCssText self val
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           withUTFString val $
             \ valPtr ->
               {# call webkit_dom_css_rule_set_css_text #} (toCSSRule self) valPtr
             errorPtr_)
 
getCssText ::
           (MonadIO m, CSSRuleClass self, GlibString string) =>
             self -> m string
getCssText self
  = liftIO
      (({# call webkit_dom_css_rule_get_css_text #} (toCSSRule self)) >>=
         readUTFString)
 
getParentStyleSheet ::
                    (MonadIO m, CSSRuleClass self) => self -> m (Maybe CSSStyleSheet)
getParentStyleSheet self
  = liftIO
      (maybeNull (makeNewGObject mkCSSStyleSheet)
         ({# call webkit_dom_css_rule_get_parent_style_sheet #}
            (toCSSRule self)))
 
getParentRule ::
              (MonadIO m, CSSRuleClass self) => self -> m (Maybe CSSRule)
getParentRule self
  = liftIO
      (maybeNull (makeNewGObject mkCSSRule)
         ({# call webkit_dom_css_rule_get_parent_rule #} (toCSSRule self)))
