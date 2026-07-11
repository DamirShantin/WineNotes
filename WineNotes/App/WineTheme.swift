import SwiftUI

enum WineTheme {
    
    // MARK: Background
    static let background      = Color(hex: "#F7F3EF")
    static let cardBackground  = Color(hex: "#FFFFFF")
    static let cardBorder      = Color(hex: "#EAE0D8")
    static let filterBg        = Color(hex: "#EDE6DF")
    static let heroBg          = Color(hex: "#EAE0D8")

    // MARK: Text
    static let textPrimary     = Color(hex: "#1A0E13")
    static let textSecondary   = Color(hex: "#A89298")
    static let placeholder     = Color(hex: "#C8B8BC")
    static let textButton      = Color(hex: "#a99298")

    // MARK: Accent
    static let burgundy        = Color(hex: "#8C1C32")
    static let gold            = Color(hex: "#A06828")
    static let starColor       = Color(hex: "#C4882A")

    // MARK: Tabs
    static let tabActive       = Color(hex: "#8C1C32")
    static let tabInactive     = Color(hex: "#C8B8BE")

    // MARK: Input
    static let inputBorder     = Color(hex: "#DDD0C8")

    // MARK: Slider
    static let sliderFill      = Color(hex: "#8C1C32")
    static let sliderBg        = Color(hex: "#EAE0D8")

    // MARK: Type Dots
    static let dotRed          = Color(hex: "#D04060")
    static let dotWhite        = Color(hex: "#D4B840")
    static let dotSparkling    = Color(hex: "#5BAAD4")
    static let dotRose         = Color(hex: "#E07090")
    static let dotFortified    = Color(hex: "#C08040")

    // MARK: Onboarding / Dark
    static let darkBg1         = Color(hex: "#1A0E18")
    static let darkBg2         = Color(hex: "#0E1318")
    static let darkBg3         = Color(hex: "#101318")
    static let shareCardBg     = Color(hex: "#120A10")
    
    // MARK: Gradients
    static let gradientColorDark:  [Color] = [.black, .black.opacity(0), .black.opacity(0), .black.opacity(0)]
    static let gradientColorLight: [Color] = [.white, .white.opacity(0), .white.opacity(0), .white.opacity(0)]
    
    // MARK: - Type dot color helper
    static func typeDotColor(_ type: WineType) -> Color {
        switch type {
        case .still:     return dotWhite
        case .sparkling: return dotSparkling
        case .fortified: return dotFortified
        }
    }
    static func typeDotColor(_ type: WineColor) -> Color {
        switch type {
        case .red:       return dotRed
        case .white:     return dotWhite
        case .rose:      return dotRose
        }
    }
    static func typeDotColor(_ type: GrapeColor) -> Color {
        switch type {
        case .red:       return dotRed
        case .white:     return dotWhite
        }
    }
    
    // MARK: - Type gradient helper
    static func typeGradient(_ type: WineType) -> [Color] {
        switch type {
        case .still:     return [Color(hex: "100E00"), Color(hex: "5A4010"), Color(hex: "C9A96E")]
        case .sparkling: return [Color(hex: "050F18"), Color(hex: "1A3A52"), Color(hex: "4A7A9C")]
        case .fortified: return [Color(hex: "0A0416"), Color(hex: "3A1F5C"), Color(hex: "7B5AAC")]
        }
    }
    
    static func typeGradient(_ type: WineColor) -> [Color] {
        switch type {
        case .red:       return [Color(hex: "1A0408"), Color(hex: "5C0F1F"), Color(hex: "8C1C32")]
        case .white:     return [Color(hex: "100E00"), Color(hex: "5A4010"), Color(hex: "C9A96E")]
        case .rose:      return [Color(hex: "1A0A10"), Color(hex: "8C1C32")]
        }
    }
    // MARK: - Type status wine color helper
    static func typeStatusColor(_ status: WineStatus) -> Color {
        switch status{
        case .tasted:     return Color(hex: "#69c272")
        case .collection: return Color(hex: "#A06828")
        case .wishlist:   return Color(hex: "#5BAAD4")
        }
    }
}

// MARK: - Typography
enum WineFont {
    static func titleLarge(_ size: CGFloat = 28) -> Font    { .system(size: size, weight: .bold) }
    static func titleMedium(_ size: CGFloat = 20) -> Font   { .system(size: size, weight: .semibold) }
    static func body(_ size: CGFloat = 15) -> Font          { .system(size: size, weight: .regular) }
    static func bodyMedium(_ size: CGFloat = 15) -> Font    { .system(size: size, weight: .medium) }
    static func bodySemibold(_ size: CGFloat = 15) -> Font  { .system(size: size, weight: .semibold)}
    static func caption(_ size: CGFloat = 12) -> Font       { .system(size: size, weight: .regular) }
    static func captionMedium(_ size: CGFloat = 12) -> Font { .system(size: size, weight: .semibold) }
}

// MARK: - Spacing / Radius Constants
enum WineLayout {
    static let paddingHorizontal: CGFloat = 20
    static let paddingVertical: CGFloat   = 16
    static let cardRadius: CGFloat        = 12
    static let buttonRadius: CGFloat      = 12
    static let inputRadius: CGFloat       = 10
    static let cardSpacing: CGFloat       = 12
    static let sectionSpacing: CGFloat    = 24
}

// MARK: - Color(hex:) extension
extension Color {
    init(hex: String) {
        let h = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: h).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch h.count {
        case 3:
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6:
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8:
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(.sRGB,
                  red: Double(r) / 255,
                  green: Double(g) / 255,
                  blue: Double(b) / 255,
                  opacity: Double(a) / 255)
    }
}

