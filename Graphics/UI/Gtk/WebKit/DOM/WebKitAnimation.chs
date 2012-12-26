module Graphics.UI.Gtk.WebKit.DOM.WebKitAnimation
       (webKitAnimationPlay, webKitAnimationPause, cDIRECTION_NORMAL,
        cDIRECTION_ALTERNATE, cFILL_NONE, cFILL_BACKWARDS, cFILL_FORWARDS,
        cFILL_BOTH, webKitAnimationGetName, webKitAnimationGetDuration,
        webKitAnimationSetElapsedTime, webKitAnimationGetElapsedTime,
        webKitAnimationGetDelay, webKitAnimationGetPaused,
        webKitAnimationGetEnded, webKitAnimationGetDirection,
        webKitAnimationGetFillMode)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
webKitAnimationPlay :: (WebKitAnimationClass self) => self -> IO ()
webKitAnimationPlay self
  = {# call webkit_dom_webkit_animation_play #}
      (toWebKitAnimation self)
 
webKitAnimationPause ::
                     (WebKitAnimationClass self) => self -> IO ()
webKitAnimationPause self
  = {# call webkit_dom_webkit_animation_pause #}
      (toWebKitAnimation self)
cDIRECTION_NORMAL = 0
cDIRECTION_ALTERNATE = 1
cFILL_NONE = 0
cFILL_BACKWARDS = 1
cFILL_FORWARDS = 2
cFILL_BOTH = 3
 
webKitAnimationGetName ::
                       (WebKitAnimationClass self) => self -> IO String
webKitAnimationGetName self
  = ({# call webkit_dom_webkit_animation_get_name #}
       (toWebKitAnimation self))
      >>=
      readUTFString
 
webKitAnimationGetDuration ::
                           (WebKitAnimationClass self) => self -> IO Double
webKitAnimationGetDuration self
  = realToFrac <$>
      ({# call webkit_dom_webkit_animation_get_duration #}
         (toWebKitAnimation self))
 
webKitAnimationSetElapsedTime ::
                              (WebKitAnimationClass self) => self -> Double -> IO ()
webKitAnimationSetElapsedTime self val
  = {# call webkit_dom_webkit_animation_set_elapsed_time #}
      (toWebKitAnimation self)
      (realToFrac val)
 
webKitAnimationGetElapsedTime ::
                              (WebKitAnimationClass self) => self -> IO Double
webKitAnimationGetElapsedTime self
  = realToFrac <$>
      ({# call webkit_dom_webkit_animation_get_elapsed_time #}
         (toWebKitAnimation self))
 
webKitAnimationGetDelay ::
                        (WebKitAnimationClass self) => self -> IO Double
webKitAnimationGetDelay self
  = realToFrac <$>
      ({# call webkit_dom_webkit_animation_get_delay #}
         (toWebKitAnimation self))
 
webKitAnimationGetPaused ::
                         (WebKitAnimationClass self) => self -> IO Bool
webKitAnimationGetPaused self
  = toBool <$>
      ({# call webkit_dom_webkit_animation_get_paused #}
         (toWebKitAnimation self))
 
webKitAnimationGetEnded ::
                        (WebKitAnimationClass self) => self -> IO Bool
webKitAnimationGetEnded self
  = toBool <$>
      ({# call webkit_dom_webkit_animation_get_ended #}
         (toWebKitAnimation self))
 
webKitAnimationGetDirection ::
                            (WebKitAnimationClass self) => self -> IO Word
webKitAnimationGetDirection self
  = fromIntegral <$>
      ({# call webkit_dom_webkit_animation_get_direction #}
         (toWebKitAnimation self))
 
webKitAnimationGetFillMode ::
                           (WebKitAnimationClass self) => self -> IO Word
webKitAnimationGetFillMode self
  = fromIntegral <$>
      ({# call webkit_dom_webkit_animation_get_fill_mode #}
         (toWebKitAnimation self))
