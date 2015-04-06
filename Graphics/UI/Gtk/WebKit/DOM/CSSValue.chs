module Graphics.UI.Gtk.WebKit.DOM.CSSValue(
pattern CSS_INHERIT,
pattern CSS_PRIMITIVE_VALUE,
pattern CSS_VALUE_LIST,
pattern CSS_CUSTOM,
setCssText,
getCssText,
getCssValueType,
CSSValue,
castToCSSValue,
gTypeCSSValue,
CSSValueClass,
toCSSValue,
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

pattern CSS_INHERIT = 0
pattern CSS_PRIMITIVE_VALUE = 1
pattern CSS_VALUE_LIST = 2
pattern CSS_CUSTOM = 3
 
setCssText ::
           (MonadIO m, CSSValueClass self, GlibString string) =>
             self -> string -> m ()
setCssText self val
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           withUTFString val $
             \ valPtr ->
               {# call webkit_dom_css_value_set_css_text #} (toCSSValue self)
                 valPtr
             errorPtr_)
 
getCssText ::
           (MonadIO m, CSSValueClass self, GlibString string) =>
             self -> m string
getCssText self
  = liftIO
      (({# call webkit_dom_css_value_get_css_text #} (toCSSValue self))
         >>=
         readUTFString)
 
getCssValueType ::
                (MonadIO m, CSSValueClass self) => self -> m Word
getCssValueType self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_css_value_get_css_value_type #}
            (toCSSValue self)))
