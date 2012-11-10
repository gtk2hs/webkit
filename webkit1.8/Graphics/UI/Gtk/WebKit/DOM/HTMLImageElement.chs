module Graphics.UI.Gtk.WebKit.DOM.HTMLImageElement
       (htmlImageElementSetName, htmlImageElementGetName,
        htmlImageElementSetAlign, htmlImageElementGetAlign,
        htmlImageElementSetAlt, htmlImageElementGetAlt,
        htmlImageElementSetBorder, htmlImageElementGetBorder,
        htmlImageElementSetCrossOrigin, htmlImageElementGetCrossOrigin,
        htmlImageElementSetHeight, htmlImageElementGetHeight,
        htmlImageElementSetHspace, htmlImageElementGetHspace,
        htmlImageElementSetIsMap, htmlImageElementGetIsMap,
        htmlImageElementSetLongDesc, htmlImageElementGetLongDesc,
        htmlImageElementSetSrc, htmlImageElementGetSrc,
        htmlImageElementSetUseMap, htmlImageElementGetUseMap,
        htmlImageElementSetVspace, htmlImageElementGetVspace,
        htmlImageElementSetWidth, htmlImageElementGetWidth,
        htmlImageElementGetComplete, htmlImageElementSetLowsrc,
        htmlImageElementGetLowsrc, htmlImageElementGetNaturalHeight,
        htmlImageElementGetNaturalWidth, htmlImageElementGetX,
        htmlImageElementGetY)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
htmlImageElementSetName ::
                        (HTMLImageElementClass self) => self -> String -> IO ()
htmlImageElementSetName self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_image_element_set_name #}
          (toHTMLImageElement self)
          valPtr
 
htmlImageElementGetName ::
                        (HTMLImageElementClass self) => self -> IO String
