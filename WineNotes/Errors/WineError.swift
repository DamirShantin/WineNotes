

import Foundation

enum WineError: Error {
    case invalidData
    case nonFoundTasting
    
    var description: String{
        switch self {
        case .invalidData: "Неверные Данные"
        case .nonFoundTasting: "Дегустации не найдены"
        }
    }
}
