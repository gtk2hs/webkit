module Graphics.UI.Gtk.WebKit.DOM.Enums(
DomEnum(..),
KeyType(..),
DomEnum,
KeyUsage(..),
CanvasWindingRule(..),
VideoPresentationMode(..),
TextTrackMode(..),
TextTrackKind(..),
DeviceType(..),
MediaUIPartID(..),
EndOfStreamError(..),
AppendMode(..),
SourceTypeEnum(..),
VideoFacingModeEnum(..),
MediaStreamTrackState(..),
RTCIceTransportsEnum(..),
RTCIdentityOptionEnum(..),
ReadableStreamStateType(..),
OverSampleType(..),
PageOverlayType(..),
XMLHttpRequestResponseType(..),
) where
import Prelude hiding (drop, error, print)
import Data.Typeable (Typeable)
import Foreign.Marshal (maybePeek, maybeWith)
import System.Glib.FFI (maybeNull, withForeignPtr, nullForeignPtr, Ptr, nullPtr, castPtr, Word, Int64, Word64, CChar(..), CInt(..), CUInt(..), CLong(..), CULong(..), CLLong(..), CULLong(..), CShort(..), CUShort(..), CFloat(..), CDouble(..), toBool, fromBool)
import System.Glib.UTFString (GlibString(..), readUTFString)
import Control.Applicative ((<$>))
import Control.Monad (void)
import Control.Monad.IO.Class (MonadIO(..))
import System.Glib.GError
import Graphics.UI.Gtk.WebKit.DOM.EventTargetClosures

 
class DomEnum e where
         
        enumToString :: e -> String
         
        stringToEnum :: String -> e
 
data KeyType = KeyTypeSecret
             | KeyTypePublic
             | KeyTypePrivate
             deriving (Show, Read, Eq, Ord, Typeable)
 
instance DomEnum KeyType where
        enumToString KeyTypeSecret = "secret"
        enumToString KeyTypePublic = "public"
        enumToString KeyTypePrivate = "private"
        stringToEnum "secret" = KeyTypeSecret
        stringToEnum "public" = KeyTypePublic
        stringToEnum "private" = KeyTypePrivate
 
data KeyUsage = KeyUsageEncrypt
              | KeyUsageDecrypt
              | KeyUsageSign
              | KeyUsageVerify
              | KeyUsageDeriveKey
              | KeyUsageDeriveBits
              | KeyUsageWrapKey
              | KeyUsageUnwrapKey
              deriving (Show, Read, Eq, Ord, Typeable)
 
instance DomEnum KeyUsage where
        enumToString KeyUsageEncrypt = "encrypt"
        enumToString KeyUsageDecrypt = "decrypt"
        enumToString KeyUsageSign = "sign"
        enumToString KeyUsageVerify = "verify"
        enumToString KeyUsageDeriveKey = "deriveKey"
        enumToString KeyUsageDeriveBits = "deriveBits"
        enumToString KeyUsageWrapKey = "wrapKey"
        enumToString KeyUsageUnwrapKey = "unwrapKey"
        stringToEnum "encrypt" = KeyUsageEncrypt
        stringToEnum "decrypt" = KeyUsageDecrypt
        stringToEnum "sign" = KeyUsageSign
        stringToEnum "verify" = KeyUsageVerify
        stringToEnum "deriveKey" = KeyUsageDeriveKey
        stringToEnum "deriveBits" = KeyUsageDeriveBits
        stringToEnum "wrapKey" = KeyUsageWrapKey
        stringToEnum "unwrapKey" = KeyUsageUnwrapKey
 
data CanvasWindingRule = CanvasWindingRuleNonzero
                       | CanvasWindingRuleEvenodd
                       deriving (Show, Read, Eq, Ord, Typeable)
 
instance DomEnum CanvasWindingRule where
        enumToString CanvasWindingRuleNonzero = "nonzero"
        enumToString CanvasWindingRuleEvenodd = "evenodd"
        stringToEnum "nonzero" = CanvasWindingRuleNonzero
        stringToEnum "evenodd" = CanvasWindingRuleEvenodd
 
data VideoPresentationMode = VideoPresentationModeFullscreen
                           | VideoPresentationModeOptimized
                           | VideoPresentationModeInline
                           deriving (Show, Read, Eq, Ord, Typeable)
 
instance DomEnum VideoPresentationMode where
        enumToString VideoPresentationModeFullscreen = "fullscreen"
        enumToString VideoPresentationModeOptimized = "optimized"
        enumToString VideoPresentationModeInline = "inline"
        stringToEnum "fullscreen" = VideoPresentationModeFullscreen
        stringToEnum "optimized" = VideoPresentationModeOptimized
        stringToEnum "inline" = VideoPresentationModeInline
 
data TextTrackMode = TextTrackModeDisabled
                   | TextTrackModeHidden
                   | TextTrackModeShowing
                   deriving (Show, Read, Eq, Ord, Typeable)
 
