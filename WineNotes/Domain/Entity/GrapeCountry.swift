
import Foundation

struct GrapeCountry: Identifiable {
    var id:      String
    var name:    String
    var regions: [GrapeRegion]?
}
