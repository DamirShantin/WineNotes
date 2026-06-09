
import Foundation

enum TastingError: Error {
    case invalidData
    
    var description: String{
        switch self {
        case .invalidData: "Неверные Данные"
        }
    }
}
