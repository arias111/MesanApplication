// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ColorAsset.Color", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetColorTypeAlias = ColorAsset.Color
@available(*, deprecated, renamed: "ImageAsset.Image", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum Asset {
  internal static let accentColor = ColorAsset(name: "AccentColor")
  internal static let afternoon = ImageAsset(name: "Afternoon")
  internal static let activeBackground = ColorAsset(name: "activeBackground")
  internal static let primaryBackground = ColorAsset(name: "primaryBackground")
  internal static let textColor = ColorAsset(name: "textColor")
  internal static let night = ImageAsset(name: "Night")
  internal static let noImagePlaceholder = ImageAsset(name: "No-Image-Placeholder")
  internal static let _10 = ImageAsset(name: "10")
  internal static let _11 = ImageAsset(name: "11")
  internal static let _13 = ImageAsset(name: "13")
  internal static let _2 = ImageAsset(name: "2")
  internal static let _3 = ImageAsset(name: "3")
  internal static let _4 = ImageAsset(name: "4")
  internal static let _6 = ImageAsset(name: "6")
  internal static let _8 = ImageAsset(name: "8")
  internal static let _9 = ImageAsset(name: "9")
  internal static let cart = ImageAsset(name: "cart")
  internal static let like = ImageAsset(name: "like")
  internal static let mesan = ImageAsset(name: "mesan")
  internal static let profile = ImageAsset(name: "profile")
  internal static let setting = ImageAsset(name: "setting")
  internal static let image0 = ImageAsset(name: "image0")
  internal static let image1 = ImageAsset(name: "image1")
  internal static let image2 = ImageAsset(name: "image2")
  internal static let image3 = ImageAsset(name: "image3")
  internal static let image4 = ImageAsset(name: "image4")
  internal static let image5 = ImageAsset(name: "image5")
  internal static let logomesan = ImageAsset(name: "logomesan")
  internal static let profiles = ImageAsset(name: "profiles")
  internal static let accountLogin = ImageAsset(name: "account-login")
  internal static let accountLogout = ImageAsset(name: "account-logout")
  internal static let actionRedo = ImageAsset(name: "action-redo")
  internal static let actionUndo = ImageAsset(name: "action-undo")
  internal static let alignCenter = ImageAsset(name: "align-center")
  internal static let alignLeft = ImageAsset(name: "align-left")
  internal static let alignRight = ImageAsset(name: "align-right")
  internal static let aperture = ImageAsset(name: "aperture")
  internal static let arrowBottom = ImageAsset(name: "arrow-bottom")
  internal static let arrowCircleBottom = ImageAsset(name: "arrow-circle-bottom")
  internal static let arrowCircleLeft = ImageAsset(name: "arrow-circle-left")
  internal static let arrowCircleRight = ImageAsset(name: "arrow-circle-right")
  internal static let arrowCircleTop = ImageAsset(name: "arrow-circle-top")
  internal static let arrowLeft = ImageAsset(name: "arrow-left")
  internal static let arrowRight = ImageAsset(name: "arrow-right")
  internal static let arrowThickBottom = ImageAsset(name: "arrow-thick-bottom")
  internal static let arrowThickLeft = ImageAsset(name: "arrow-thick-left")
  internal static let arrowThickRight = ImageAsset(name: "arrow-thick-right")
  internal static let arrowThickTop = ImageAsset(name: "arrow-thick-top")
  internal static let arrowTop = ImageAsset(name: "arrow-top")
  internal static let audioSpectrum = ImageAsset(name: "audio-spectrum")
  internal static let audio = ImageAsset(name: "audio")
  internal static let badge = ImageAsset(name: "badge")
  internal static let ban = ImageAsset(name: "ban")
  internal static let barChart = ImageAsset(name: "bar-chart")
  internal static let basket = ImageAsset(name: "basket")
  internal static let batteryEmpty = ImageAsset(name: "battery-empty")
  internal static let batteryFull = ImageAsset(name: "battery-full")
  internal static let beaker = ImageAsset(name: "beaker")
  internal static let bell = ImageAsset(name: "bell")
  internal static let bluetooth = ImageAsset(name: "bluetooth")
  internal static let bold = ImageAsset(name: "bold")
  internal static let bolt = ImageAsset(name: "bolt")
  internal static let book = ImageAsset(name: "book")
  internal static let bookmark = ImageAsset(name: "bookmark")
  internal static let box = ImageAsset(name: "box")
  internal static let briefcase = ImageAsset(name: "briefcase")
  internal static let britishPound = ImageAsset(name: "british-pound")
  internal static let browser = ImageAsset(name: "browser")
  internal static let brush = ImageAsset(name: "brush")
  internal static let bug = ImageAsset(name: "bug")
  internal static let bullhorn = ImageAsset(name: "bullhorn")
  internal static let calculator = ImageAsset(name: "calculator")
  internal static let calendar = ImageAsset(name: "calendar")
  internal static let cameraSlr = ImageAsset(name: "camera-slr")
  internal static let caretBottom = ImageAsset(name: "caret-bottom")
  internal static let caretLeft = ImageAsset(name: "caret-left")
  internal static let caretRight = ImageAsset(name: "caret-right")
  internal static let caretTop = ImageAsset(name: "caret-top")
  internal static let chat = ImageAsset(name: "chat")
  internal static let check = ImageAsset(name: "check")
  internal static let chevronBottom = ImageAsset(name: "chevron-bottom")
  internal static let chevronLeft = ImageAsset(name: "chevron-left")
  internal static let chevronRight = ImageAsset(name: "chevron-right")
  internal static let chevronTop = ImageAsset(name: "chevron-top")
  internal static let circleCheck = ImageAsset(name: "circle-check")
  internal static let circleX = ImageAsset(name: "circle-x")
  internal static let clipboard = ImageAsset(name: "clipboard")
  internal static let clock = ImageAsset(name: "clock")
  internal static let cloudDownload = ImageAsset(name: "cloud-download")
  internal static let cloudUpload = ImageAsset(name: "cloud-upload")
  internal static let cloud = ImageAsset(name: "cloud")
  internal static let cloudy = ImageAsset(name: "cloudy")
  internal static let code = ImageAsset(name: "code")
  internal static let cog = ImageAsset(name: "cog")
  internal static let collapseDown = ImageAsset(name: "collapse-down")
  internal static let collapseLeft = ImageAsset(name: "collapse-left")
  internal static let collapseRight = ImageAsset(name: "collapse-right")
  internal static let collapseUp = ImageAsset(name: "collapse-up")
  internal static let command = ImageAsset(name: "command")
  internal static let commentSquare = ImageAsset(name: "comment-square")
  internal static let compass = ImageAsset(name: "compass")
  internal static let contrast = ImageAsset(name: "contrast")
  internal static let copywriting = ImageAsset(name: "copywriting")
  internal static let creditCard = ImageAsset(name: "credit-card")
  internal static let crop = ImageAsset(name: "crop")
  internal static let dashboard = ImageAsset(name: "dashboard")
  internal static let dataTransferDownload = ImageAsset(name: "data-transfer-download")
  internal static let dataTransferUpload = ImageAsset(name: "data-transfer-upload")
  internal static let delete = ImageAsset(name: "delete")
  internal static let dial = ImageAsset(name: "dial")
  internal static let document = ImageAsset(name: "document")
  internal static let dollar = ImageAsset(name: "dollar")
  internal static let doubleQuoteSansLeft = ImageAsset(name: "double-quote-sans-left")
  internal static let doubleQuoteSansRight = ImageAsset(name: "double-quote-sans-right")
  internal static let doubleQuoteSerifLeft = ImageAsset(name: "double-quote-serif-left")
  internal static let doubleQuoteSerifRight = ImageAsset(name: "double-quote-serif-right")
  internal static let droplet = ImageAsset(name: "droplet")
  internal static let eject = ImageAsset(name: "eject")
  internal static let elevator = ImageAsset(name: "elevator")
  internal static let ellipses = ImageAsset(name: "ellipses")
  internal static let envelopeClosed = ImageAsset(name: "envelope-closed")
  internal static let envelopeOpen = ImageAsset(name: "envelope-open")
  internal static let euro = ImageAsset(name: "euro")
  internal static let excerpt = ImageAsset(name: "excerpt")
  internal static let expandDown = ImageAsset(name: "expand-down")
  internal static let expandLeft = ImageAsset(name: "expand-left")
  internal static let expandRight = ImageAsset(name: "expand-right")
  internal static let expandUp = ImageAsset(name: "expand-up")
  internal static let externalLink = ImageAsset(name: "external-link")
  internal static let eye = ImageAsset(name: "eye")
  internal static let eyedropper = ImageAsset(name: "eyedropper")
  internal static let file = ImageAsset(name: "file")
  internal static let fire = ImageAsset(name: "fire")
  internal static let flag = ImageAsset(name: "flag")
  internal static let flash = ImageAsset(name: "flash")
  internal static let folder = ImageAsset(name: "folder")
  internal static let fork = ImageAsset(name: "fork")
  internal static let fullscreenEnter = ImageAsset(name: "fullscreen-enter")
  internal static let fullscreenExit = ImageAsset(name: "fullscreen-exit")
  internal static let globe = ImageAsset(name: "globe")
  internal static let graph = ImageAsset(name: "graph")
  internal static let gridFourUp = ImageAsset(name: "grid-four-up")
  internal static let gridThreeUp = ImageAsset(name: "grid-three-up")
  internal static let gridTwoUp = ImageAsset(name: "grid-two-up")
  internal static let hardDrive = ImageAsset(name: "hard-drive")
  internal static let header = ImageAsset(name: "header")
  internal static let headphones = ImageAsset(name: "headphones")
  internal static let heart = ImageAsset(name: "heart")
  internal static let home = ImageAsset(name: "home")
  internal static let image = ImageAsset(name: "image")
  internal static let inbox = ImageAsset(name: "inbox")
  internal static let infinity = ImageAsset(name: "infinity")
  internal static let info = ImageAsset(name: "info")
  internal static let italic = ImageAsset(name: "italic")
  internal static let justifyCenter = ImageAsset(name: "justify-center")
  internal static let justifyLeft = ImageAsset(name: "justify-left")
  internal static let justifyRight = ImageAsset(name: "justify-right")
  internal static let key = ImageAsset(name: "key")
  internal static let laptop = ImageAsset(name: "laptop")
  internal static let layers = ImageAsset(name: "layers")
  internal static let lightbulb = ImageAsset(name: "lightbulb")
  internal static let linkBroken = ImageAsset(name: "link-broken")
  internal static let linkIntact = ImageAsset(name: "link-intact")
  internal static let listRich = ImageAsset(name: "list-rich")
  internal static let list = ImageAsset(name: "list")
  internal static let location = ImageAsset(name: "location")
  internal static let lockLocked = ImageAsset(name: "lock-locked")
  internal static let lockUnlocked = ImageAsset(name: "lock-unlocked")
  internal static let loopCircular = ImageAsset(name: "loop-circular")
  internal static let loopSquare = ImageAsset(name: "loop-square")
  internal static let loop = ImageAsset(name: "loop")
  internal static let magnifyingGlass = ImageAsset(name: "magnifying-glass")
  internal static let mapMarker = ImageAsset(name: "map-marker")
  internal static let map = ImageAsset(name: "map")
  internal static let mediaPause = ImageAsset(name: "media-pause")
  internal static let mediaPlay = ImageAsset(name: "media-play")
  internal static let mediaRecord = ImageAsset(name: "media-record")
  internal static let mediaSkipBackward = ImageAsset(name: "media-skip-backward")
  internal static let mediaSkipForward = ImageAsset(name: "media-skip-forward")
  internal static let mediaStepBackward = ImageAsset(name: "media-step-backward")
  internal static let mediaStepForward = ImageAsset(name: "media-step-forward")
  internal static let mediaStop = ImageAsset(name: "media-stop")
  internal static let medicalCross = ImageAsset(name: "medical-cross")
  internal static let menu = ImageAsset(name: "menu")
  internal static let microphone = ImageAsset(name: "microphone")
  internal static let minus = ImageAsset(name: "minus")
  internal static let monitor = ImageAsset(name: "monitor")
  internal static let moon = ImageAsset(name: "moon")
  internal static let move = ImageAsset(name: "move")
  internal static let musicalNote = ImageAsset(name: "musical-note")
  internal static let paperclip = ImageAsset(name: "paperclip")
  internal static let pencil = ImageAsset(name: "pencil")
  internal static let people = ImageAsset(name: "people")
  internal static let person = ImageAsset(name: "person")
  internal static let phone = ImageAsset(name: "phone")
  internal static let pieChart = ImageAsset(name: "pie-chart")
  internal static let pin = ImageAsset(name: "pin")
  internal static let playCircle = ImageAsset(name: "play-circle")
  internal static let plus = ImageAsset(name: "plus")
  internal static let powerStandby = ImageAsset(name: "power-standby")
  internal static let print = ImageAsset(name: "print")
  internal static let project = ImageAsset(name: "project")
  internal static let pulse = ImageAsset(name: "pulse")
  internal static let puzzlePiece = ImageAsset(name: "puzzle-piece")
  internal static let questionMark = ImageAsset(name: "question-mark")
  internal static let rain = ImageAsset(name: "rain")
  internal static let random = ImageAsset(name: "random")
  internal static let reload = ImageAsset(name: "reload")
  internal static let resizeBoth = ImageAsset(name: "resize-both")
  internal static let resizeHeight = ImageAsset(name: "resize-height")
  internal static let resizeWidth = ImageAsset(name: "resize-width")
  internal static let rssAlt = ImageAsset(name: "rss-alt")
  internal static let rss = ImageAsset(name: "rss")
  internal static let script = ImageAsset(name: "script")
  internal static let shareBoxed = ImageAsset(name: "share-boxed")
  internal static let share = ImageAsset(name: "share")
  internal static let shield = ImageAsset(name: "shield")
  internal static let signal = ImageAsset(name: "signal")
  internal static let signpost = ImageAsset(name: "signpost")
  internal static let sortAscending = ImageAsset(name: "sort-ascending")
  internal static let sortDescending = ImageAsset(name: "sort-descending")
  internal static let spreadsheet = ImageAsset(name: "spreadsheet")
  internal static let star = ImageAsset(name: "star")
  internal static let sun = ImageAsset(name: "sun")
  internal static let tablet = ImageAsset(name: "tablet")
  internal static let tag = ImageAsset(name: "tag")
  internal static let tags = ImageAsset(name: "tags")
  internal static let target = ImageAsset(name: "target")
  internal static let task = ImageAsset(name: "task")
  internal static let terminal = ImageAsset(name: "terminal")
  internal static let text = ImageAsset(name: "text")
  internal static let thumbDown = ImageAsset(name: "thumb-down")
  internal static let thumbUp = ImageAsset(name: "thumb-up")
  internal static let timer = ImageAsset(name: "timer")
  internal static let transfer = ImageAsset(name: "transfer")
  internal static let trash = ImageAsset(name: "trash")
  internal static let underline = ImageAsset(name: "underline")
  internal static let verticalAlignBottom = ImageAsset(name: "vertical-align-bottom")
  internal static let verticalAlignCenter = ImageAsset(name: "vertical-align-center")
  internal static let verticalAlignTop = ImageAsset(name: "vertical-align-top")
  internal static let video = ImageAsset(name: "video")
  internal static let volumeHigh = ImageAsset(name: "volume-high")
  internal static let volumeLow = ImageAsset(name: "volume-low")
  internal static let volumeOff = ImageAsset(name: "volume-off")
  internal static let warning = ImageAsset(name: "warning")
  internal static let wifi = ImageAsset(name: "wifi")
  internal static let wrench = ImageAsset(name: "wrench")
  internal static let x = ImageAsset(name: "x")
  internal static let yen = ImageAsset(name: "yen")
  internal static let zoomIn = ImageAsset(name: "zoom-in")
  internal static let zoomOut = ImageAsset(name: "zoom-out")
  internal static let замок = ImageAsset(name: "замок")
  internal static let петля = ImageAsset(name: "петля")
  internal static let ручка = ImageAsset(name: "ручка")
  internal static let уплотнитель = ImageAsset(name: "уплотнитель")
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

internal final class ColorAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  internal private(set) lazy var color: Color = {
    guard let color = Color(asset: self) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }()

  fileprivate init(name: String) {
    self.name = name
  }
}

internal extension ColorAsset.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  convenience init?(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

internal struct ImageAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Image = UIImage
  #endif

  internal var image: Image {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let name = NSImage.Name(self.name)
    let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }
}

internal extension ImageAsset.Image {
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init?(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = BundleToken.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
