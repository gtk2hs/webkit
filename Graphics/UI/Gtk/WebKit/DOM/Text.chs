module Graphics.UI.Gtk.WebKit.DOM.Text
       (textSplitText, textReplaceWholeText, textGetWholeText, Text(..),
        TextClass(..), castToText, gTypeText, toText)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
textSplitText ::
              (TextClass self) => self -> Word -> IO (Maybe Text)
textSplitText self offset
  = maybeNull (makeNewGObject mkText)
      (propagateGError $
         \ errorPtr_ ->
           {# call webkit_dom_text_split_text #} (toText self)
             (fromIntegral offset)
             errorPtr_)
 
textReplaceWholeText ::
                     (TextClass self) => self -> String -> IO (Maybe Text)
textReplaceWholeText self content
  = maybeNull (makeNewGObject mkText)
      (propagateGError $
         \ errorPtr_ ->
           withUTFString content $
             \ contentPtr ->
               {# call webkit_dom_text_replace_whole_text #} (toText self)
                 contentPtr
             errorPtr_)
 
textGetWholeText :: (TextClass self) => self -> IO String
textGetWholeText self
  = ({# call webkit_dom_text_get_whole_text #} (toText self)) >>=
      readUTFString
