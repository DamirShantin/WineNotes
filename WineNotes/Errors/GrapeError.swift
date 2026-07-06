
import Foundation

enum GrapeError: Error {
    case invalidData
    case nonFoundCountry
    case nonFoundRegions
    case nonFoundRegionInfo
    
    var description: String{
        switch self {
        case .invalidData: "Неверные Данные"
        case .nonFoundCountry: "Страны не найдены"
        case .nonFoundRegions: "Регионы не найдены"
        case .nonFoundRegionInfo: "Информация не найдена"
        }
    }
}
