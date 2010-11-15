{-# LANGUAGE CPP #-}
-- -*-haskell-*-
-----------------------------------------------------------------------------
--  Module      :  Graphics.UI.Gtk.WebKit.WebDataSource
--  Author      :  Andy Stewart
--  Copyright   :  (c) 2010 Andy Stewart <lazycat.manatee@gmail.com>
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
-- Note
--
-- Function `webkit_web_data_source_get_data` haven't binding, 
-- no idea how to handle `GString`
--
-- Access to the WebKit Web DataSource
-----------------------------------------------------------------------------

module Graphics.UI.Gtk.WebKit.WebDataSource (
-- * Description
-- | Data source encapsulates the content of a WebKitWebFrame. A WebKitWebFrame has a main resource and
-- subresources and the data source provides access to these resources. When a request gets loaded
-- initially, it is set to a provisional state. The application can request for the request that
-- initiated the load by asking for the provisional data source and invoking the
-- 'webDataSourceGetInitialRequest' method of WebKitWebDataSource. This data source may not
-- have enough data and some methods may return empty values. To get a "full" data source with the data
-- and resources loaded, you need to get the non-provisional data source through WebKitWebFrame's
-- 'webFrameGetDataSource' method. This data source will have the data after everything was
-- loaded. Make sure that the data source was finished loading before using any of its methods. You can
-- do this via 'webDataSourceIsLoading'.

-- * Types
  WebDataSource,
  WebDataSourceClass,

-- * Constructors
  webDataSourceNew,

-- * Methods  
  webDataSourceGetData,
  webDataSourceGetEncoding,
  webDataSourceGetInitialRequest,
  webDataSourceGetMainResource,
  webDataSourceGetRequest,
  webDataSourceGetSubresources,
  webDataSourceGetUnreachableUri,
  webDataSourceGetWebFrame,
  webDataSourceIsLoading,
) where

import Control.Monad		(liftM)

import System.Glib.FFI
import System.Glib.UTFString
import System.Glib.GList
import System.Glib.GString
import System.Glib.GError 
import Graphics.UI.Gtk.Gdk.Events

{#import Graphics.UI.Gtk.Abstract.Object#}	(makeNewObject)
{#import Graphics.UI.Gtk.WebKit.Types#}
{#import System.Glib.GObject#}

{#context lib="webkit" prefix ="webkit"#}

-- | Creates a new 'WebDataSource' instance. 
-- The URL of the 'WebDataSource' will be set to "about:blank".
webDataSourceNew :: IO WebDataSource
webDataSourceNew = 
    wrapNewGObject mkWebDataSource $ {#call web_data_source_new#} 

-- | Returns the raw data that represents the the frame's content. The data will be incomplete until the
-- data has finished loading. Returns 'Nothing' if the web frame hasn't loaded any data. Use
-- @webkitWebDataSourceIsLoading@ to test if data source is in the process of loading.
webDataSourceGetData :: WebDataSourceClass self => self
                     -> IO (Maybe String)
webDataSourceGetData ds = do
  gstr <- {#call webkit_web_data_source_get_data #}
                 (toWebDataSource ds)
  readGString gstr

-- | Returns the text encoding name as set in the 'WebView', or if not, the text encoding of the response.
webDataSourceGetEncoding ::
   WebDataSourceClass self => self
 -> IO String
webDataSourceGetEncoding ds = 
  {#call web_data_source_get_encoding#} (toWebDataSource ds) >>= peekCString
  
-- | Returns a reference to the original request that was used to load the web content. 
-- The NetworkRequest returned by this method is the
-- request prior to the "committed" load state. 
-- See 'webDataSourceGetRequest' for getting the "committed" request.
webDataSourceGetInitialRequest ::
   WebDataSourceClass self => self
 -> IO NetworkRequest
webDataSourceGetInitialRequest ds =
  makeNewGObject mkNetworkRequest $ {# call web_data_source_get_initial_request#} (toWebDataSource ds)

-- | Returns the main resource of the data_source
webDataSourceGetMainResource ::
   WebDataSourceClass self => self
 -> IO WebResource   
webDataSourceGetMainResource ds =
  makeNewGObject mkWebResource $ {#call web_data_source_get_main_resource#} (toWebDataSource ds)
  
-- | Returns a NetworkRequest that was used to create this 'WebDataSource'. 
-- The NetworkRequest returned by this method is the request that was "committed", 
-- and hence, different from the request you get from the 'webDataSourceGetInitialRequest' method.
webDataSourceGetRequest ::
   WebDataSourceClass self => self
 -> IO NetworkRequest
webDataSourceGetRequest ds =
  makeNewGObject mkNetworkRequest $ {# call web_data_source_get_request#} (toWebDataSource ds)

-- | Gives you a List of 'WebResource' objects that compose the 'WebView' to which this 'WebDataSource' is attached.
webDataSourceGetSubresources ::
   WebDataSourceClass self => self
 -> IO [WebResource]   
webDataSourceGetSubresources ds = do
  glist <- {#call web_data_source_get_subresources#} (toWebDataSource ds)
  resourcePtr <- fromGList glist
  mapM (makeNewGObject mkWebResource . return) resourcePtr

-- | Return the unreachable URI of data_source. 
-- The 'dataSource' will have an unreachable URL 
-- if it was created using 'WebFrame''s  
-- 'webFrameLoadAlternateHtmlString' method.
webDataSourceGetUnreachableUri ::
   WebDataSourceClass self => self
 -> IO String
webDataSourceGetUnreachableUri ds =
  {#call web_data_source_get_unreachable_uri#} (toWebDataSource ds) >>= peekCString

-- | Returns the 'WebFrame' that represents this data source
webDataSourceGetWebFrame ::
   WebDataSourceClass self => self
 -> IO WebFrame
webDataSourceGetWebFrame ds =
  makeNewGObject mkWebFrame $ {#call web_data_source_get_web_frame#} (toWebDataSource ds)

-- | Determines whether the data source is in the process of loading its content.
webDataSourceIsLoading ::
   WebDataSourceClass self => self
 -> IO Bool
webDataSourceIsLoading ds =
    liftM toBool $ {#call web_data_source_is_loading#} (toWebDataSource ds)
