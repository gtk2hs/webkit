module Graphics.UI.Gtk.WebKit.DOM.MemoryInfo
       (memoryInfoGetTotalJSHeapSize, memoryInfoGetUsedJSHeapSize,
        memoryInfoGetJsHeapSizeLimit)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
memoryInfoGetTotalJSHeapSize ::
                             (MemoryInfoClass self) => self -> IO Word
memoryInfoGetTotalJSHeapSize self
  = fromIntegral <$>
      ({# call webkit_dom_memory_info_get_total_js_heap_size #}
         (toMemoryInfo self))
 
memoryInfoGetUsedJSHeapSize ::
                            (MemoryInfoClass self) => self -> IO Word
memoryInfoGetUsedJSHeapSize self
  = fromIntegral <$>
      ({# call webkit_dom_memory_info_get_used_js_heap_size #}
         (toMemoryInfo self))
 
memoryInfoGetJsHeapSizeLimit ::
                             (MemoryInfoClass self) => self -> IO Word
memoryInfoGetJsHeapSizeLimit self
  = fromIntegral <$>
      ({# call webkit_dom_memory_info_get_js_heap_size_limit #}
         (toMemoryInfo self))