instance DomEnum TextTrackMode where
        enumToString TextTrackModeDisabled = "disabled"
        enumToString TextTrackModeHidden = "hidden"
        enumToString TextTrackModeShowing = "showing"
        stringToEnum "disabled" = TextTrackModeDisabled
        stringToEnum "hidden" = TextTrackModeHidden
        stringToEnum "showing" = TextTrackModeShowing
 
data TextTrackKind = TextTrackKindSubtitles
                   | TextTrackKindCaptions
                   | TextTrackKindDescriptions
                   | TextTrackKindChapters
                   | TextTrackKindMetadata
                   deriving (Show, Read, Eq, Ord, Typeable)
 
instance DomEnum TextTrackKind where
        enumToString TextTrackKindSubtitles = "subtitles"
        enumToString TextTrackKindCaptions = "captions"
        enumToString TextTrackKindDescriptions = "descriptions"
        enumToString TextTrackKindChapters = "chapters"
        enumToString TextTrackKindMetadata = "metadata"
        stringToEnum "subtitles" = TextTrackKindSubtitles
        stringToEnum "captions" = TextTrackKindCaptions
        stringToEnum "descriptions" = TextTrackKindDescriptions
        stringToEnum "chapters" = TextTrackKindChapters
        stringToEnum "metadata" = TextTrackKindMetadata
 
data DeviceType = DeviceTypeNone
                | DeviceTypeAirplay
                | DeviceTypeTvout
                deriving (Show, Read, Eq, Ord, Typeable)
 
instance DomEnum DeviceType where
        enumToString DeviceTypeNone = "none"
        enumToString DeviceTypeAirplay = "airplay"
        enumToString DeviceTypeTvout = "tvout"
        stringToEnum "none" = DeviceTypeNone
        stringToEnum "airplay" = DeviceTypeAirplay
        stringToEnum "tvout" = DeviceTypeTvout
 
data MediaUIPartID = MediaUIPartIDOptimizedFullscreenButton
                   | MediaUIPartIDOptimizedFullscreenPlaceholder
                   deriving (Show, Read, Eq, Ord, Typeable)
 
instance DomEnum MediaUIPartID where
        enumToString MediaUIPartIDOptimizedFullscreenButton
          = "optimized-fullscreen-button"
        enumToString MediaUIPartIDOptimizedFullscreenPlaceholder
          = "optimized-fullscreen-placeholder"
        stringToEnum "optimized-fullscreen-button"
          = MediaUIPartIDOptimizedFullscreenButton
        stringToEnum "optimized-fullscreen-placeholder"
          = MediaUIPartIDOptimizedFullscreenPlaceholder
 
data EndOfStreamError = EndOfStreamErrorNetwork
                      | EndOfStreamErrorDecode
                      deriving (Show, Read, Eq, Ord, Typeable)
 
instance DomEnum EndOfStreamError where
        enumToString EndOfStreamErrorNetwork = "network"
        enumToString EndOfStreamErrorDecode = "decode"
        stringToEnum "network" = EndOfStreamErrorNetwork
        stringToEnum "decode" = EndOfStreamErrorDecode
 
data AppendMode = AppendModeSegments
                | AppendModeSequence
                deriving (Show, Read, Eq, Ord, Typeable)
 
instance DomEnum AppendMode where
        enumToString AppendModeSegments = "segments"
        enumToString AppendModeSequence = "sequence"
        stringToEnum "segments" = AppendModeSegments
        stringToEnum "sequence" = AppendModeSequence
 
data SourceTypeEnum = SourceTypeEnumNone
                    | SourceTypeEnumCamera
                    | SourceTypeEnumMicrophone
                    deriving (Show, Read, Eq, Ord, Typeable)
 
instance DomEnum SourceTypeEnum where
        enumToString SourceTypeEnumNone = "none"
        enumToString SourceTypeEnumCamera = "camera"
        enumToString SourceTypeEnumMicrophone = "microphone"
        stringToEnum "none" = SourceTypeEnumNone
        stringToEnum "camera" = SourceTypeEnumCamera
        stringToEnum "microphone" = SourceTypeEnumMicrophone
 
data VideoFacingModeEnum = VideoFacingModeEnumUser
                         | VideoFacingModeEnumEnvironment
                         | VideoFacingModeEnumLeft
                         | VideoFacingModeEnumRight
                         deriving (Show, Read, Eq, Ord, Typeable)
 
instance DomEnum VideoFacingModeEnum where
        enumToString VideoFacingModeEnumUser = "user"
        enumToString VideoFacingModeEnumEnvironment = "environment"
        enumToString VideoFacingModeEnumLeft = "left"
        enumToString VideoFacingModeEnumRight = "right"
        stringToEnum "user" = VideoFacingModeEnumUser
        stringToEnum "environment" = VideoFacingModeEnumEnvironment
        stringToEnum "left" = VideoFacingModeEnumLeft
        stringToEnum "right" = VideoFacingModeEnumRight
 
data MediaStreamTrackState = MediaStreamTrackStateNew
                           | MediaStreamTrackStateLive
                           | MediaStreamTrackStateEnded
                           deriving (Show, Read, Eq, Ord, Typeable)
 
