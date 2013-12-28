module Graphics.UI.Gtk.WebKit.DOM.TimeRanges
       (timeRangesStart, timeRangesEnd, timeRangesGetLength) where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
timeRangesStart ::
                (TimeRangesClass self) => self -> Word -> IO Double
timeRangesStart self index
  = realToFrac <$>
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_time_ranges_start #} (toTimeRanges self)
             (fromIntegral index)
             errorPtr_)
 
timeRangesEnd ::
              (TimeRangesClass self) => self -> Word -> IO Double
timeRangesEnd self index
  = realToFrac <$>
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_time_ranges_end #} (toTimeRanges self)
             (fromIntegral index)
             errorPtr_)
 
timeRangesGetLength :: (TimeRangesClass self) => self -> IO Word
timeRangesGetLength self
  = fromIntegral <$>
      ({# call webkit_dom_time_ranges_get_length #} (toTimeRanges self))
