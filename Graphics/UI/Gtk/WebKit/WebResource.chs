{-# LANGUAGE CPP #-}
-- -*-haskell-*-
-----------------------------------------------------------------------------
--  Module      :  Graphics.UI.Gtk.WebKit.WebResource
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
-- Note:
--
-- Function `webkit_web_resource_get_data` haven't binding
-- no idea how to handle `GString`.
--
-- Access to the WebKit Web Resource
-----------------------------------------------------------------------------

module Graphics.UI.Gtk.WebKit.WebResource (
-- * Description
-- | A web resource encapsulates the data of the download as well as the URI, MIME type and frame name of
-- the resource.

-- * Types
  WebResource,
  WebResourceClass,

-- * Constructors
  webResourceNew,

-- * Methods  
  webResourceGetData,
  webResourceGetEncoding,
  webResourceGetFrameName,
  webResourceGetMimeType,
  webResourceGetUri,
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

-- | Returns a new WebKitWebResource. 
-- The @encoding@ can be empty. 
-- The @frameName@ can be used if the resource represents contents of an
-- entire HTML frame, otherwise pass empty.
webResourceNew :: String -> Int -> String -> String -> String -> String -> IO WebResource
webResourceNew resData size uri mimeType encoding frameName =
   withCString resData $ \dataPtr -> 
   withCString uri $ \uriPtr ->
   withCString mimeType $ \mimePtr ->
   withCString encoding $ \encodingPtr ->
   withCString frameName $ \framePtr -> 
   wrapNewGObject mkWebResource $ 
     {#call web_resource_new#} dataPtr (fromIntegral size) uriPtr mimePtr encodingPtr framePtr

-- | Returns the data of the WebResource.
webResourceGetData :: WebResourceClass self => self -> IO (Maybe String)
webResourceGetData wr =
  {#call web_resource_get_data#} (toWebResource wr) >>= readGStringRaw

-- | Get encoding.
webResourceGetEncoding :: 
   WebResourceClass self => self
 -> IO (Maybe String)
webResourceGetEncoding wr =
  {#call web_resource_get_encoding#} (toWebResource wr) >>= maybePeek peekCString

-- | Get frame name.
webResourceGetFrameName :: 
   WebResourceClass self => self
 -> IO (Maybe String)
webResourceGetFrameName wr =
  {#call web_resource_get_frame_name#} (toWebResource wr) >>= maybePeek peekCString

-- | Get mime type.
webResourceGetMimeType :: 
   WebResourceClass self => self
 -> IO (Maybe String)
webResourceGetMimeType wr =
  {#call web_resource_get_mime_type#} (toWebResource wr) >>= maybePeek peekCString

-- | Get uri.
webResourceGetUri :: 
   WebResourceClass self => self
 -> IO String
webResourceGetUri wr =
  {#call web_resource_get_uri#} (toWebResource wr) >>= peekCString
