module Graphics.UI.Gtk.WebKit.DOM.DOMApplicationCache
       (domApplicationCacheUpdate, domApplicationCacheSwapCache,
        domApplicationCacheAbort, domApplicationCacheDispatchEvent,
        cUNCACHED, cIDLE, cCHECKING, cDOWNLOADING, cUPDATEREADY, cOBSOLETE,
        domApplicationCacheGetStatus, domApplicationCacheOnchecking,
        domApplicationCacheOnerror, domApplicationCacheOnnoupdate,
        domApplicationCacheOndownloading, domApplicationCacheOnprogress,
        domApplicationCacheOnupdateready, domApplicationCacheOncached,
        domApplicationCacheOnobsolete)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
domApplicationCacheUpdate ::
                          (DOMApplicationCacheClass self) => self -> IO ()
domApplicationCacheUpdate self
  = propagateGError $
      \ errorPtr_ ->
        {# call webkit_dom_dom_application_cache_update #}
          (toDOMApplicationCache self)
          errorPtr_
 
domApplicationCacheSwapCache ::
                             (DOMApplicationCacheClass self) => self -> IO ()
domApplicationCacheSwapCache self
  = propagateGError $
      \ errorPtr_ ->
        {# call webkit_dom_dom_application_cache_swap_cache #}
          (toDOMApplicationCache self)
          errorPtr_
 
domApplicationCacheAbort ::
                         (DOMApplicationCacheClass self) => self -> IO ()
domApplicationCacheAbort self
  = {# call webkit_dom_dom_application_cache_abort #}
      (toDOMApplicationCache self)
 
domApplicationCacheDispatchEvent ::
                                 (DOMApplicationCacheClass self, EventClass evt) =>
                                   self -> Maybe evt -> IO Bool
domApplicationCacheDispatchEvent self evt
  = toBool <$>
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_dom_application_cache_dispatch_event #}
             (toDOMApplicationCache self)
             (maybe (Event nullForeignPtr) toEvent evt)
             errorPtr_)
cUNCACHED = 0
cIDLE = 1
cCHECKING = 2
cDOWNLOADING = 3
cUPDATEREADY = 4
cOBSOLETE = 5
 
domApplicationCacheGetStatus ::
                             (DOMApplicationCacheClass self) => self -> IO Word
domApplicationCacheGetStatus self
  = fromIntegral <$>
      ({# call webkit_dom_dom_application_cache_get_status #}
         (toDOMApplicationCache self))
 
domApplicationCacheOnchecking ::
                              (DOMApplicationCacheClass self) =>
                                Signal self (EventM UIEvent self ())
domApplicationCacheOnchecking = (connect "checking")
 
domApplicationCacheOnerror ::
                           (DOMApplicationCacheClass self) =>
                             Signal self (EventM UIEvent self ())
domApplicationCacheOnerror = (connect "error")
 
domApplicationCacheOnnoupdate ::
                              (DOMApplicationCacheClass self) =>
                                Signal self (EventM UIEvent self ())
domApplicationCacheOnnoupdate = (connect "noupdate")
 
domApplicationCacheOndownloading ::
                                 (DOMApplicationCacheClass self) =>
                                   Signal self (EventM UIEvent self ())
domApplicationCacheOndownloading = (connect "downloading")
 
domApplicationCacheOnprogress ::
                              (DOMApplicationCacheClass self) =>
                                Signal self (EventM UIEvent self ())
domApplicationCacheOnprogress = (connect "progress")
 
domApplicationCacheOnupdateready ::
                                 (DOMApplicationCacheClass self) =>
                                   Signal self (EventM UIEvent self ())
domApplicationCacheOnupdateready = (connect "updateready")
 
domApplicationCacheOncached ::
                            (DOMApplicationCacheClass self) =>
                              Signal self (EventM UIEvent self ())
domApplicationCacheOncached = (connect "cached")
 
domApplicationCacheOnobsolete ::
                              (DOMApplicationCacheClass self) =>
                                Signal self (EventM UIEvent self ())
domApplicationCacheOnobsolete = (connect "obsolete")
