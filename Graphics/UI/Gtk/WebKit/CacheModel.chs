{-# LANGUAGE CPP #-}
-- -*-haskell-*-
-----------------------------------------------------------------------------
--  Module      :  Graphics.UI.Gtk.WebKit.CacheModel
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
-- Object used to communicate with the application when downloading 
-----------------------------------------------------------------------------

module Graphics.UI.Gtk.WebKit.CacheModel (
#if WEBKIT_CHECK_VERSION (1,1,18)
-- * Enums
   CacheModel (..),

-- * Methods
  getCacheModel,   
  setCacheModel,
#endif
) where

import Control.Monad		(liftM)

import System.Glib.FFI
import System.Glib.UTFString
import System.Glib.GList
import System.Glib.Attributes
import System.Glib.Properties
import System.Glib.GError 
import Graphics.UI.Gtk.Gdk.Events

{#import Graphics.UI.Gtk.Abstract.Object#}	(makeNewObject)
{#import Graphics.UI.Gtk.WebKit.Types#}
{#import Graphics.UI.Gtk.WebKit.Signals#}
{#import Graphics.UI.Gtk.WebKit.Internal#}
{#import System.Glib.GObject#}
{#import Graphics.UI.Gtk.General.Selection#} ( TargetList )
{#import Graphics.UI.Gtk.MenuComboToolbar.Menu#}
{#import Graphics.UI.Gtk.General.Enums#}

{#context lib="webkit" prefix ="webkit"#}

#if WEBKIT_CHECK_VERSION (1,1,18)
------------------
-- Enums

{#enum CacheModel {underscoreToCase}#}

------------------
-- Methods
-- | Returns the current cache model. For more information about this value check the documentation of
-- the function 'setCacheModel'.
-- 
-- * Since 1.1.18
getCacheModel :: IO CacheModel
getCacheModel = 
  liftM (toEnum . fromIntegral) $
  {#call webkit_get_cache_model #} 

-- | Specifies a usage model for WebViews, which WebKit will use to determine its caching behavior. All
-- web views follow the cache model. This cache model determines the RAM and disk space to use for
-- caching previously viewed content .
-- 
-- Research indicates that users tend to browse within clusters of documents that hold resources in
-- common, and to revisit previously visited documents. WebKit and the frameworks below it include
-- built-in caches that take advantage of these patterns, substantially improving document load speed
-- in browsing situations. The WebKit cache model controls the behaviors of all of these caches,
-- including various WebCore caches.
-- 
-- Browsers can improve document load speed substantially by specifying
-- WebkitCacheModelWebBrowser. Applications without a browsing interface can reduce memory usage
-- substantially by specifying WebkitCacheModelDocumentViewer. Default value is
-- WebkitCacheModelWebBrowser.
--
-- * Since 1.1.18
setCacheModel :: CacheModel -> IO ()
setCacheModel model =
  {#call webkit_set_cache_model #} ((fromIntegral . fromEnum) model)
#endif
