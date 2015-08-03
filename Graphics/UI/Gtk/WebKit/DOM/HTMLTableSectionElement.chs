module Graphics.UI.Gtk.WebKit.DOM.HTMLTableSectionElement(
insertRow,
deleteRow,
setAlign,
getAlign,
setCh,
getCh,
setChOff,
getChOff,
setVAlign,
getVAlign,
getRows,
HTMLTableSectionElement,
castToHTMLTableSectionElement,
gTypeHTMLTableSectionElement,
HTMLTableSectionElementClass,
toHTMLTableSectionElement,
) where
import Prelude hiding (drop, error, print)
import Data.Typeable (Typeable)
import Foreign.Marshal (maybePeek, maybeWith)
import System.Glib.FFI (maybeNull, withForeignPtr, nullForeignPtr, Ptr, nullPtr, castPtr, Word, Int64, Word64, CChar(..), CInt(..), CUInt(..), CLong(..), CULong(..), CLLong(..), CULLong(..), CShort(..), CUShort(..), CFloat(..), CDouble(..), toBool, fromBool)
import System.Glib.UTFString (GlibString(..), readUTFString)
import Control.Applicative ((<$>))
import Control.Monad (void)
import Control.Monad.IO.Class (MonadIO(..))
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventTargetClosures
import Graphics.UI.Gtk.WebKit.DOM.EventM
{#import Graphics.UI.Gtk.WebKit.Types#}
import Graphics.UI.Gtk.WebKit.DOM.Enums

 
insertRow ::
          (MonadIO m, HTMLTableSectionElementClass self) =>
            self -> Int -> m (Maybe HTMLElement)
insertRow self index
  = liftIO
      (maybeNull (makeNewGObject mkHTMLElement)
         (propagateGError $
            \ errorPtr_ ->
              {# call webkit_dom_html_table_section_element_insert_row #}
                (toHTMLTableSectionElement self)
                (fromIntegral index)
                errorPtr_))
 
deleteRow ::
          (MonadIO m, HTMLTableSectionElementClass self) =>
            self -> Int -> m ()
deleteRow self index
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_html_table_section_element_delete_row #}
             (toHTMLTableSectionElement self)
             (fromIntegral index)
             errorPtr_)
 
setAlign ::
         (MonadIO m, HTMLTableSectionElementClass self,
          GlibString string) =>
           self -> string -> m ()
setAlign self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_table_section_element_set_align #}
             (toHTMLTableSectionElement self)
             valPtr)
 
getAlign ::
         (MonadIO m, HTMLTableSectionElementClass self,
          GlibString string) =>
           self -> m string
getAlign self
  = liftIO
      (({# call webkit_dom_html_table_section_element_get_align #}
          (toHTMLTableSectionElement self))
         >>=
         readUTFString)
 
setCh ::
      (MonadIO m, HTMLTableSectionElementClass self,
       GlibString string) =>
        self -> string -> m ()
setCh self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_table_section_element_set_ch #}
             (toHTMLTableSectionElement self)
             valPtr)
 
getCh ::
      (MonadIO m, HTMLTableSectionElementClass self,
       GlibString string) =>
        self -> m string
getCh self
  = liftIO
      (({# call webkit_dom_html_table_section_element_get_ch #}
          (toHTMLTableSectionElement self))
         >>=
         readUTFString)
 
setChOff ::
         (MonadIO m, HTMLTableSectionElementClass self,
          GlibString string) =>
           self -> string -> m ()
setChOff self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_table_section_element_set_ch_off #}
             (toHTMLTableSectionElement self)
             valPtr)
 
getChOff ::
         (MonadIO m, HTMLTableSectionElementClass self,
          GlibString string) =>
           self -> m string
getChOff self
  = liftIO
      (({# call webkit_dom_html_table_section_element_get_ch_off #}
          (toHTMLTableSectionElement self))
         >>=
         readUTFString)
 
setVAlign ::
          (MonadIO m, HTMLTableSectionElementClass self,
           GlibString string) =>
            self -> string -> m ()
setVAlign self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_table_section_element_set_v_align #}
             (toHTMLTableSectionElement self)
             valPtr)
 
getVAlign ::
          (MonadIO m, HTMLTableSectionElementClass self,
           GlibString string) =>
            self -> m string
getVAlign self
  = liftIO
      (({# call webkit_dom_html_table_section_element_get_v_align #}
          (toHTMLTableSectionElement self))
         >>=
         readUTFString)
 
getRows ::
        (MonadIO m, HTMLTableSectionElementClass self) =>
          self -> m (Maybe HTMLCollection)
getRows self
  = liftIO
      (maybeNull (makeNewGObject mkHTMLCollection)
         ({# call webkit_dom_html_table_section_element_get_rows #}
            (toHTMLTableSectionElement self)))
