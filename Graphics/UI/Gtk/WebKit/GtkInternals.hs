{-# LANGUAGE CPP #-}
module Graphics.UI.Gtk.WebKit.GtkInternals (
    module Graphics.UI.GtkInternals
) where

import Graphics.UI.GtkInternals (GObjectClass(..), GObject(..), unGObject, toGObject,
#ifdef MIN_VERSION_gtk
    ObjectClass(..), Object(..), unObject, toObject,
#endif
    objectUnrefFromMainloop, ContainerClass(..), WidgetClass(..), makeNewGObject, Pixbuf, mkPixbuf,
    mkTargetList, Adjustment, IMContext, Widget)
