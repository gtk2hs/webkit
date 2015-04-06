module Graphics.UI.Gtk.WebKit.DOM.HTMLMarqueeElement(
start,
stop,
setBehavior,
getBehavior,
setBgColor,
getBgColor,
setDirection,
getDirection,
setHeight,
getHeight,
setHspace,
getHspace,
setLoop,
getLoop,
setScrollAmount,
getScrollAmount,
setScrollDelay,
getScrollDelay,
setTrueSpeed,
getTrueSpeed,
setVspace,
getVspace,
setWidth,
getWidth,
HTMLMarqueeElement,
castToHTMLMarqueeElement,
gTypeHTMLMarqueeElement,
HTMLMarqueeElementClass,
toHTMLMarqueeElement,
) where
import Prelude hiding (drop, error, print)
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

 
start :: (MonadIO m, HTMLMarqueeElementClass self) => self -> m ()
start self
  = liftIO
      ({# call webkit_dom_html_marquee_element_start #}
         (toHTMLMarqueeElement self))
 
stop :: (MonadIO m, HTMLMarqueeElementClass self) => self -> m ()
stop self
  = liftIO
      ({# call webkit_dom_html_marquee_element_stop #}
         (toHTMLMarqueeElement self))
 
setBehavior ::
            (MonadIO m, HTMLMarqueeElementClass self, GlibString string) =>
              self -> string -> m ()
setBehavior self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_marquee_element_set_behavior #}
             (toHTMLMarqueeElement self)
             valPtr)
 
getBehavior ::
            (MonadIO m, HTMLMarqueeElementClass self, GlibString string) =>
              self -> m string
getBehavior self
  = liftIO
      (({# call webkit_dom_html_marquee_element_get_behavior #}
          (toHTMLMarqueeElement self))
         >>=
         readUTFString)
 
setBgColor ::
           (MonadIO m, HTMLMarqueeElementClass self, GlibString string) =>
             self -> string -> m ()
setBgColor self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_marquee_element_set_bg_color #}
             (toHTMLMarqueeElement self)
             valPtr)
 
getBgColor ::
           (MonadIO m, HTMLMarqueeElementClass self, GlibString string) =>
             self -> m string
getBgColor self
  = liftIO
      (({# call webkit_dom_html_marquee_element_get_bg_color #}
          (toHTMLMarqueeElement self))
         >>=
         readUTFString)
 
setDirection ::
             (MonadIO m, HTMLMarqueeElementClass self, GlibString string) =>
               self -> string -> m ()
setDirection self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_marquee_element_set_direction #}
             (toHTMLMarqueeElement self)
             valPtr)
 
getDirection ::
             (MonadIO m, HTMLMarqueeElementClass self, GlibString string) =>
               self -> m string
getDirection self
  = liftIO
      (({# call webkit_dom_html_marquee_element_get_direction #}
          (toHTMLMarqueeElement self))
         >>=
         readUTFString)
 
setHeight ::
          (MonadIO m, HTMLMarqueeElementClass self, GlibString string) =>
            self -> string -> m ()
setHeight self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_marquee_element_set_height #}
             (toHTMLMarqueeElement self)
             valPtr)
 
getHeight ::
          (MonadIO m, HTMLMarqueeElementClass self, GlibString string) =>
            self -> m string
getHeight self
  = liftIO
      (({# call webkit_dom_html_marquee_element_get_height #}
          (toHTMLMarqueeElement self))
         >>=
         readUTFString)
 
setHspace ::
          (MonadIO m, HTMLMarqueeElementClass self) => self -> Word -> m ()
setHspace self val
  = liftIO
      ({# call webkit_dom_html_marquee_element_set_hspace #}
         (toHTMLMarqueeElement self)
         (fromIntegral val))
 
getHspace ::
          (MonadIO m, HTMLMarqueeElementClass self) => self -> m Word
getHspace self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_html_marquee_element_get_hspace #}
            (toHTMLMarqueeElement self)))
 
setLoop ::
        (MonadIO m, HTMLMarqueeElementClass self) => self -> Int -> m ()
setLoop self val
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_html_marquee_element_set_loop #}
             (toHTMLMarqueeElement self)
             (fromIntegral val)
             errorPtr_)
 
getLoop ::
        (MonadIO m, HTMLMarqueeElementClass self) => self -> m Int
getLoop self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_html_marquee_element_get_loop #}
            (toHTMLMarqueeElement self)))
 
setScrollAmount ::
                (MonadIO m, HTMLMarqueeElementClass self) => self -> Int -> m ()
setScrollAmount self val
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_html_marquee_element_set_scroll_amount #}
             (toHTMLMarqueeElement self)
             (fromIntegral val)
             errorPtr_)
 
getScrollAmount ::
                (MonadIO m, HTMLMarqueeElementClass self) => self -> m Int
getScrollAmount self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_html_marquee_element_get_scroll_amount #}
            (toHTMLMarqueeElement self)))
 
setScrollDelay ::
               (MonadIO m, HTMLMarqueeElementClass self) => self -> Int -> m ()
setScrollDelay self val
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_html_marquee_element_set_scroll_delay #}
             (toHTMLMarqueeElement self)
             (fromIntegral val)
             errorPtr_)
 
getScrollDelay ::
               (MonadIO m, HTMLMarqueeElementClass self) => self -> m Int
getScrollDelay self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_html_marquee_element_get_scroll_delay #}
            (toHTMLMarqueeElement self)))
 
setTrueSpeed ::
             (MonadIO m, HTMLMarqueeElementClass self) => self -> Bool -> m ()
setTrueSpeed self val
  = liftIO
      ({# call webkit_dom_html_marquee_element_set_true_speed #}
         (toHTMLMarqueeElement self)
         (fromBool val))
 
getTrueSpeed ::
             (MonadIO m, HTMLMarqueeElementClass self) => self -> m Bool
getTrueSpeed self
  = liftIO
      (toBool <$>
         ({# call webkit_dom_html_marquee_element_get_true_speed #}
            (toHTMLMarqueeElement self)))
 
setVspace ::
          (MonadIO m, HTMLMarqueeElementClass self) => self -> Word -> m ()
setVspace self val
  = liftIO
      ({# call webkit_dom_html_marquee_element_set_vspace #}
         (toHTMLMarqueeElement self)
         (fromIntegral val))
 
getVspace ::
          (MonadIO m, HTMLMarqueeElementClass self) => self -> m Word
getVspace self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_html_marquee_element_get_vspace #}
            (toHTMLMarqueeElement self)))
 
setWidth ::
         (MonadIO m, HTMLMarqueeElementClass self, GlibString string) =>
           self -> string -> m ()
setWidth self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_marquee_element_set_width #}
             (toHTMLMarqueeElement self)
             valPtr)
 
getWidth ::
         (MonadIO m, HTMLMarqueeElementClass self, GlibString string) =>
           self -> m string
getWidth self
  = liftIO
      (({# call webkit_dom_html_marquee_element_get_width #}
          (toHTMLMarqueeElement self))
         >>=
         readUTFString)
