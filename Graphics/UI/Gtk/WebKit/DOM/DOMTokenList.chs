module Graphics.UI.Gtk.WebKit.DOM.DOMTokenList(
item,
contains,
add,
remove,
toggle,
getLength,
DOMTokenList,
castToDOMTokenList,
gTypeDOMTokenList,
DOMTokenListClass,
toDOMTokenList,
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

 
item ::
     (MonadIO m, DOMTokenListClass self, GlibString string) =>
       self -> Word -> m string
item self index
  = liftIO
      (({# call webkit_dom_dom_token_list_item #} (toDOMTokenList self)
          (fromIntegral index))
         >>=
         readUTFString)
 
contains ::
         (MonadIO m, DOMTokenListClass self, GlibString string) =>
           self -> string -> m Bool
contains self token
  = liftIO
      (toBool <$>
         (propagateGError $
            \ errorPtr_ ->
              withUTFString token $
                \ tokenPtr ->
                  {# call webkit_dom_dom_token_list_contains #} (toDOMTokenList self)
                    tokenPtr
                errorPtr_))
 
add ::
    (MonadIO m, DOMTokenListClass self, GlibString string) =>
      self -> string -> m ()
add self tokens
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           withUTFString tokens $
             \ tokensPtr ->
               {# call webkit_dom_dom_token_list_add #} (toDOMTokenList self)
                 tokensPtr
             errorPtr_)
 
remove ::
       (MonadIO m, DOMTokenListClass self, GlibString string) =>
         self -> string -> m ()
remove self tokens
  = liftIO
      (propagateGError $
         \ errorPtr_ ->
           withUTFString tokens $
             \ tokensPtr ->
               {# call webkit_dom_dom_token_list_remove #} (toDOMTokenList self)
                 tokensPtr
             errorPtr_)
 
toggle ::
       (MonadIO m, DOMTokenListClass self, GlibString string) =>
         self -> string -> Bool -> m Bool
toggle self token force
  = liftIO
      (toBool <$>
         (propagateGError $
            \ errorPtr_ ->
              withUTFString token $
                \ tokenPtr ->
                  {# call webkit_dom_dom_token_list_toggle #} (toDOMTokenList self)
                    tokenPtr
                (fromBool force)
                errorPtr_))
 
getLength :: (MonadIO m, DOMTokenListClass self) => self -> m Word
getLength self
  = liftIO
      (fromIntegral <$>
         ({# call webkit_dom_dom_token_list_get_length #}
            (toDOMTokenList self)))
