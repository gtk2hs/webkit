module Graphics.UI.Gtk.WebKit.DOM.HTMLMarqueeElement
       (htmlMarqueeElementStart, htmlMarqueeElementStop,
        htmlMarqueeElementSetBehavior, htmlMarqueeElementGetBehavior,
        htmlMarqueeElementSetBgColor, htmlMarqueeElementGetBgColor,
        htmlMarqueeElementSetDirection, htmlMarqueeElementGetDirection,
        htmlMarqueeElementSetHeight, htmlMarqueeElementGetHeight,
        htmlMarqueeElementSetHspace, htmlMarqueeElementGetHspace,
        htmlMarqueeElementSetLoop, htmlMarqueeElementGetLoop,
        htmlMarqueeElementSetScrollAmount,
        htmlMarqueeElementGetScrollAmount,
        htmlMarqueeElementSetScrollDelay, htmlMarqueeElementGetScrollDelay,
        htmlMarqueeElementSetTrueSpeed, htmlMarqueeElementGetTrueSpeed,
        htmlMarqueeElementSetVspace, htmlMarqueeElementGetVspace,
        htmlMarqueeElementSetWidth, htmlMarqueeElementGetWidth)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
htmlMarqueeElementStart ::
                        (HTMLMarqueeElementClass self) => self -> IO ()
