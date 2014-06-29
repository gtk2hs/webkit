module Graphics.UI.Gtk.WebKit.DOM.MutationEvent
       (mutationEventInitMutationEvent, cMODIFICATION, cADDITION,
        cREMOVAL, mutationEventGetRelatedNode, mutationEventGetPrevValue,
        mutationEventGetNewValue, mutationEventGetAttrName,
        mutationEventGetAttrChange, MutationEvent, MutationEventClass,
        castToMutationEvent, gTypeMutationEvent, toMutationEvent)
       where
import System.Glib.FFI
import System.Glib.UTFString
import Control.Applicative
{#import Graphics.UI.Gtk.WebKit.Types#}
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventM
 
mutationEventInitMutationEvent ::
                               (MutationEventClass self, NodeClass relatedNode,
                                GlibString string) =>
                                 self ->
                                   string ->
                                     Bool ->
                                       Bool ->
                                         Maybe relatedNode ->
                                           string -> string -> string -> Word -> IO ()
mutationEventInitMutationEvent self type' canBubble cancelable
  relatedNode prevValue newValue attrName attrChange
  = withUTFString attrName $
      \ attrNamePtr ->
        withUTFString newValue $
          \ newValuePtr ->
            withUTFString prevValue $
              \ prevValuePtr ->
                withUTFString type' $
                  \ typePtr ->
                    {# call webkit_dom_mutation_event_init_mutation_event #}
                      (toMutationEvent self)
                      typePtr
                  (fromBool canBubble)
                  (fromBool cancelable)
                  (maybe (Node nullForeignPtr) toNode relatedNode)
                  prevValuePtr
              newValuePtr
          attrNamePtr
      (fromIntegral attrChange)
cMODIFICATION = 1
cADDITION = 2
cREMOVAL = 3
 
mutationEventGetRelatedNode ::
                            (MutationEventClass self) => self -> IO (Maybe Node)
mutationEventGetRelatedNode self
  = maybeNull (makeNewGObject mkNode)
      ({# call webkit_dom_mutation_event_get_related_node #}
         (toMutationEvent self))
 
mutationEventGetPrevValue ::
                          (MutationEventClass self, GlibString string) => self -> IO string
mutationEventGetPrevValue self
  = ({# call webkit_dom_mutation_event_get_prev_value #}
       (toMutationEvent self))
      >>=
      readUTFString
 
mutationEventGetNewValue ::
                         (MutationEventClass self, GlibString string) => self -> IO string
mutationEventGetNewValue self
  = ({# call webkit_dom_mutation_event_get_new_value #}
       (toMutationEvent self))
      >>=
      readUTFString
 
mutationEventGetAttrName ::
                         (MutationEventClass self, GlibString string) => self -> IO string
mutationEventGetAttrName self
  = ({# call webkit_dom_mutation_event_get_attr_name #}
       (toMutationEvent self))
      >>=
      readUTFString
 
mutationEventGetAttrChange ::
                           (MutationEventClass self) => self -> IO Word
mutationEventGetAttrChange self
  = fromIntegral <$>
      ({# call webkit_dom_mutation_event_get_attr_change #}
         (toMutationEvent self))
