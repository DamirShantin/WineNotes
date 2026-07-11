
import Foundation

struct Grape: Identifiable, Equatable {
    
    
    var id:        String
    var name:      String          // Russian
    var latin:     String?         // Latin
    var color:     GrapeColor
    var origin:    String?
    var aliases:   [String]?       // other name
    var countries: [GrapeCountry]  //
    var aromas:    String?
    var desc:      String?         // descriptions
    
    static func == (lhs: Grape, rhs: Grape) -> Bool {
        return lhs.id == rhs.id && lhs.name == rhs.name
    }
}

enum GrapeColor: String, CaseIterable {
    case red   = "red"
    case white = "white"

    var title: String {
        switch self {
        case .red:   return "Красный"
        case .white: return "Белый"
        }
    }
}