htmlMarqueeElementStart self
  = {# call webkit_dom_html_marquee_element_start #}
      (toHTMLMarqueeElement self)
 
htmlMarqueeElementStop ::
                       (HTMLMarqueeElementClass self) => self -> IO ()
htmlMarqueeElementStop self
  = {# call webkit_dom_html_marquee_element_stop #}
      (toHTMLMarqueeElement self)
 
htmlMarqueeElementSetBehavior ::
                              (HTMLMarqueeElementClass self) => self -> String -> IO ()
htmlMarqueeElementSetBehavior self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_marquee_element_set_behavior #}
          (toHTMLMarqueeElement self)
          valPtr
 
htmlMarqueeElementGetBehavior ::
                              (HTMLMarqueeElementClass self) => self -> IO String
htmlMarqueeElementGetBehavior self
  = ({# call webkit_dom_html_marquee_element_get_behavior #}
       (toHTMLMarqueeElement self))
      >>=
      readUTFString
 
htmlMarqueeElementSetBgColor ::
                             (HTMLMarqueeElementClass self) => self -> String -> IO ()
htmlMarqueeElementSetBgColor self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_marquee_element_set_bg_color #}
          (toHTMLMarqueeElement self)
          valPtr
 
htmlMarqueeElementGetBgColor ::
                             (HTMLMarqueeElementClass self) => self -> IO String
htmlMarqueeElementGetBgColor self
  = ({# call webkit_dom_html_marquee_element_get_bg_color #}
       (toHTMLMarqueeElement self))
      >>=
      readUTFString
 
htmlMarqueeElementSetDirection ::
                               (HTMLMarqueeElementClass self) => self -> String -> IO ()
htmlMarqueeElementSetDirection self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_marquee_element_set_direction #}
          (toHTMLMarqueeElement self)
          valPtr
 
htmlMarqueeElementGetDirection ::
                               (HTMLMarqueeElementClass self) => self -> IO String
htmlMarqueeElementGetDirection self
  = ({# call webkit_dom_html_marquee_element_get_direction #}
       (toHTMLMarqueeElement self))
      >>=
      readUTFString
 
htmlMarqueeElementSetHeight ::
                            (HTMLMarqueeElementClass self) => self -> String -> IO ()
htmlMarqueeElementSetHeight self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_marquee_element_set_height #}
          (toHTMLMarqueeElement self)
          valPtr
 
htmlMarqueeElementGetHeight ::
                            (HTMLMarqueeElementClass self) => self -> IO String
htmlMarqueeElementGetHeight self
  = ({# call webkit_dom_html_marquee_element_get_height #}
       (toHTMLMarqueeElement self))
      >>=
      readUTFString
 
htmlMarqueeElementSetHspace ::
                            (HTMLMarqueeElementClass self) => self -> Word -> IO ()
htmlMarqueeElementSetHspace self val
  = {# call webkit_dom_html_marquee_element_set_hspace #}
      (toHTMLMarqueeElement self)
      (fromIntegral val)
 
htmlMarqueeElementGetHspace ::
                            (HTMLMarqueeElementClass self) => self -> IO Word
htmlMarqueeElementGetHspace self
  = fromIntegral <$>
      ({# call webkit_dom_html_marquee_element_get_hspace #}
         (toHTMLMarqueeElement self))
 
htmlMarqueeElementSetLoop ::
                          (HTMLMarqueeElementClass self) => self -> Int -> IO ()
htmlMarqueeElementSetLoop self val
  = propagateGError $
      \ errorPtr_ ->
        {# call webkit_dom_html_marquee_element_set_loop #}
          (toHTMLMarqueeElement self)
          (fromIntegral val)
          errorPtr_
 
htmlMarqueeElementGetLoop ::
                          (HTMLMarqueeElementClass self) => self -> IO Int
htmlMarqueeElementGetLoop self
  = fromIntegral <$>
      ({# call webkit_dom_html_marquee_element_get_loop #}
         (toHTMLMarqueeElement self))
 
htmlMarqueeElementSetScrollAmount ::
                                  (HTMLMarqueeElementClass self) => self -> Int -> IO ()
htmlMarqueeElementSetScrollAmount self val
  = propagateGError $
      \ errorPtr_ ->
        {# call webkit_dom_html_marquee_element_set_scroll_amount #}
          (toHTMLMarqueeElement self)
          (fromIntegral val)
          errorPtr_
 
htmlMarqueeElementGetScrollAmount ::
                                  (HTMLMarqueeElementClass self) => self -> IO Int
htmlMarqueeElementGetScrollAmount self
  = fromIntegral <$>
      ({# call webkit_dom_html_marquee_element_get_scroll_amount #}
         (toHTMLMarqueeElement self))
 
htmlMarqueeElementSetScrollDelay ::
                                 (HTMLMarqueeElementClass self) => self -> Int -> IO ()
htmlMarqueeElementSetScrollDelay self val
  = propagateGError $
      \ errorPtr_ ->
        {# call webkit_dom_html_marquee_element_set_scroll_delay #}
          (toHTMLMarqueeElement self)
          (fromIntegral val)
          errorPtr_
 
htmlMarqueeElementGetScrollDelay ::
                                 (HTMLMarqueeElementClass self) => self -> IO Int
htmlMarqueeElementGetScrollDelay self
  = fromIntegral <$>
      ({# call webkit_dom_html_marquee_element_get_scroll_delay #}
         (toHTMLMarqueeElement self))
 
htmlMarqueeElementSetTrueSpeed ::
                               (HTMLMarqueeElementClass self) => self -> Bool -> IO ()
htmlMarqueeElementSetTrueSpeed self val
  = {# call webkit_dom_html_marquee_element_set_true_speed #}
      (toHTMLMarqueeElement self)
      (fromBool val)
 
htmlMarqueeElementGetTrueSpeed ::
                               (HTMLMarqueeElementClass self) => self -> IO Bool
htmlMarqueeElementGetTrueSpeed self
  = toBool <$>
      ({# call webkit_dom_html_marquee_element_get_true_speed #}
         (toHTMLMarqueeElement self))
 
htmlMarqueeElementSetVspace ::
                            (HTMLMarqueeElementClass self) => self -> Word -> IO ()
htmlMarqueeElementSetVspace self val
  = {# call webkit_dom_html_marquee_element_set_vspace #}
      (toHTMLMarqueeElement self)
      (fromIntegral val)
 
htmlMarqueeElementGetVspace ::
                            (HTMLMarqueeElementClass self) => self -> IO Word
htmlMarqueeElementGetVspace self
  = fromIntegral <$>
      ({# call webkit_dom_html_marquee_element_get_vspace #}
         (toHTMLMarqueeElement self))
 
htmlMarqueeElementSetWidth ::
                           (HTMLMarqueeElementClass self) => self -> String -> IO ()
htmlMarqueeElementSetWidth self val
  = withUTFString val $
      \ valPtr ->
        {# call webkit_dom_html_marquee_element_set_width #}
          (toHTMLMarqueeElement self)
          valPtr
 
htmlMarqueeElementGetWidth ::
                           (HTMLMarqueeElementClass self) => self -> IO String
htmlMarqueeElementGetWidth self
  = ({# call webkit_dom_html_marquee_element_get_width #}
       (toHTMLMarqueeElement self))
      >>=
      readUTFString
