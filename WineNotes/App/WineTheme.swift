import SwiftUI

enum WineTheme {
    static let bg          = Color(hex: "F5EFE9") // фон
    static let nav         = Color.white
    static let navText     = Color(hex: "1A0A10") // текст в навигации
    static let card        = Color.white
    static let cardBorder  = Color(hex: "EDE5DE") // граница в карте вина
    static let cardText    = Color(hex: "1A0A10") // текст в карточке
    static let cardSub     = Color(hex: "9E8880") // подтекст
    static let inputBorder = Color(hex: "DDD5CE") // поле ввода
    static let screenSub   = Color(hex: "9E8880") // подтекст
    static let accent      = Color(hex: "8C1C32") 
    static let accentGold  = Color(hex: "C9A96E")
    static let separator   = Color(hex: "EDE5DE") // граница
}

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

extension WineTheme {
    static func typeColor(_ type: String) -> Color {
        switch type {
        case "red":       return Color(hex: "8C1C32")
        case "white":     return Color(hex: "A07820")
        case "sparkling": return Color(hex: "2A5C80")
        case "fortified": return Color(hex: "5C2A80")
        default:          return Color(hex: "8C1C32")
        }
    }

    static func typeGradient(_ type: String) -> [Color] {
        switch type {
        case "red":       return [Color(hex: "1A0408"), Color(hex: "5C0F1F"), Color(hex: "8C1C32")]
        case "white":     return [Color(hex: "100E00"), Color(hex: "5A4010"), Color(hex: "C9A96E")]
        case "sparkling": return [Color(hex: "050F18"), Color(hex: "1A3A52"), Color(hex: "4A7A9C")]
        case "fortified": return [Color(hex: "0A0416"), Color(hex: "3A1F5C"), Color(hex: "7B5AAC")]
        default:          return [Color(hex: "1A0A10"), Color(hex: "8C1C32")]
        }
    }
}
