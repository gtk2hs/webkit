module Graphics.UI.Gtk.WebKit.DOM.Attr
       (attrGetName, attrGetSpecified, attrSetValue, attrGetValue,
        attrGetOwnerElement, attrGetIsId, DOMAttr, DOMAttrClass,
        castToDOMAttr, gTypeDOMAttr, toDOMAttr)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
attrGetName ::
            (DOMAttrClass self, GlibString string) => self -> IO string
attrGetName self
  = ({# call webkit_dom_attr_get_name #} (toDOMAttr self)) >>=
      readUTFString
 
attrGetSpecified :: (DOMAttrClass self) => self -> IO Bool
attrGetSpecified self
  = toBool <$>
      ({# call webkit_dom_attr_get_specified #} (toDOMAttr self))
 
attrSetValue ::
             (DOMAttrClass self, GlibString string) => self -> string -> IO ()
attrSetValue self val
  = propagateGError $
      \ errorPtr_ ->
        withUTFString val $
          \ valPtr ->
            {# call webkit_dom_attr_set_value #} (toDOMAttr self) valPtr
          errorPtr_
 
attrGetValue ::
             (DOMAttrClass self, GlibString string) => self -> IO string
attrGetValue self
  = ({# call webkit_dom_attr_get_value #} (toDOMAttr self)) >>=
      readUTFString
 
attrGetOwnerElement ::
                    (DOMAttrClass self) => self -> IO (Maybe Element)
attrGetOwnerElement self
  = maybeNull (makeNewGObject mkElement)
      ({# call webkit_dom_attr_get_owner_element #} (toDOMAttr self))
 
attrGetIsId :: (DOMAttrClass self) => self -> IO Bool
attrGetIsId self
  = toBool <$>
      ({# call webkit_dom_attr_get_is_id #} (toDOMAttr self))
