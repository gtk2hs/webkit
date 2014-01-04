module Graphics.UI.Gtk.WebKit.DOM.CSSValue
       (cCSS_INHERIT, cCSS_PRIMITIVE_VALUE, cCSS_VALUE_LIST, cCSS_CUSTOM,
        cssValueSetCssText, cssValueGetCssText, cssValueGetCssValueType,
        CSSValue, CSSValueClass, castToCSSValue, gTypeCSSValue, toCSSValue)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
cCSS_INHERIT = 0
cCSS_PRIMITIVE_VALUE = 1
cCSS_VALUE_LIST = 2
cCSS_CUSTOM = 3
 
cssValueSetCssText ::
                   (CSSValueClass self) => self -> String -> IO ()
cssValueSetCssText self val
  = propagateGError $
      \ errorPtr_ ->
        withUTFString val $
          \ valPtr ->
            {# call webkit_dom_css_value_set_css_text #} (toCSSValue self)
              valPtr
          errorPtr_
 
cssValueGetCssText :: (CSSValueClass self) => self -> IO String
cssValueGetCssText self
  = ({# call webkit_dom_css_value_get_css_text #} (toCSSValue self))
      >>=
      readUTFString
 
cssValueGetCssValueType :: (CSSValueClass self) => self -> IO Word
cssValueGetCssValueType self
  = fromIntegral <$>
      ({# call webkit_dom_css_value_get_css_value_type #}
         (toCSSValue self))
