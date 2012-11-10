module Graphics.UI.Gtk.WebKit.DOM.XPathExpression
       (xPathExpressionEvaluate) where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
xPathExpressionEvaluate ::
                        (XPathExpressionClass self, NodeClass contextNode,
                         XPathResultClass inResult) =>
                          self ->
                            Maybe contextNode ->
                              Word -> Maybe inResult -> IO (Maybe XPathResult)
xPathExpressionEvaluate self contextNode type' inResult
  = maybeNull (makeNewGObject mkXPathResult)
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_xpath_expression_evaluate #}
             (toXPathExpression self)
             (maybe (Node nullForeignPtr) toNode contextNode)
             (fromIntegral type')
             (maybe (XPathResult nullForeignPtr) toXPathResult inResult)
             errorPtr_)
