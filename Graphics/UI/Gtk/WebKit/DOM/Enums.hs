module Graphics.UI.Gtk.WebKit.DOM.Enums where

data KeyType = KeyTypeSecret
             | KeyTypePublic
             | KeyTypePrivate

instance Show KeyType where
        show KeyTypeSecret = "secret"
        show KeyTypePublic = "public"
        show KeyTypePrivate = "private"

instance Read KeyType where
        read "secret" = KeyTypeSecret
        read "public" = KeyTypePublic
        read "private" = KeyTypePrivate

data KeyUsage = KeyUsageEncrypt
              | KeyUsageDecrypt
              | KeyUsageSign
              | KeyUsageVerify
              | KeyUsageDeriveKey
              | KeyUsageDeriveBits
              | KeyUsageWrapKey
              | KeyUsageUnwrapKey

instance Show KeyUsage where
        show KeyUsageEncrypt = "encrypt"
        show KeyUsageDecrypt = "decrypt"
        show KeyUsageSign = "sign"
        show KeyUsageVerify = "verify"
        show KeyUsageDeriveKey = "deriveKey"
        show KeyUsageDeriveBits = "deriveBits"
        show KeyUsageWrapKey = "wrapKey"
        show KeyUsageUnwrapKey = "unwrapKey"

instance Read KeyUsage where
        read "encrypt" = KeyUsageEncrypt
        read "decrypt" = KeyUsageDecrypt
        read "sign" = KeyUsageSign
        read "verify" = KeyUsageVerify
        read "deriveKey" = KeyUsageDeriveKey
        read "deriveBits" = KeyUsageDeriveBits
        read "wrapKey" = KeyUsageWrapKey
        read "unwrapKey" = KeyUsageUnwrapKey

data CanvasWindingRule = CanvasWindingRuleNonzero
                       | CanvasWindingRuleEvenodd

instance Show CanvasWindingRule where
        show CanvasWindingRuleNonzero = "nonzero"
        show CanvasWindingRuleEvenodd = "evenodd"

instance Read CanvasWindingRule where
        read "nonzero" = CanvasWindingRuleNonzero
        read "evenodd" = CanvasWindingRuleEvenodd

data VideoPresentationMode = VideoPresentationModeFullscreen
                           | VideoPresentationModeOptimized
                           | VideoPresentationModeInline

instance Show VideoPresentationMode where
        show VideoPresentationModeFullscreen = "fullscreen"
        show VideoPresentationModeOptimized = "optimized"
        show VideoPresentationModeInline = "inline"

instance Read VideoPresentationMode where
        read x
          | x == js_VideoPresentationModeFullscreen =
            VideoPresentationModeFullscreen
        read x
          | x == js_VideoPresentationModeOptimized =
            VideoPresentationModeOptimized
        read x
          | x == js_VideoPresentationModeInline = VideoPresentationModeInline

instance FromJSRef VideoPresentationMode where
        fromJSRefUnchecked = return . read
        fromJSRef = return . read . castRef

foreign import javascript unsafe "\"fullscreen\""
        js_VideoPresentationModeFullscreen :: JSRef VideoPresentationMode

foreign import javascript unsafe "\"optimized\""
        js_VideoPresentationModeOptimized :: JSRef VideoPresentationMode

foreign import javascript unsafe "\"inline\""
        js_VideoPresentationModeInline :: JSRef VideoPresentationMode

data TextTrackMode = TextTrackModeDisabled
                   | TextTrackModeHidden
                   | TextTrackModeShowing

instance show TextTrackMode where
        show TextTrackModeDisabled = js_TextTrackModeDisabled
        show TextTrackModeHidden = js_TextTrackModeHidden
        show TextTrackModeShowing = js_TextTrackModeShowing

instance ToJSRef TextTrackMode where
        toJSRef = return . show

instance Read TextTrackMode where
        read x
          | x == js_TextTrackModeDisabled = TextTrackModeDisabled
        read x | x == js_TextTrackModeHidden = TextTrackModeHidden
        read x | x == js_TextTrackModeShowing = TextTrackModeShowing

instance FromJSRef TextTrackMode where
        fromJSRefUnchecked = return . read
        fromJSRef = return . read . castRef

