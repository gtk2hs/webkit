module Graphics.UI.Gtk.WebKit.DOM.DocumentFragment
       (documentFragmentQuerySelector, documentFragmentQuerySelectorAll,
        DocumentFragment, DocumentFragmentClass, castToDocumentFragment,
        gTypeDocumentFragment, toDocumentFragment)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
documentFragmentQuerySelector ::
                              (DocumentFragmentClass self) =>
                                self -> String -> IO (Maybe Element)
documentFragmentQuerySelector self selectors
  = maybeNull (makeNewGObject mkElement)
      (propagateGError $
         \ errorPtr_ ->
           withUTFString selectors $
             \ selectorsPtr ->
               {# call webkit_dom_document_fragment_query_selector #}
                 (toDocumentFragment self)
                 selectorsPtr
             errorPtr_)
 
documentFragmentQuerySelectorAll ::
                                 (DocumentFragmentClass self) =>
                                   self -> String -> IO (Maybe NodeList)
documentFragmentQuerySelectorAll self selectors
  = maybeNull (makeNewGObject mkNodeList)
      (propagateGError $
         \ errorPtr_ ->
           withUTFString selectors $
             \ selectorsPtr ->
               {# call webkit_dom_document_fragment_query_selector_all #}
                 (toDocumentFragment self)
                 selectorsPtr
             errorPtr_)
