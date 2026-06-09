
import Foundation

protocol WineRepository {
    func fetchWine() async throws -> [Wine]
    func updateWine(_ wine: Wine) async throws
    func deleteWine(_ id: String) async throws
    func createWine(_ wine: Wine) async throws
}
