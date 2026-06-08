
import Foundation


struct Tasting: Identifiable {
    var id:        String
    var year:      Int
    var date:      String?
    var status:    WineStatus           
    var rating:    Double?              // 0.0 – 5.0, step 0.1
    var character: WineCharacteristics?
    var price:     String
    var shop:      String
    var notes:     String
}


struct WineCharacteristics: Codable {
    var acidity:  Int      // 1–5
    var dryness:  Int      // 1–5
    var richness: Int      // 1–5
    var density:  Int      // 1–5
}

enum TastingStatus: String, CaseIterable, Codable {
    case tasted     = "tasted"
    case collection = "collection"
    case wishlist   = "wishlist"

    var displayName: String {
        switch self {
        case .tasted:     return "Попробовано"
        case .collection: return "В коллекции"
        case .wishlist:   return "Вишлист"
        }
    }
}
