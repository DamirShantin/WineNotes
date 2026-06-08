
import Foundation

struct GrapeCountry: Identifiable {
    var id:      String
    var country: String
    var knownAs: String
    var regions: [GrapeRegion]
}
