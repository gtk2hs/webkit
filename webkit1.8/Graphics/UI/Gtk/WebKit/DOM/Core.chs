module Graphics.UI.Gtk.WebKit.DOM.Core (DOMAttr, DOMAttrClass)
       where
 
data DOMAttr = DOMAttr
 
class (NodeClass a) => DOMAttrClass a
 
instance DOMAttrClass DOMAttr
 
instance NodeClass DOMAttr