foreign import javascript unsafe "\"disabled\""
        js_TextTrackModeDisabled :: JSRef TextTrackMode

foreign import javascript unsafe "\"hidden\""
        js_TextTrackModeHidden :: JSRef TextTrackMode

foreign import javascript unsafe "\"showing\""
        js_TextTrackModeShowing :: JSRef TextTrackMode

data TextTrackKind = TextTrackKindSubtitles
                   | TextTrackKindCaptions
                   | TextTrackKindDescriptions
                   | TextTrackKindChapters
                   | TextTrackKindMetadata

instance show TextTrackKind where
        show TextTrackKindSubtitles = js_TextTrackKindSubtitles
        show TextTrackKindCaptions = js_TextTrackKindCaptions
        show TextTrackKindDescriptions = js_TextTrackKindDescriptions
        show TextTrackKindChapters = js_TextTrackKindChapters
        show TextTrackKindMetadata = js_TextTrackKindMetadata

instance ToJSRef TextTrackKind where
        toJSRef = return . show

instance Read TextTrackKind where
        read x
          | x == js_TextTrackKindSubtitles = TextTrackKindSubtitles
        read x
          | x == js_TextTrackKindCaptions = TextTrackKindCaptions
        read x
          | x == js_TextTrackKindDescriptions = TextTrackKindDescriptions
        read x
          | x == js_TextTrackKindChapters = TextTrackKindChapters
        read x
          | x == js_TextTrackKindMetadata = TextTrackKindMetadata

instance FromJSRef TextTrackKind where
        fromJSRefUnchecked = return . read
        fromJSRef = return . read . castRef

foreign import javascript unsafe "\"subtitles\""
        js_TextTrackKindSubtitles :: JSRef TextTrackKind

foreign import javascript unsafe "\"captions\""
        js_TextTrackKindCaptions :: JSRef TextTrackKind

foreign import javascript unsafe "\"descriptions\""
        js_TextTrackKindDescriptions :: JSRef TextTrackKind

foreign import javascript unsafe "\"chapters\""
        js_TextTrackKindChapters :: JSRef TextTrackKind

foreign import javascript unsafe "\"metadata\""
        js_TextTrackKindMetadata :: JSRef TextTrackKind

data DeviceType = DeviceTypeNone
                | DeviceTypeAirplay
                | DeviceTypeTvout

instance show DeviceType where
        show DeviceTypeNone = js_DeviceTypeNone
        show DeviceTypeAirplay = js_DeviceTypeAirplay
        show DeviceTypeTvout = js_DeviceTypeTvout

instance ToJSRef DeviceType where
        toJSRef = return . show

instance Read DeviceType where
        read x | x == js_DeviceTypeNone = DeviceTypeNone
        read x | x == js_DeviceTypeAirplay = DeviceTypeAirplay
        read x | x == js_DeviceTypeTvout = DeviceTypeTvout

instance FromJSRef DeviceType where
        fromJSRefUnchecked = return . read
        fromJSRef = return . read . castRef

foreign import javascript unsafe "\"none\"" js_DeviceTypeNone ::
        JSRef DeviceType

foreign import javascript unsafe "\"airplay\"" js_DeviceTypeAirplay
        :: JSRef DeviceType

foreign import javascript unsafe "\"tvout\"" js_DeviceTypeTvout ::
        JSRef DeviceType

data MediaUIPartID = MediaUIPartIDOptimizedFullscreenButton
                   | MediaUIPartIDOptimizedFullscreenPlaceholder

instance show MediaUIPartID where
        show MediaUIPartIDOptimizedFullscreenButton
          = js_MediaUIPartIDOptimizedFullscreenButton
        show MediaUIPartIDOptimizedFullscreenPlaceholder
          = js_MediaUIPartIDOptimizedFullscreenPlaceholder

instance ToJSRef MediaUIPartID where
        toJSRef = return . show

instance Read MediaUIPartID where
        read x
          | x == js_MediaUIPartIDOptimizedFullscreenButton =
            MediaUIPartIDOptimizedFullscreenButton
        read x
          | x == js_MediaUIPartIDOptimizedFullscreenPlaceholder =
            MediaUIPartIDOptimizedFullscreenPlaceholder

