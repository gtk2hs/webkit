module Graphics.UI.Gtk.WebKit.DOM.HTMLHRElement
       (htmlhrElementSetAlign, htmlhrElementGetAlign,
        htmlhrElementSetNoShade, htmlhrElementGetNoShade,
        htmlhrElementSetSize, htmlhrElementGetSize, htmlhrElementSetWidth,
        htmlhrElementGetWidth, HTMLHRElement, HTMLHRElementClass,
        castToHTMLHRElement, gTypeHTMLHRElement, toHTMLHRElement)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
htmlhrElementSetAlign ::
                      (HTMLHRElementClass self) => self -> String -> IO ()
htmlhrElementSetAlign self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_htmlhr_element_set_align #}
          (toHTMLHRElement self)
          valPtr
 
htmlhrElementGetAlign ::
                      (HTMLHRElementClass self) => self -> IO String
htmlhrElementGetAlign self
  = ({# call webkit_dom_htmlhr_element_get_align #}
       (toHTMLHRElement self))
      >>=
      readUTFString
 
htmlhrElementSetNoShade ::
                        (HTMLHRElementClass self) => self -> Bool -> IO ()
htmlhrElementSetNoShade self val
  = {# call webkit_dom_htmlhr_element_set_no_shade #}
      (toHTMLHRElement self)
      (fromBool val)
 
htmlhrElementGetNoShade ::
                        (HTMLHRElementClass self) => self -> IO Bool
htmlhrElementGetNoShade self
  = toBool <$>
      ({# call webkit_dom_htmlhr_element_get_no_shade #}
         (toHTMLHRElement self))
 
htmlhrElementSetSize ::
                     (HTMLHRElementClass self) => self -> String -> IO ()
htmlhrElementSetSize self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_htmlhr_element_set_size #}
          (toHTMLHRElement self)
          valPtr
 
htmlhrElementGetSize ::
                     (HTMLHRElementClass self) => self -> IO String
htmlhrElementGetSize self
  = ({# call webkit_dom_htmlhr_element_get_size #}
       (toHTMLHRElement self))
      >>=
      readUTFString
 
htmlhrElementSetWidth ::
                      (HTMLHRElementClass self) => self -> String -> IO ()
htmlhrElementSetWidth self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_htmlhr_element_set_width #}
          (toHTMLHRElement self)
          valPtr
 
htmlhrElementGetWidth ::
                      (HTMLHRElementClass self) => self -> IO String
htmlhrElementGetWidth self
  = ({# call webkit_dom_htmlhr_element_get_width #}
       (toHTMLHRElement self))
      >>=
      readUTFString
