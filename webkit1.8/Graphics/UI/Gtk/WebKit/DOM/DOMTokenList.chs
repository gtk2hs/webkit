module Graphics.UI.Gtk.WebKit.DOM.DOMTokenList
       (domTokenListItem, domTokenListContains, domTokenListAdd,
        domTokenListRemove, domTokenListToggle, domTokenListGetLength)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
domTokenListItem ::
                 (DOMTokenListClass self) => self -> Word -> IO String
domTokenListItem self index
  = ({# call webkit_dom_dom_token_list_item #} (toDOMTokenList self)
       (fromIntegral index))
      >>=
      readUTFString
 
domTokenListContains ::
                     (DOMTokenListClass self) => self -> String -> IO Bool
domTokenListContains self token
  = toBool <$>
      (propagateGError $
         \ errorPtr_ ->
           withUTFString token $
             \ tokenPtr ->
               {# call webkit_dom_dom_token_list_contains #} (toDOMTokenList self)
                 tokenPtr
             errorPtr_)
 
domTokenListAdd ::
                (DOMTokenListClass self) => self -> String -> IO ()
domTokenListAdd self token
  = propagateGError $
      \ errorPtr_ ->
        withUTFString token $
          \ tokenPtr ->
            {# call webkit_dom_dom_token_list_add #} (toDOMTokenList self)
              tokenPtr
          errorPtr_
 
domTokenListRemove ::
                   (DOMTokenListClass self) => self -> String -> IO ()
domTokenListRemove self token
  = propagateGError $
      \ errorPtr_ ->
        withUTFString token $
          \ tokenPtr ->
            {# call webkit_dom_dom_token_list_remove #} (toDOMTokenList self)
              tokenPtr
          errorPtr_
 
domTokenListToggle ::
                   (DOMTokenListClass self) => self -> String -> IO Bool
domTokenListToggle self token
  = toBool <$>
      (propagateGError $
         \ errorPtr_ ->
           withUTFString token $
             \ tokenPtr ->
               {# call webkit_dom_dom_token_list_toggle #} (toDOMTokenList self)
                 tokenPtr
             errorPtr_)
 
domTokenListGetLength ::
                      (DOMTokenListClass self) => self -> IO Word
domTokenListGetLength self
  = fromIntegral <$>
      ({# call webkit_dom_dom_token_list_get_length #}
         (toDOMTokenList self))