instance FromJSRef MediaUIPartID where
        fromJSRefUnchecked = return . read
        fromJSRef = return . read . castRef

foreign import javascript unsafe "\"optimized-fullscreen-button\""
        js_MediaUIPartIDOptimizedFullscreenButton :: JSRef MediaUIPartID

foreign import javascript unsafe
        "\"optimized-fullscreen-placeholder\""
        js_MediaUIPartIDOptimizedFullscreenPlaceholder ::
        JSRef MediaUIPartID

data EndOfStreamError = EndOfStreamErrorNetwork
                      | EndOfStreamErrorDecode

instance show EndOfStreamError where
        show EndOfStreamErrorNetwork = js_EndOfStreamErrorNetwork
        show EndOfStreamErrorDecode = js_EndOfStreamErrorDecode

instance ToJSRef EndOfStreamError where
        toJSRef = return . show

instance Read EndOfStreamError where
        read x
          | x == js_EndOfStreamErrorNetwork = EndOfStreamErrorNetwork
        read x
          | x == js_EndOfStreamErrorDecode = EndOfStreamErrorDecode

instance FromJSRef EndOfStreamError where
        fromJSRefUnchecked = return . read
        fromJSRef = return . read . castRef

foreign import javascript unsafe "\"network\""
        js_EndOfStreamErrorNetwork :: JSRef EndOfStreamError

foreign import javascript unsafe "\"decode\""
        js_EndOfStreamErrorDecode :: JSRef EndOfStreamError

data AppendMode = AppendModeSegments
                | AppendModeSequence

instance show AppendMode where
        show AppendModeSegments = js_AppendModeSegments
        show AppendModeSequence = js_AppendModeSequence

instance ToJSRef AppendMode where
        toJSRef = return . show

instance Read AppendMode where
        read x | x == js_AppendModeSegments = AppendModeSegments
        read x | x == js_AppendModeSequence = AppendModeSequence

instance FromJSRef AppendMode where
        fromJSRefUnchecked = return . read
        fromJSRef = return . read . castRef

foreign import javascript unsafe "\"segments\""
        js_AppendModeSegments :: JSRef AppendMode

foreign import javascript unsafe "\"sequence\""
        js_AppendModeSequence :: JSRef AppendMode

data SourceTypeEnum = SourceTypeEnumNone
                    | SourceTypeEnumCamera
                    | SourceTypeEnumMicrophone

instance show SourceTypeEnum where
        show SourceTypeEnumNone = js_SourceTypeEnumNone
        show SourceTypeEnumCamera = js_SourceTypeEnumCamera
        show SourceTypeEnumMicrophone = js_SourceTypeEnumMicrophone

instance ToJSRef SourceTypeEnum where
        toJSRef = return . show

instance Read SourceTypeEnum where
        read x | x == js_SourceTypeEnumNone = SourceTypeEnumNone
        read x | x == js_SourceTypeEnumCamera = SourceTypeEnumCamera
        read x
          | x == js_SourceTypeEnumMicrophone = SourceTypeEnumMicrophone

instance FromJSRef SourceTypeEnum where
        fromJSRefUnchecked = return . read
        fromJSRef = return . read . castRef

foreign import javascript unsafe "\"none\"" js_SourceTypeEnumNone
        :: JSRef SourceTypeEnum

foreign import javascript unsafe "\"camera\""
        js_SourceTypeEnumCamera :: JSRef SourceTypeEnum

foreign import javascript unsafe "\"microphone\""
        js_SourceTypeEnumMicrophone :: JSRef SourceTypeEnum

data VideoFacingModeEnum = VideoFacingModeEnumUser
                         | VideoFacingModeEnumEnvironment
                         | VideoFacingModeEnumLeft
                         | VideoFacingModeEnumRight

instance show VideoFacingModeEnum where
        show VideoFacingModeEnumUser = js_VideoFacingModeEnumUser
        show VideoFacingModeEnumEnvironment
          = js_VideoFacingModeEnumEnvironment
        show VideoFacingModeEnumLeft = js_VideoFacingModeEnumLeft
        show VideoFacingModeEnumRight = js_VideoFacingModeEnumRight

