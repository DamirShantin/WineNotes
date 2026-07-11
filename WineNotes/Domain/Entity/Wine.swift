
import Foundation

struct Wine: Identifiable {
    var id:       String
    var name:     String
    var country:  String   // GrapeCountry
    var region:   String   // GrapeRegion
    var type:     WineType
    var color:    WineColor
    var grapes:   [Grape]
    var tastings: [Tasting]
    var status:   WineStatus

    var averageRating: Double? {
        let ratings = tastings.compactMap(\.rating)
        guard !ratings.isEmpty else { return nil }
        return ratings.reduce(0, +) / Double(ratings.count)
    }

    var tastedCount: Int { tastings.filter { $0.status == .tasted }.count }
    var tastedYearsText: String {
        let years = tastings.compactMap(\.year)
        let shown = years.prefix(3).map(String.init).joined(separator: ", ")
        return years.count > 3 ? "\(shown)..." : shown
    }
}
// MARK: - Wine color
enum WineColor: String, CaseIterable, Codable {
    case red       = "red"
    case white     = "white"
    case rose      = "rosé"

    var displayName: String {
        switch self {
        case .red:       return "Красное"
        case .white:     return "Белое"
        case .rose:      return "Розовое"
        }
    }
    
    var dotColorHex: String {
        switch self {
        case .red:       return "#D04060"
        case .white:     return "#D4B840"
        case .rose:      return "#E07090"
        }
    }
}


// MARK: - Wine Type
enum WineType: String, CaseIterable, Codable {
    case still     = "still"
    case sparkling = "sparkling"
    case fortified = "fortified"

    var displayName: String {
        switch self {
        case .still:     return "Тихое"
        case .sparkling: return "Игристое"
        case .fortified: return "Крепленое"
        }
    }

    var dotColorHex: String {
        switch self {
        case .still:     return "#D4B840" // fix
        case .sparkling: return "#5BAAD4"
        case .fortified: return "#C08040"
        }
    }
}

// MARK: - Wine Status

enum WineStatus: String, CaseIterable, Codable {
    case tasted     = "tasted"
    case collection = "collection"
    case wishlist   = "wishlist"

    var displayName: String {
        switch self {
        case .tasted:     return "Выпито"
        case .collection: return "В коллекции"
        case .wishlist:   return "Вишлист"
        }
    }
}


