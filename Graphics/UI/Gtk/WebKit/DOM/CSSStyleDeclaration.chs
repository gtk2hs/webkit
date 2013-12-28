module Graphics.UI.Gtk.WebKit.DOM.CSSStyleDeclaration
       (cssStyleDeclarationGetPropertyValue,
        cssStyleDeclarationRemoveProperty,
        cssStyleDeclarationGetPropertyPriority,
        cssStyleDeclarationSetProperty, cssStyleDeclarationItem,
        cssStyleDeclarationGetPropertyShorthand,
        cssStyleDeclarationIsPropertyImplicit,
        cssStyleDeclarationSetCssText, cssStyleDeclarationGetCssText,
        cssStyleDeclarationGetLength, cssStyleDeclarationGetParentRule)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
cssStyleDeclarationGetPropertyValue ::
                                    (CSSStyleDeclarationClass self) => self -> String -> IO String
cssStyleDeclarationGetPropertyValue self propertyName
  = (withUTFString propertyName $
       \ propertyNamePtr ->
         {# call webkit_dom_css_style_declaration_get_property_value #}
           (toCSSStyleDeclaration self)
           propertyNamePtr)
      >>=
      readUTFString
 
cssStyleDeclarationRemoveProperty ::
                                  (CSSStyleDeclarationClass self) => self -> String -> IO String
cssStyleDeclarationRemoveProperty self propertyName
  = (propagateGError $
       \ errorPtr_ ->
         withUTFString propertyName $
           \ propertyNamePtr ->
             {# call webkit_dom_css_style_declaration_remove_property #}
               (toCSSStyleDeclaration self)
               propertyNamePtr
           errorPtr_)
      >>=
      readUTFString
 
cssStyleDeclarationGetPropertyPriority ::
                                       (CSSStyleDeclarationClass self) =>
                                         self -> String -> IO String
cssStyleDeclarationGetPropertyPriority self propertyName
  = (withUTFString propertyName $
       \ propertyNamePtr ->
         {# call webkit_dom_css_style_declaration_get_property_priority #}
           (toCSSStyleDeclaration self)
           propertyNamePtr)
      >>=
      readUTFString
 
cssStyleDeclarationSetProperty ::
                               (CSSStyleDeclarationClass self) =>
                                 self -> String -> String -> String -> IO ()
cssStyleDeclarationSetProperty self propertyName value priority
  = propagateGError $
      \ errorPtr_ ->
        withUTFString priority $
          \ priorityPtr ->
            withUTFString value $
              \ valuePtr ->
                withUTFString propertyName $
                  \ propertyNamePtr ->
                    {# call webkit_dom_css_style_declaration_set_property #}
                      (toCSSStyleDeclaration self)
                      propertyNamePtr
                  valuePtr
              priorityPtr
          errorPtr_
 
cssStyleDeclarationItem ::
                        (CSSStyleDeclarationClass self) => self -> Word -> IO String
cssStyleDeclarationItem self index
  = ({# call webkit_dom_css_style_declaration_item #}
       (toCSSStyleDeclaration self)
       (fromIntegral index))
      >>=
      readUTFString
 
cssStyleDeclarationGetPropertyShorthand ::
                                        (CSSStyleDeclarationClass self) =>
                                          self -> String -> IO String
cssStyleDeclarationGetPropertyShorthand self propertyName
  = (withUTFString propertyName $
       \ propertyNamePtr ->
         {# call webkit_dom_css_style_declaration_get_property_shorthand #}
           (toCSSStyleDeclaration self)
           propertyNamePtr)
      >>=
      readUTFString
 
cssStyleDeclarationIsPropertyImplicit ::
                                      (CSSStyleDeclarationClass self) => self -> String -> IO Bool
cssStyleDeclarationIsPropertyImplicit self propertyName
  = toBool <$>
      (withUTFString propertyName $
         \ propertyNamePtr ->
           {# call webkit_dom_css_style_declaration_is_property_implicit #}
             (toCSSStyleDeclaration self)
             propertyNamePtr)
 
cssStyleDeclarationSetCssText ::
                              (CSSStyleDeclarationClass self) => self -> String -> IO ()
cssStyleDeclarationSetCssText self val
  = propagateGError $
      \ errorPtr_ ->
        withUTFString val $
          \ valPtr ->
            {# call webkit_dom_css_style_declaration_set_css_text #}
              (toCSSStyleDeclaration self)
              valPtr
          errorPtr_
 
cssStyleDeclarationGetCssText ::
                              (CSSStyleDeclarationClass self) => self -> IO String
cssStyleDeclarationGetCssText self
  = ({# call webkit_dom_css_style_declaration_get_css_text #}
       (toCSSStyleDeclaration self))
      >>=
      readUTFString
 
cssStyleDeclarationGetLength ::
                             (CSSStyleDeclarationClass self) => self -> IO Word
cssStyleDeclarationGetLength self
  = fromIntegral <$>
      ({# call webkit_dom_css_style_declaration_get_length #}
         (toCSSStyleDeclaration self))
 
cssStyleDeclarationGetParentRule ::
                                 (CSSStyleDeclarationClass self) => self -> IO (Maybe CSSRule)
cssStyleDeclarationGetParentRule self
  = maybeNull (makeNewGObject mkCSSRule)
      ({# call webkit_dom_css_style_declaration_get_parent_rule #}
         (toCSSStyleDeclaration self))