instance ToJSRef VideoFacingModeEnum where
        toJSRef = return . show

instance Read VideoFacingModeEnum where
        read x
          | x == js_VideoFacingModeEnumUser = VideoFacingModeEnumUser
        read x
          | x == js_VideoFacingModeEnumEnvironment =
            VideoFacingModeEnumEnvironment
        read x
          | x == js_VideoFacingModeEnumLeft = VideoFacingModeEnumLeft
        read x
          | x == js_VideoFacingModeEnumRight = VideoFacingModeEnumRight

instance FromJSRef VideoFacingModeEnum where
        fromJSRefUnchecked = return . read
        fromJSRef = return . read . castRef

foreign import javascript unsafe "\"user\""
        js_VideoFacingModeEnumUser :: JSRef VideoFacingModeEnum

foreign import javascript unsafe "\"environment\""
        js_VideoFacingModeEnumEnvironment :: JSRef VideoFacingModeEnum

foreign import javascript unsafe "\"left\""
        js_VideoFacingModeEnumLeft :: JSRef VideoFacingModeEnum

foreign import javascript unsafe "\"right\""
        js_VideoFacingModeEnumRight :: JSRef VideoFacingModeEnum

data MediaStreamTrackState = MediaStreamTrackStateNew
                           | MediaStreamTrackStateLive
                           | MediaStreamTrackStateEnded

instance show MediaStreamTrackState where
        show MediaStreamTrackStateNew = js_MediaStreamTrackStateNew
        show MediaStreamTrackStateLive = js_MediaStreamTrackStateLive
        show MediaStreamTrackStateEnded = js_MediaStreamTrackStateEnded

instance ToJSRef MediaStreamTrackState where
        toJSRef = return . show

instance Read MediaStreamTrackState where
        read x
          | x == js_MediaStreamTrackStateNew = MediaStreamTrackStateNew
        read x
          | x == js_MediaStreamTrackStateLive = MediaStreamTrackStateLive
        read x
          | x == js_MediaStreamTrackStateEnded = MediaStreamTrackStateEnded

instance FromJSRef MediaStreamTrackState where
        fromJSRefUnchecked = return . read
        fromJSRef = return . read . castRef

foreign import javascript unsafe "\"new\""
        js_MediaStreamTrackStateNew :: JSRef MediaStreamTrackState

foreign import javascript unsafe "\"live\""
        js_MediaStreamTrackStateLive :: JSRef MediaStreamTrackState

foreign import javascript unsafe "\"ended\""
        js_MediaStreamTrackStateEnded :: JSRef MediaStreamTrackState

data RTCIceTransportsEnum = RTCIceTransportsEnumNone
                          | RTCIceTransportsEnumRelay
                          | RTCIceTransportsEnumAll

instance show RTCIceTransportsEnum where
        show RTCIceTransportsEnumNone = js_RTCIceTransportsEnumNone
        show RTCIceTransportsEnumRelay = js_RTCIceTransportsEnumRelay
        show RTCIceTransportsEnumAll = js_RTCIceTransportsEnumAll

instance ToJSRef RTCIceTransportsEnum where
        toJSRef = return . show

instance Read RTCIceTransportsEnum where
        read x
          | x == js_RTCIceTransportsEnumNone = RTCIceTransportsEnumNone
        read x
          | x == js_RTCIceTransportsEnumRelay = RTCIceTransportsEnumRelay
        read x
          | x == js_RTCIceTransportsEnumAll = RTCIceTransportsEnumAll

instance FromJSRef RTCIceTransportsEnum where
        fromJSRefUnchecked = return . read
        fromJSRef = return . read . castRef

foreign import javascript unsafe "\"none\""
        js_RTCIceTransportsEnumNone :: JSRef RTCIceTransportsEnum

foreign import javascript unsafe "\"relay\""
        js_RTCIceTransportsEnumRelay :: JSRef RTCIceTransportsEnum

foreign import javascript unsafe "\"all\""
        js_RTCIceTransportsEnumAll :: JSRef RTCIceTransportsEnum

