{-# LANGUAGE CPP #-}
-- -*-haskell-*-
-----------------------------------------------------------------------------
--  Module      :  Graphics.UI.Gtk.WebKit.NetworkRequest
--  Author      :  Cjacker Huang
--  Copyright   :  (c) 2009 Cjacker Huang <jzhuang@redflag-linux.com>
--
--  This library is free software; you can redistribute it and/or
--  modify it under the terms of the GNU Lesser General Public
--  License as published by the Free Software Foundation; either
--  version 2.1 of the License, or (at your option) any later version.
--
--  This library is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
--  Lesser General Public License for more details.
--
-- |
-- Maintainer  : gtk2hs-users@lists.sourceforge.net
-- Stability   : provisional
-- Portability : portable (depends on GHC)
--
-- The target of a navigation request
-----------------------------------------------------------------------------

module Graphics.UI.Gtk.WebKit.NetworkRequest (
-- * Description
-- | This class represents the network related aspects of a navigation request. It is used whenever
-- WebKit wants to provide information about a request that will be sent, or has been sent. Inside it
-- you can find the URI of the request, and, for valid URIs, a SoupMessage object, which provides
-- access to further information such as headers.

-- * Types
  NetworkRequest,
  NetworkRequestClass,

-- * Constructors
  networkRequestNew,

-- * Methods
  networkRequestSetUri,
  networkRequestGetUri,
) where

import Control.Monad		(liftM)

import System.Glib.FFI
import System.Glib.UTFString
import System.Glib.GList
import System.Glib.GError
import Graphics.UI.Gtk.Gdk.Events

{#import Graphics.UI.Gtk.Abstract.Object#}	(makeNewObject)
{#import Graphics.UI.Gtk.WebKit.Types#}
{#import System.Glib.GObject#}

{#context lib="webkit" prefix ="webkit"#}

------------------
-- Constructors


-- | Create a new NetworkRequest with the given @uri@.
--
-- It is used whenever WebKit wants to provide information
-- about a request that will be sent, or has been sent.
networkRequestNew ::
    GlibString string
 => string  -- ^ @uri@ - the uri of the request
 -> IO NetworkRequest
networkRequestNew uri =
    withUTFString uri $ \uriPtr ->
      wrapNewGObject mkNetworkRequest $
        {#call network_request_new#} uriPtr


-- | Set the URI of 'NetworkRequest'.
--
networkRequestSetUri ::
    GlibString string
 => NetworkRequestClass self => self
 -> string  -- ^ @uri@ - the uri will be set to the request.
 -> IO()
networkRequestSetUri networkrequest uri =
    withUTFString uri $ \uriPtr ->
      {#call network_request_set_uri#}
        (toNetworkRequest networkrequest)
        uriPtr


-- | Return the uri of 'NetworkRequest'.
networkRequestGetUri ::
    GlibString string
 => NetworkRequestClass self => self
 -> IO (Maybe string) -- ^ the URI or @Nothing@ in case failed.
networkRequestGetUri networkrequest =
    {#call network_request_get_uri#}
      (toNetworkRequest networkrequest) >>=
      maybePeek peekUTFString
