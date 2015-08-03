module Graphics.UI.Gtk.WebKit.DOM.XPathExpression(
evaluate,
XPathExpression,
castToXPathExpression,
gTypeXPathExpression,
XPathExpressionClass,
toXPathExpression,
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

 
evaluate ::
         (MonadIO m, XPathExpressionClass self, NodeClass contextNode,
          XPathResultClass inResult) =>
           self ->
             Maybe contextNode ->
               Word -> Maybe inResult -> m (Maybe XPathResult)
evaluate self contextNode type' inResult
  = liftIO
      (maybeNull (makeNewGObject mkXPathResult)
         (propagateGError $
            \ errorPtr_ ->
              {# call webkit_dom_xpath_expression_evaluate #}
                (toXPathExpression self)
                (maybe (Node nullForeignPtr) toNode contextNode)
                (fromIntegral type')
                (maybe (XPathResult nullForeignPtr) toXPathResult inResult)
                errorPtr_))
