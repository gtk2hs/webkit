module Graphics.UI.Gtk.WebKit.DOM.Events (Event, EventClass) where
 
data Event = Event
 
class EventClass a
 
instance EventClass Event