data RTCIdentityOptionEnum = RTCIdentityOptionEnumYes
                           | RTCIdentityOptionEnumNo
                           | RTCIdentityOptionEnumIfconfigured

instance show RTCIdentityOptionEnum where
        show RTCIdentityOptionEnumYes = js_RTCIdentityOptionEnumYes
        show RTCIdentityOptionEnumNo = js_RTCIdentityOptionEnumNo
        show RTCIdentityOptionEnumIfconfigured
          = js_RTCIdentityOptionEnumIfconfigured

instance ToJSRef RTCIdentityOptionEnum where
        toJSRef = return . show

instance Read RTCIdentityOptionEnum where
        read x
          | x == js_RTCIdentityOptionEnumYes = RTCIdentityOptionEnumYes
        read x
          | x == js_RTCIdentityOptionEnumNo = RTCIdentityOptionEnumNo
        read x
          | x == js_RTCIdentityOptionEnumIfconfigured =
            RTCIdentityOptionEnumIfconfigured

instance FromJSRef RTCIdentityOptionEnum where
        fromJSRefUnchecked = return . read
        fromJSRef = return . read . castRef

foreign import javascript unsafe "\"yes\""
        js_RTCIdentityOptionEnumYes :: JSRef RTCIdentityOptionEnum

foreign import javascript unsafe "\"no\""
        js_RTCIdentityOptionEnumNo :: JSRef RTCIdentityOptionEnum

foreign import javascript unsafe "\"ifconfigured\""
        js_RTCIdentityOptionEnumIfconfigured :: JSRef RTCIdentityOptionEnum

data ReadableStreamStateType = ReadableStreamStateTypeReadable
                             | ReadableStreamStateTypeWaiting
                             | ReadableStreamStateTypeClosed
                             | ReadableStreamStateTypeErrored

instance show ReadableStreamStateType where
        show ReadableStreamStateTypeReadable
          = js_ReadableStreamStateTypeReadable
        show ReadableStreamStateTypeWaiting
          = js_ReadableStreamStateTypeWaiting
        show ReadableStreamStateTypeClosed
          = js_ReadableStreamStateTypeClosed
        show ReadableStreamStateTypeErrored
          = js_ReadableStreamStateTypeErrored

instance ToJSRef ReadableStreamStateType where
        toJSRef = return . show

instance Read ReadableStreamStateType where
        read x
          | x == js_ReadableStreamStateTypeReadable =
            ReadableStreamStateTypeReadable
        read x
          | x == js_ReadableStreamStateTypeWaiting =
            ReadableStreamStateTypeWaiting
        read x
          | x == js_ReadableStreamStateTypeClosed =
            ReadableStreamStateTypeClosed
        read x
          | x == js_ReadableStreamStateTypeErrored =
            ReadableStreamStateTypeErrored

instance FromJSRef ReadableStreamStateType where
        fromJSRefUnchecked = return . read
        fromJSRef = return . read . castRef

foreign import javascript unsafe "\"readable\""
        js_ReadableStreamStateTypeReadable :: JSRef ReadableStreamStateType

foreign import javascript unsafe "\"waiting\""
        js_ReadableStreamStateTypeWaiting :: JSRef ReadableStreamStateType

foreign import javascript unsafe "\"closed\""
        js_ReadableStreamStateTypeClosed :: JSRef ReadableStreamStateType

foreign import javascript unsafe "\"errored\""
        js_ReadableStreamStateTypeErrored :: JSRef ReadableStreamStateType

data OverSampleType = OverSampleTypeNone
                    | OverSampleType2x
                    | OverSampleType4x

instance Show OverSampleType where
        show OverSampleTypeNone = js_OverSampleTypeNone
        show OverSampleType2x = js_OverSampleType2x
        show OverSampleType4x = js_OverSampleType4x

instance ToJSRef OverSampleType where
        toJSRef = return . show

instance Read OverSampleType where
        read x | x == js_OverSampleTypeNone = OverSampleTypeNone
        read x | x == js_OverSampleType2x = OverSampleType2x
        read x | x == js_OverSampleType4x = OverSampleType4x

instance FromJSRef OverSampleType where
        fromJSRefUnchecked = return . read
        fromJSRef = return . read . castRef

