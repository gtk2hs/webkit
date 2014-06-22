{-# LANGUAGE CPP #-}
-- -*-haskell-*-
-----------------------------------------------------------------------------
--  Module      :  Graphics.UI.Gtk.WebKit.WebHistoryItem
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
-- One item of the 'WebBackForwardList' and or global history
-----------------------------------------------------------------------------

module Graphics.UI.Gtk.WebKit.WebHistoryItem (
-- * Description
-- | A history item consists out of a title and a uri. It can be part of the WebKitWebBackForwardList and
-- the global history.  The global history is used for coloring the links of visited
-- sites. WebKitWebHistoryItem's constructed with 'webHistoryItemNew' and
-- 'webHistoryItemNewWithData' are automatically added to the global history.

-- * Types
  WebHistoryItem,
  WebHistoryItemClass,

-- * Constructors
  webHistoryItemNew,
  webHistoryItemNewWithData,

-- * Attributes
  webHistoryItemTitle,
  webHistoryItemAlternateTitle,
  webHistoryItemUri,
  webHistoryItemOriginalUri,
  webHistoryItemLastVisitedTime,

-- * Methods
  webHistoryItemGetTitle,
  webHistoryItemGetAlternateTitle,
  webHistoryItemSetAlternateTitle,
  webHistoryItemGetUri,
  webHistoryItemGetOriginalUri,
  webHistoryItemGetLastVisitedTime,
#if WEBKIT_CHECK_VERSION (1,1,18)
  webHistoryItemCopy,
#endif
) where

import Control.Monad		(liftM)

import System.Glib.FFI
import System.Glib.UTFString
import System.Glib.GList
import System.Glib.GError
import System.Glib.Attributes
import Graphics.UI.Gtk.Gdk.Events

{#import Graphics.UI.Gtk.Abstract.Object#}	(makeNewObject)
{#import Graphics.UI.Gtk.WebKit.Types#}
{#import System.Glib.GObject#}

{#context lib="webkit" prefix ="webkit"#}

------------------
-- Constructors



-- | Create a new 'WebHistoryItem' instance.
--
-- A history item consists out of a title and a uri,
-- it can be part of the WebBackForwardList and the global history.
--
-- The global history is used for coloring the links of visited sites.
-- 'WebHistoryItem' constructed with 'webHistoryItemNew' are
-- automatically added to the global history.
webHistoryItemNew :: IO WebHistoryItem
webHistoryItemNew =
    wrapNewGObject mkWebHistoryItem $ {#call web_history_item_new#}


-- | Create a new 'WebHistoryItem' instance with the given @uri@ and @title@.
--
-- 'WebHistoryItem' constructed with 'webHistoryItemNewWithData' are
-- automatically added to the global history.
webHistoryItemNewWithData ::
    GlibString string
 => string -- ^ @uri@ - the uri of the item
 -> string -- ^ @title@ - the title of the item
 -> IO WebHistoryItem
webHistoryItemNewWithData uri title =
    withUTFString uri $ \uriPtr ->
    withUTFString title $ \titlePtr ->
    wrapNewGObject mkWebHistoryItem $
      {#call web_history_item_new_with_data#}
        uriPtr
        titlePtr


-- | Return the title of 'WebHistoryItem'.
webHistoryItemGetTitle ::
    (WebHistoryItemClass self, GlibString string) => self
 -> IO (Maybe string) -- ^ the title or @Nothing@ in case failed.
webHistoryItemGetTitle webhistoryitem =
    {#call web_history_item_get_title#}
      (toWebHistoryItem webhistoryitem) >>=
      maybePeek peekUTFString

-- | Return the alternate title of WebHistoryItem.
webHistoryItemGetAlternateTitle ::
    (WebHistoryItemClass self, GlibString string) => self
 -> IO (Maybe string) -- ^ the alternate title or @Nothing@ in case failed.
webHistoryItemGetAlternateTitle webhistoryitem =
    {#call web_history_item_get_alternate_title#}
      (toWebHistoryItem webhistoryitem) >>=
      maybePeek peekUTFString

-- | Set an alternate title for WebHistoryItem.
webHistoryItemSetAlternateTitle ::
    (WebHistoryItemClass self, GlibString string) => self
 -> (Maybe string)  -- ^ @title@ - the alternate title for this history item.
 -> IO()
webHistoryItemSetAlternateTitle webhistoryitem title =
    maybeWith withUTFString title $ \titlePtr ->
    {#call web_history_item_set_alternate_title#}
      (toWebHistoryItem webhistoryitem)
      titlePtr

-- | Return the URI of WebHistoryItem.
webHistoryItemGetUri ::
    (WebHistoryItemClass self, GlibString string) => self
 -> IO (Maybe string) -- ^ the URI or @Nothing@ in case failed.
webHistoryItemGetUri webhistoryitem =
    {#call web_history_item_get_uri#}
      (toWebHistoryItem webhistoryitem) >>=
      maybePeek peekUTFString

-- | Return the original URI of WebHistoryItem.
webHistoryItemGetOriginalUri ::
    (WebHistoryItemClass self, GlibString string) => self
 -> IO (Maybe string) -- ^ the URI or @Nothing@ in case failed
webHistoryItemGetOriginalUri webhistoryitem =
    {#call web_history_item_get_original_uri#}
      (toWebHistoryItem webhistoryitem) >>=
      maybePeek peekUTFString

-- | Return the last visited time of WebHistoryItem.
webHistoryItemGetLastVisitedTime ::
    WebHistoryItemClass self => self
 -> IO Double  -- ^ the last visited time of this history item.
webHistoryItemGetLastVisitedTime webhistoryitem =
    liftM realToFrac $
      {#call web_history_item_get_last_visited_time#}
        (toWebHistoryItem webhistoryitem)

#if WEBKIT_CHECK_VERSION (1,1,18)
-- | Makes a copy of the item for use with other WebView objects.
--
-- * Since 1.1.18
webHistoryItemCopy :: WebHistoryItemClass self => self
 -> IO WebHistoryItem
webHistoryItemCopy webhistoryitem =
    makeNewGObject mkWebHistoryItem $
    {#call webkit_web_history_item_copy#} (toWebHistoryItem webhistoryitem)
#endif

-- | The title of the 'WebHistoryItem'
--
-- Default value: @Nothing@
webHistoryItemTitle :: (WebHistoryItemClass self, GlibString string) => ReadAttr self (Maybe string)
webHistoryItemTitle = readAttr webHistoryItemGetTitle

-- | The alternate title of the history item.
--
-- Default value: @Nothing@
webHistoryItemAlternateTitle :: (WebHistoryItemClass self, GlibString string) => Attr self (Maybe string)
webHistoryItemAlternateTitle = newAttr webHistoryItemGetAlternateTitle webHistoryItemSetAlternateTitle

-- | The URI of the history item.
--
-- Default value: @Nothing@
webHistoryItemUri :: (WebHistoryItemClass self, GlibString string) => ReadAttr self (Maybe string)
webHistoryItemUri = readAttr webHistoryItemGetUri

-- | The original URI of the history item.
--
-- Default value: @Nothing@
webHistoryItemOriginalUri :: (WebHistoryItemClass self, GlibString string) => ReadAttr self (Maybe string)
webHistoryItemOriginalUri = readAttr webHistoryItemGetOriginalUri

-- | The time at which the history item was last visited.
--
-- Allowed values: >= 0
--
-- Default value: 0
webHistoryItemLastVisitedTime :: (WebHistoryItemClass self) => ReadAttr self Double
webHistoryItemLastVisitedTime = readAttr webHistoryItemGetLastVisitedTime

