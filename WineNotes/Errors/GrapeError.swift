
import Foundation

enum GrapeError: Error {
    case invalidData
    case nonFoundCountry
    case nonFoundRegion
    
    var description: String{
        switch self {
        case .invalidData: "Неверные Данные"
        case .nonFoundCountry: "Страны не найдены"
        case .nonFoundRegion: "Регионы не найдены"
        }
    }
}
