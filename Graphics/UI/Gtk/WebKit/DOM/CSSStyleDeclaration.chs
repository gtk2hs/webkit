module Graphics.UI.Gtk.WebKit.DOM.CSSStyleDeclaration(
getPropertyValue,
removeProperty,
getPropertyPriority,
setProperty,
item,
getPropertyShorthand,
isPropertyImplicit,
setCssText,
getCssText,
getLength,
getParentRule,
CSSStyleDeclaration,
castToCSSStyleDeclaration,
gTypeCSSStyleDeclaration,
CSSStyleDeclarationClass,
toCSSStyleDeclaration,
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

 
getPropertyValue ::
                 (MonadIO m, CSSStyleDeclarationClass self, GlibString string) =>
                   self -> string -> m (Maybe string)
getPropertyValue self propertyName
  = liftIO
      ((withUTFString propertyName $
          \ propertyNamePtr ->
            {# call webkit_dom_css_style_declaration_get_property_value #}
              (toCSSStyleDeclaration self)
              propertyNamePtr)
         >>=
         maybePeek readUTFString)
 
removeProperty ::
               (MonadIO m, CSSStyleDeclarationClass self, GlibString string) =>
                 self -> string -> m (Maybe string)
removeProperty self propertyName
  = liftIO
      ((propagateGError $
          \ errorPtr_ ->
            withUTFString propertyName $
              \ propertyNamePtr ->
                {# call webkit_dom_css_style_declaration_remove_property #}
                  (toCSSStyleDeclaration self)
                  propertyNamePtr
              errorPtr_)
         >>=
         maybePeek readUTFString)
 
getPropertyPriority ::
                    (MonadIO m, CSSStyleDeclarationClass self, GlibString string) =>
                      self -> string -> m (Maybe string)
getPropertyPriority self propertyName
  = liftIO
      ((withUTFString propertyName $
          \ propertyNamePtr ->
            {# call webkit_dom_css_style_declaration_get_property_priority #}
              (toCSSStyleDeclaration self)
              propertyNamePtr)
         >>=
         maybePeek readUTFString)
 
setProperty ::
            (MonadIO m, CSSStyleDeclarationClass self, GlibString string) =>
              self -> string -> (Maybe string) -> string -> m ()
setProperty self propertyName value priority
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           withUTFString priority $
             \ priorityPtr ->
               maybeWith withUTFString value $
                 \ valuePtr ->
                   withUTFString propertyName $
                     \ propertyNamePtr ->
                       {# call webkit_dom_css_style_declaration_set_property #}
                         (toCSSStyleDeclaration self)
                         propertyNamePtr
                     valuePtr
                 priorityPtr
             errorPtr_)
 
item ::
     (MonadIO m, CSSStyleDeclarationClass self, GlibString string) =>
       self -> Word -> m string
item self index
  = liftIO
      (({# call webkit_dom_css_style_declaration_item #}
          (toCSSStyleDeclaration self)
          (fromIntegral index))
         >>=
         readUTFString)
 
getPropertyShorthand ::
                     (MonadIO m, CSSStyleDeclarationClass self, GlibString string) =>
                       self -> string -> m (Maybe string)
getPropertyShorthand self propertyName
  = liftIO
      ((withUTFString propertyName $
          \ propertyNamePtr ->
            {# call webkit_dom_css_style_declaration_get_property_shorthand #}
              (toCSSStyleDeclaration self)
              propertyNamePtr)
         >>=
         maybePeek readUTFString)
 
isPropertyImplicit ::
                   (MonadIO m, CSSStyleDeclarationClass self, GlibString string) =>
                     self -> string -> m Bool
isPropertyImplicit self propertyName
  = liftIO
      (toBool <$>
         (withUTFString propertyName $
            \ propertyNamePtr ->
              {# call webkit_dom_css_style_declaration_is_property_implicit #}
                (toCSSStyleDeclaration self)
                propertyNamePtr))
 
setCssText ::
           (MonadIO m, CSSStyleDeclarationClass self, GlibString string) =>
             self -> (Maybe string) -> m ()
setCssText self val
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           maybeWith withUTFString val $
             \ valPtr ->
               {# call webkit_dom_css_style_declaration_set_css_text #}
                 (toCSSStyleDeclaration self)
                 valPtr
             errorPtr_)
 
getCssText ::
           (MonadIO m, CSSStyleDeclarationClass self, GlibString string) =>
             self -> m (Maybe string)
getCssText self
  = liftIO
      (({# call webkit_dom_css_style_declaration_get_css_text #}
          (toCSSStyleDeclaration self))
         >>=
         maybePeek readUTFString)
 
getLength ::
          (MonadIO m, CSSStyleDeclarationClass self) => self -> m Word
getLength self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_css_style_declaration_get_length #}
            (toCSSStyleDeclaration self)))
 
getParentRule ::
              (MonadIO m, CSSStyleDeclarationClass self) =>
                self -> m (Maybe CSSRule)
getParentRule self
  = liftIO
      (maybeNull (makeNewGObject mkCSSRule)
         ({# call webkit_dom_css_style_declaration_get_parent_rule #}
            (toCSSStyleDeclaration self)))
