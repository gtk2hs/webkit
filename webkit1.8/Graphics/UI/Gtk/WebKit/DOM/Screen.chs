module Graphics.UI.Gtk.WebKit.DOM.Screen
       (screenGetHeight, screenGetWidth, screenGetColorDepth,
        screenGetPixelDepth, screenGetAvailLeft, screenGetAvailTop,
        screenGetAvailHeight, screenGetAvailWidth)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
screenGetHeight :: (DOMScreenClass self) => self -> IO Word
screenGetHeight self
  = fromIntegral <$>
      ({# call webkit_dom_screen_get_height #} (toDOMScreen self))
 
screenGetWidth :: (DOMScreenClass self) => self -> IO Word
screenGetWidth self
  = fromIntegral <$>
      ({# call webkit_dom_screen_get_width #} (toDOMScreen self))
 
screenGetColorDepth :: (DOMScreenClass self) => self -> IO Word
screenGetColorDepth self
  = fromIntegral <$>
      ({# call webkit_dom_screen_get_color_depth #} (toDOMScreen self))
 
screenGetPixelDepth :: (DOMScreenClass self) => self -> IO Word
screenGetPixelDepth self
  = fromIntegral <$>
      ({# call webkit_dom_screen_get_pixel_depth #} (toDOMScreen self))
 
screenGetAvailLeft :: (DOMScreenClass self) => self -> IO Int
screenGetAvailLeft self
  = fromIntegral <$>
      ({# call webkit_dom_screen_get_avail_left #} (toDOMScreen self))
 
screenGetAvailTop :: (DOMScreenClass self) => self -> IO Int
screenGetAvailTop self
  = fromIntegral <$>
      ({# call webkit_dom_screen_get_avail_top #} (toDOMScreen self))
 
screenGetAvailHeight :: (DOMScreenClass self) => self -> IO Word
screenGetAvailHeight self
  = fromIntegral <$>
      ({# call webkit_dom_screen_get_avail_height #} (toDOMScreen self))
 
screenGetAvailWidth :: (DOMScreenClass self) => self -> IO Word
screenGetAvailWidth self
  = fromIntegral <$>
      ({# call webkit_dom_screen_get_avail_width #} (toDOMScreen self))