htmlImageElementGetName self
  = ({# call webkit_dom_html_image_element_get_name #}
       (toHTMLImageElement self))
      >>=
      readUTFString
 
htmlImageElementSetAlign ::
                         (HTMLImageElementClass self) => self -> String -> IO ()
htmlImageElementSetAlign self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_image_element_set_align #}
          (toHTMLImageElement self)
          valPtr
 
htmlImageElementGetAlign ::
                         (HTMLImageElementClass self) => self -> IO String
htmlImageElementGetAlign self
  = ({# call webkit_dom_html_image_element_get_align #}
       (toHTMLImageElement self))
      >>=
      readUTFString
 
htmlImageElementSetAlt ::
                       (HTMLImageElementClass self) => self -> String -> IO ()
htmlImageElementSetAlt self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_image_element_set_alt #}
          (toHTMLImageElement self)
          valPtr
 
htmlImageElementGetAlt ::
                       (HTMLImageElementClass self) => self -> IO String
htmlImageElementGetAlt self
  = ({# call webkit_dom_html_image_element_get_alt #}
       (toHTMLImageElement self))
      >>=
      readUTFString
 
htmlImageElementSetBorder ::
                          (HTMLImageElementClass self) => self -> String -> IO ()
htmlImageElementSetBorder self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_image_element_set_border #}
          (toHTMLImageElement self)
          valPtr
 
htmlImageElementGetBorder ::
                          (HTMLImageElementClass self) => self -> IO String
htmlImageElementGetBorder self
  = ({# call webkit_dom_html_image_element_get_border #}
       (toHTMLImageElement self))
      >>=
      readUTFString
 
htmlImageElementSetCrossOrigin ::
                               (HTMLImageElementClass self) => self -> String -> IO ()
htmlImageElementSetCrossOrigin self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_image_element_set_cross_origin #}
          (toHTMLImageElement self)
          valPtr
 
htmlImageElementGetCrossOrigin ::
                               (HTMLImageElementClass self) => self -> IO String
htmlImageElementGetCrossOrigin self
  = ({# call webkit_dom_html_image_element_get_cross_origin #}
       (toHTMLImageElement self))
      >>=
      readUTFString
 
htmlImageElementSetHeight ::
                          (HTMLImageElementClass self) => self -> Int -> IO ()
htmlImageElementSetHeight self val
  = {# call webkit_dom_html_image_element_set_height #}
      (toHTMLImageElement self)
      (fromIntegral val)
 
htmlImageElementGetHeight ::
                          (HTMLImageElementClass self) => self -> IO Int
htmlImageElementGetHeight self
  = fromIntegral <$>
      ({# call webkit_dom_html_image_element_get_height #}
         (toHTMLImageElement self))
 
htmlImageElementSetHspace ::
                          (HTMLImageElementClass self) => self -> Int -> IO ()
htmlImageElementSetHspace self val
  = {# call webkit_dom_html_image_element_set_hspace #}
      (toHTMLImageElement self)
      (fromIntegral val)
 
htmlImageElementGetHspace ::
                          (HTMLImageElementClass self) => self -> IO Int
htmlImageElementGetHspace self
  = fromIntegral <$>
      ({# call webkit_dom_html_image_element_get_hspace #}
         (toHTMLImageElement self))
 
htmlImageElementSetIsMap ::
                         (HTMLImageElementClass self) => self -> Bool -> IO ()
htmlImageElementSetIsMap self val
  = {# call webkit_dom_html_image_element_set_is_map #}
      (toHTMLImageElement self)
      (fromBool val)
 
htmlImageElementGetIsMap ::
                         (HTMLImageElementClass self) => self -> IO Bool
htmlImageElementGetIsMap self
  = toBool <$>
      ({# call webkit_dom_html_image_element_get_is_map #}
         (toHTMLImageElement self))
 
htmlImageElementSetLongDesc ::
                            (HTMLImageElementClass self) => self -> String -> IO ()
htmlImageElementSetLongDesc self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_image_element_set_long_desc #}
          (toHTMLImageElement self)
          valPtr
 
htmlImageElementGetLongDesc ::
                            (HTMLImageElementClass self) => self -> IO String
htmlImageElementGetLongDesc self
  = ({# call webkit_dom_html_image_element_get_long_desc #}
       (toHTMLImageElement self))
      >>=
      readUTFString
 
htmlImageElementSetSrc ::
                       (HTMLImageElementClass self) => self -> String -> IO ()
htmlImageElementSetSrc self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_image_element_set_src #}
          (toHTMLImageElement self)
          valPtr
 
htmlImageElementGetSrc ::
                       (HTMLImageElementClass self) => self -> IO String
htmlImageElementGetSrc self
  = ({# call webkit_dom_html_image_element_get_src #}
       (toHTMLImageElement self))
      >>=
      readUTFString
 
htmlImageElementSetUseMap ::
                          (HTMLImageElementClass self) => self -> String -> IO ()
htmlImageElementSetUseMap self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_image_element_set_use_map #}
          (toHTMLImageElement self)
          valPtr
 
htmlImageElementGetUseMap ::
                          (HTMLImageElementClass self) => self -> IO String
htmlImageElementGetUseMap self
  = ({# call webkit_dom_html_image_element_get_use_map #}
       (toHTMLImageElement self))
      >>=
      readUTFString
 
htmlImageElementSetVspace ::
                          (HTMLImageElementClass self) => self -> Int -> IO ()
htmlImageElementSetVspace self val
  = {# call webkit_dom_html_image_element_set_vspace #}
      (toHTMLImageElement self)
      (fromIntegral val)
 
htmlImageElementGetVspace ::
                          (HTMLImageElementClass self) => self -> IO Int
htmlImageElementGetVspace self
  = fromIntegral <$>
      ({# call webkit_dom_html_image_element_get_vspace #}
         (toHTMLImageElement self))
 
htmlImageElementSetWidth ::
                         (HTMLImageElementClass self) => self -> Int -> IO ()
htmlImageElementSetWidth self val
  = {# call webkit_dom_html_image_element_set_width #}
      (toHTMLImageElement self)
      (fromIntegral val)
 
htmlImageElementGetWidth ::
                         (HTMLImageElementClass self) => self -> IO Int
htmlImageElementGetWidth self
  = fromIntegral <$>
      ({# call webkit_dom_html_image_element_get_width #}
         (toHTMLImageElement self))
 
htmlImageElementGetComplete ::
                            (HTMLImageElementClass self) => self -> IO Bool
htmlImageElementGetComplete self
  = toBool <$>
      ({# call webkit_dom_html_image_element_get_complete #}
         (toHTMLImageElement self))
 
htmlImageElementSetLowsrc ::
                          (HTMLImageElementClass self) => self -> String -> IO ()
htmlImageElementSetLowsrc self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_image_element_set_lowsrc #}
          (toHTMLImageElement self)
          valPtr
 
htmlImageElementGetLowsrc ::
                          (HTMLImageElementClass self) => self -> IO String
htmlImageElementGetLowsrc self
  = ({# call webkit_dom_html_image_element_get_lowsrc #}
       (toHTMLImageElement self))
      >>=
      readUTFString
 
htmlImageElementGetNaturalHeight ::
                                 (HTMLImageElementClass self) => self -> IO Int
htmlImageElementGetNaturalHeight self
  = fromIntegral <$>
      ({# call webkit_dom_html_image_element_get_natural_height #}
         (toHTMLImageElement self))
 
htmlImageElementGetNaturalWidth ::
                                (HTMLImageElementClass self) => self -> IO Int
htmlImageElementGetNaturalWidth self
  = fromIntegral <$>
      ({# call webkit_dom_html_image_element_get_natural_width #}
         (toHTMLImageElement self))
 
htmlImageElementGetX ::
                     (HTMLImageElementClass self) => self -> IO Int
htmlImageElementGetX self
  = fromIntegral <$>
      ({# call webkit_dom_html_image_element_get_x #}
         (toHTMLImageElement self))
 
htmlImageElementGetY ::
                     (HTMLImageElementClass self) => self -> IO Int
htmlImageElementGetY self
  = fromIntegral <$>
      ({# call webkit_dom_html_image_element_get_y #}
         (toHTMLImageElement self))
