module Graphics.UI.Gtk.WebKit.DOM.HTMLTableRowElement(
insertCell,
deleteCell,
getRowIndex,
getSectionRowIndex,
getCells,
setAlign,
getAlign,
setBgColor,
getBgColor,
setCh,
getCh,
setChOff,
getChOff,
setVAlign,
getVAlign,
HTMLTableRowElement,
castToHTMLTableRowElement,
gTypeHTMLTableRowElement,
HTMLTableRowElementClass,
toHTMLTableRowElement,
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

 
insertCell ::
           (MonadIO m, HTMLTableRowElementClass self) =>
             self -> Int -> m (Maybe HTMLElement)
insertCell self index
  = liftIO
      (maybeNull (makeNewGObject mkHTMLElement)
         (propagateGError $
            \ errorPtr_ ->
              {# call webkit_dom_html_table_row_element_insert_cell #}
                (toHTMLTableRowElement self)
                (fromIntegral index)
                errorPtr_))
 
deleteCell ::
           (MonadIO m, HTMLTableRowElementClass self) => self -> Int -> m ()
deleteCell self index
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_html_table_row_element_delete_cell #}
             (toHTMLTableRowElement self)
             (fromIntegral index)
             errorPtr_)
 
getRowIndex ::
            (MonadIO m, HTMLTableRowElementClass self) => self -> m Int
getRowIndex self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_html_table_row_element_get_row_index #}
            (toHTMLTableRowElement self)))
 
getSectionRowIndex ::
                   (MonadIO m, HTMLTableRowElementClass self) => self -> m Int
getSectionRowIndex self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_html_table_row_element_get_section_row_index #}
            (toHTMLTableRowElement self)))
 
getCells ::
         (MonadIO m, HTMLTableRowElementClass self) =>
           self -> m (Maybe HTMLCollection)
getCells self
  = liftIO
      (maybeNull (makeNewGObject mkHTMLCollection)
         ({# call webkit_dom_html_table_row_element_get_cells #}
            (toHTMLTableRowElement self)))
 
setAlign ::
         (MonadIO m, HTMLTableRowElementClass self, GlibString string) =>
           self -> string -> m ()
setAlign self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_table_row_element_set_align #}
             (toHTMLTableRowElement self)
             valPtr)
 
getAlign ::
         (MonadIO m, HTMLTableRowElementClass self, GlibString string) =>
           self -> m string
getAlign self
  = liftIO
      (({# call webkit_dom_html_table_row_element_get_align #}
          (toHTMLTableRowElement self))
         >>=
         readUTFString)
 
setBgColor ::
           (MonadIO m, HTMLTableRowElementClass self, GlibString string) =>
             self -> string -> m ()
setBgColor self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_table_row_element_set_bg_color #}
             (toHTMLTableRowElement self)
             valPtr)
 
getBgColor ::
           (MonadIO m, HTMLTableRowElementClass self, GlibString string) =>
             self -> m string
getBgColor self
  = liftIO
      (({# call webkit_dom_html_table_row_element_get_bg_color #}
          (toHTMLTableRowElement self))
         >>=
         readUTFString)
 
setCh ::
      (MonadIO m, HTMLTableRowElementClass self, GlibString string) =>
        self -> string -> m ()
setCh self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_table_row_element_set_ch #}
             (toHTMLTableRowElement self)
             valPtr)
 
getCh ::
      (MonadIO m, HTMLTableRowElementClass self, GlibString string) =>
        self -> m string
getCh self
  = liftIO
      (({# call webkit_dom_html_table_row_element_get_ch #}
          (toHTMLTableRowElement self))
         >>=
         readUTFString)
 
setChOff ::
         (MonadIO m, HTMLTableRowElementClass self, GlibString string) =>
           self -> string -> m ()
setChOff self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_table_row_element_set_ch_off #}
             (toHTMLTableRowElement self)
             valPtr)
 
getChOff ::
         (MonadIO m, HTMLTableRowElementClass self, GlibString string) =>
           self -> m string
getChOff self
  = liftIO
      (({# call webkit_dom_html_table_row_element_get_ch_off #}
          (toHTMLTableRowElement self))
         >>=
         readUTFString)
 
setVAlign ::
          (MonadIO m, HTMLTableRowElementClass self, GlibString string) =>
            self -> string -> m ()
setVAlign self val
  = liftIO
      (withUTFString val $
         \ valPtr ->
           {# call webkit_dom_html_table_row_element_set_v_align #}
             (toHTMLTableRowElement self)
             valPtr)
 
getVAlign ::
          (MonadIO m, HTMLTableRowElementClass self, GlibString string) =>
            self -> m string
getVAlign self
  = liftIO
      (({# call webkit_dom_html_table_row_element_get_v_align #}
          (toHTMLTableRowElement self))
         >>=
         readUTFString)
