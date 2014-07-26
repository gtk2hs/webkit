module Graphics.UI.Gtk.WebKit.DOM.ProcessingInstruction
       (processingInstructionGetTarget, processingInstructionSetData,
        processingInstructionGetData, processingInstructionGetSheet,
        ProcessingInstruction, ProcessingInstructionClass,
        castToProcessingInstruction, gTypeProcessingInstruction,
        toProcessingInstruction)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
processingInstructionGetTarget ::
                               (ProcessingInstructionClass self, GlibString string) =>
                                 self -> IO string
processingInstructionGetTarget self
  = ({# call webkit_dom_processing_instruction_get_target #}
       (toProcessingInstruction self))
      >>=
      readUTFString
 
processingInstructionSetData ::
                             (ProcessingInstructionClass self, GlibString string) => self -> string -> IO ()
processingInstructionSetData self val
  = propagateGError $
      \ errorPtr_ ->
        withUTFString val $
          \ valPtr ->
            {# call webkit_dom_processing_instruction_set_data #}
              (toProcessingInstruction self)
              valPtr
          errorPtr_
 
processingInstructionGetData ::
                             (ProcessingInstructionClass self, GlibString string) => self -> IO string
processingInstructionGetData self
  = ({# call webkit_dom_processing_instruction_get_data #}
       (toProcessingInstruction self))
      >>=
      readUTFString
 
processingInstructionGetSheet ::
                              (ProcessingInstructionClass self) => self -> IO (Maybe StyleSheet)
processingInstructionGetSheet self
  = maybeNull (makeNewGObject mkStyleSheet)
      ({# call webkit_dom_processing_instruction_get_sheet #}
         (toProcessingInstruction self))
