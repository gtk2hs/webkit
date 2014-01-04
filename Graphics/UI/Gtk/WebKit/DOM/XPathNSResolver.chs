module Graphics.UI.Gtk.WebKit.DOM.XPathNSResolver
       (xPathNSResolverLookupNamespaceURI, XPathNSResolver,
        XPathNSResolverClass, castToXPathNSResolver, gTypeXPathNSResolver,
        toXPathNSResolver)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
xPathNSResolverLookupNamespaceURI ::
                                  (XPathNSResolverClass self) => self -> String -> IO String
xPathNSResolverLookupNamespaceURI self prefix
  = (withUTFString prefix $
       \ prefixPtr ->
         {# call webkit_dom_xpath_ns_resolver_lookup_namespace_uri #}
           (toXPathNSResolver self)
           prefixPtr)
      >>=
      readUTFString