instance DomEnum MediaStreamTrackState where
        enumToString MediaStreamTrackStateNew = "new"
        enumToString MediaStreamTrackStateLive = "live"
        enumToString MediaStreamTrackStateEnded = "ended"
        stringToEnum "new" = MediaStreamTrackStateNew
        stringToEnum "live" = MediaStreamTrackStateLive
        stringToEnum "ended" = MediaStreamTrackStateEnded
 
data RTCIceTransportsEnum = RTCIceTransportsEnumNone
                          | RTCIceTransportsEnumRelay
                          | RTCIceTransportsEnumAll
                          deriving (Show, Read, Eq, Ord, Typeable)
 
instance DomEnum RTCIceTransportsEnum where
        enumToString RTCIceTransportsEnumNone = "none"
        enumToString RTCIceTransportsEnumRelay = "relay"
        enumToString RTCIceTransportsEnumAll = "all"
        stringToEnum "none" = RTCIceTransportsEnumNone
        stringToEnum "relay" = RTCIceTransportsEnumRelay
        stringToEnum "all" = RTCIceTransportsEnumAll
 
data RTCIdentityOptionEnum = RTCIdentityOptionEnumYes
                           | RTCIdentityOptionEnumNo
                           | RTCIdentityOptionEnumIfconfigured
                           deriving (Show, Read, Eq, Ord, Typeable)
 
instance DomEnum RTCIdentityOptionEnum where
        enumToString RTCIdentityOptionEnumYes = "yes"
        enumToString RTCIdentityOptionEnumNo = "no"
        enumToString RTCIdentityOptionEnumIfconfigured = "ifconfigured"
        stringToEnum "yes" = RTCIdentityOptionEnumYes
        stringToEnum "no" = RTCIdentityOptionEnumNo
        stringToEnum "ifconfigured" = RTCIdentityOptionEnumIfconfigured
 
data ReadableStreamStateType = ReadableStreamStateTypeReadable
                             | ReadableStreamStateTypeWaiting
                             | ReadableStreamStateTypeClosed
                             | ReadableStreamStateTypeErrored
                             deriving (Show, Read, Eq, Ord, Typeable)
 
instance DomEnum ReadableStreamStateType where
        enumToString ReadableStreamStateTypeReadable = "readable"
        enumToString ReadableStreamStateTypeWaiting = "waiting"
        enumToString ReadableStreamStateTypeClosed = "closed"
        enumToString ReadableStreamStateTypeErrored = "errored"
        stringToEnum "readable" = ReadableStreamStateTypeReadable
        stringToEnum "waiting" = ReadableStreamStateTypeWaiting
        stringToEnum "closed" = ReadableStreamStateTypeClosed
        stringToEnum "errored" = ReadableStreamStateTypeErrored
 
data OverSampleType = OverSampleTypeNone
                    | OverSampleType2x
                    | OverSampleType4x
                    deriving (Show, Read, Eq, Ord, Typeable)
 
instance DomEnum OverSampleType where
        enumToString OverSampleTypeNone = "none"
        enumToString OverSampleType2x = "2x"
        enumToString OverSampleType4x = "4x"
        stringToEnum "none" = OverSampleTypeNone
        stringToEnum "2x" = OverSampleType2x
        stringToEnum "4x" = OverSampleType4x
 
data PageOverlayType = PageOverlayTypeView
                     | PageOverlayTypeDocument
                     deriving (Show, Read, Eq, Ord, Typeable)
 
instance DomEnum PageOverlayType where
        enumToString PageOverlayTypeView = "view"
        enumToString PageOverlayTypeDocument = "document"
        stringToEnum "view" = PageOverlayTypeView
        stringToEnum "document" = PageOverlayTypeDocument
 
data XMLHttpRequestResponseType = XMLHttpRequestResponseType
                                | XMLHttpRequestResponseTypeArraybuffer
                                | XMLHttpRequestResponseTypeBlob
                                | XMLHttpRequestResponseTypeDocument
                                | XMLHttpRequestResponseTypeJson
                                | XMLHttpRequestResponseTypeText
                                deriving (Show, Read, Eq, Ord, Typeable)
 
instance DomEnum XMLHttpRequestResponseType where
        enumToString XMLHttpRequestResponseType = ""
        enumToString XMLHttpRequestResponseTypeArraybuffer = "arraybuffer"
        enumToString XMLHttpRequestResponseTypeBlob = "blob"
        enumToString XMLHttpRequestResponseTypeDocument = "document"
        enumToString XMLHttpRequestResponseTypeJson = "json"
        enumToString XMLHttpRequestResponseTypeText = "text"
        stringToEnum "" = XMLHttpRequestResponseType
        stringToEnum "arraybuffer" = XMLHttpRequestResponseTypeArraybuffer
        stringToEnum "blob" = XMLHttpRequestResponseTypeBlob
        stringToEnum "document" = XMLHttpRequestResponseTypeDocument
        stringToEnum "json" = XMLHttpRequestResponseTypeJson
        stringToEnum "text" = XMLHttpRequestResponseTypeText
