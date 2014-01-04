module Graphics.UI.Gtk.WebKit.DOM.XPathResult
       (xPathResultIterateNext, xPathResultSnapshotItem, cANY_TYPE,
        cNUMBER_TYPE, cSTRING_TYPE, cBOOLEAN_TYPE,
        cUNORDERED_NODE_ITERATOR_TYPE, cORDERED_NODE_ITERATOR_TYPE,
        cUNORDERED_NODE_SNAPSHOT_TYPE, cORDERED_NODE_SNAPSHOT_TYPE,
        cANY_UNORDERED_NODE_TYPE, cFIRST_ORDERED_NODE_TYPE,
        xPathResultGetResultType, xPathResultGetNumberValue,
        xPathResultGetStringValue, xPathResultGetBooleanValue,
        xPathResultGetSingleNodeValue, xPathResultGetInvalidIteratorState,
        xPathResultGetSnapshotLength, XPathResult, XPathResultClass,
        castToXPathResult, gTypeXPathResult, toXPathResult)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
xPathResultIterateNext ::
                       (XPathResultClass self) => self -> IO (Maybe Node)
xPathResultIterateNext self
  = maybeNull (makeNewGObject mkNode)
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_xpath_result_iterate_next #}
             (toXPathResult self)
             errorPtr_)
 
xPathResultSnapshotItem ::
                        (XPathResultClass self) => self -> Word -> IO (Maybe Node)
xPathResultSnapshotItem self index
  = maybeNull (makeNewGObject mkNode)
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_xpath_result_snapshot_item #}
             (toXPathResult self)
             (fromIntegral index)
             errorPtr_)
cANY_TYPE = 0
cNUMBER_TYPE = 1
cSTRING_TYPE = 2
cBOOLEAN_TYPE = 3
cUNORDERED_NODE_ITERATOR_TYPE = 4
cORDERED_NODE_ITERATOR_TYPE = 5
cUNORDERED_NODE_SNAPSHOT_TYPE = 6
cORDERED_NODE_SNAPSHOT_TYPE = 7
cANY_UNORDERED_NODE_TYPE = 8
cFIRST_ORDERED_NODE_TYPE = 9
 
xPathResultGetResultType ::
                         (XPathResultClass self) => self -> IO Word
xPathResultGetResultType self
  = fromIntegral <$>
      ({# call webkit_dom_xpath_result_get_result_type #}
         (toXPathResult self))
 
xPathResultGetNumberValue ::
                          (XPathResultClass self) => self -> IO Double
xPathResultGetNumberValue self
  = realToFrac <$>
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_xpath_result_get_number_value #}
             (toXPathResult self)
             errorPtr_)
 
xPathResultGetStringValue ::
                          (XPathResultClass self) => self -> IO String
xPathResultGetStringValue self
  = (propagateGError $
       \ errorPtr_ ->
         {# call webkit_dom_xpath_result_get_string_value #}
           (toXPathResult self)
           errorPtr_)
      >>=
      readUTFString
 
xPathResultGetBooleanValue ::
                           (XPathResultClass self) => self -> IO Bool
xPathResultGetBooleanValue self
  = toBool <$>
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_xpath_result_get_boolean_value #}
             (toXPathResult self)
             errorPtr_)
 
xPathResultGetSingleNodeValue ::
                              (XPathResultClass self) => self -> IO (Maybe Node)
xPathResultGetSingleNodeValue self
  = maybeNull (makeNewGObject mkNode)
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_xpath_result_get_single_node_value #}
             (toXPathResult self)
             errorPtr_)
 
xPathResultGetInvalidIteratorState ::
                                   (XPathResultClass self) => self -> IO Bool
xPathResultGetInvalidIteratorState self
  = toBool <$>
      ({# call webkit_dom_xpath_result_get_invalid_iterator_state #}
         (toXPathResult self))
 
xPathResultGetSnapshotLength ::
                             (XPathResultClass self) => self -> IO Word
xPathResultGetSnapshotLength self
  = fromIntegral <$>
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_xpath_result_get_snapshot_length #}
             (toXPathResult self)
             errorPtr_)
