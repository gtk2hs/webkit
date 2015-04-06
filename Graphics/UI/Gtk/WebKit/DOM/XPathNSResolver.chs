module Graphics.UI.Gtk.WebKit.DOM.XPathNSResolver(
lookupNamespaceURI,
XPathNSResolver,
castToXPathNSResolver,
gTypeXPathNSResolver,
XPathNSResolverClass,
toXPathNSResolver,
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

 
lookupNamespaceURI ::
                   (MonadIO m, XPathNSResolverClass self, GlibString string) =>
                     self -> string -> m string
lookupNamespaceURI self prefix
  = liftIO
      ((withUTFString prefix $
          \ prefixPtr ->
            {# call webkit_dom_xpath_ns_resolver_lookup_namespace_uri #}
              (toXPathNSResolver self)
              prefixPtr)
         >>=
         readUTFString)