foreign import javascript unsafe "\"none\"" js_OverSampleTypeNone
        :: JSRef OverSampleType

foreign import javascript unsafe "\"2x\"" js_OverSampleType2x ::
        JSRef OverSampleType

foreign import javascript unsafe "\"4x\"" js_OverSampleType4x ::
        JSRef OverSampleType

data PageOverlayType = PageOverlayTypeView
                     | PageOverlayTypeDocument

instance show PageOverlayType where
        show PageOverlayTypeView = js_PageOverlayTypeView
        show PageOverlayTypeDocument = js_PageOverlayTypeDocument

instance ToJSRef PageOverlayType where
        toJSRef = return . show

instance Read PageOverlayType where
        read x | x == js_PageOverlayTypeView = PageOverlayTypeView
        read x
          | x == js_PageOverlayTypeDocument = PageOverlayTypeDocument

instance FromJSRef PageOverlayType where
        fromJSRefUnchecked = return . read
        fromJSRef = return . read . castRef

foreign import javascript unsafe "\"view\"" js_PageOverlayTypeView
        :: JSRef PageOverlayType

foreign import javascript unsafe "\"document\""
        js_PageOverlayTypeDocument :: JSRef PageOverlayType

data XMLHttpRequestResponseType = XMLHttpRequestResponseType
                                | XMLHttpRequestResponseTypeArraybuffer
                                | XMLHttpRequestResponseTypeBlob
                                | XMLHttpRequestResponseTypeDocument
                                | XMLHttpRequestResponseTypeJson
                                | XMLHttpRequestResponseTypeText

instance show XMLHttpRequestResponseType where
        show XMLHttpRequestResponseType = js_XMLHttpRequestResponseType
        show XMLHttpRequestResponseTypeArraybuffer
          = js_XMLHttpRequestResponseTypeArraybuffer
        show XMLHttpRequestResponseTypeBlob
          = js_XMLHttpRequestResponseTypeBlob
        show XMLHttpRequestResponseTypeDocument
          = js_XMLHttpRequestResponseTypeDocument
        show XMLHttpRequestResponseTypeJson
          = js_XMLHttpRequestResponseTypeJson
        show XMLHttpRequestResponseTypeText
          = js_XMLHttpRequestResponseTypeText

instance ToJSRef XMLHttpRequestResponseType where
        toJSRef = return . show

instance Read XMLHttpRequestResponseType where
        read x
          | x == js_XMLHttpRequestResponseType = XMLHttpRequestResponseType
        read x
          | x == js_XMLHttpRequestResponseTypeArraybuffer =
            XMLHttpRequestResponseTypeArraybuffer
        read x
          | x == js_XMLHttpRequestResponseTypeBlob =
            XMLHttpRequestResponseTypeBlob
        read x
          | x == js_XMLHttpRequestResponseTypeDocument =
            XMLHttpRequestResponseTypeDocument
        read x
          | x == js_XMLHttpRequestResponseTypeJson =
            XMLHttpRequestResponseTypeJson
        read x
          | x == js_XMLHttpRequestResponseTypeText =
            XMLHttpRequestResponseTypeText

instance FromJSRef XMLHttpRequestResponseType where
        fromJSRefUnchecked = return . read
        fromJSRef = return . read . castRef

foreign import javascript unsafe "\"\""
        js_XMLHttpRequestResponseType :: JSRef XMLHttpRequestResponseType

foreign import javascript unsafe "\"arraybuffer\""
        js_XMLHttpRequestResponseTypeArraybuffer ::
        JSRef XMLHttpRequestResponseType

foreign import javascript unsafe "\"blob\""
        js_XMLHttpRequestResponseTypeBlob ::
        JSRef XMLHttpRequestResponseType

foreign import javascript unsafe "\"document\""
        js_XMLHttpRequestResponseTypeDocument ::
        JSRef XMLHttpRequestResponseType

foreign import javascript unsafe "\"json\""
        js_XMLHttpRequestResponseTypeJson ::
        JSRef XMLHttpRequestResponseType

foreign import javascript unsafe "\"text\""
        js_XMLHttpRequestResponseTypeText ::
        JSRef XMLHttpRequestResponseType
