
import Foundation

protocol GrapeRepository {
    func fetchAllGrape() async throws -> [Grape]
    func fetchGrape(_ wine: Wine) async throws -> [Grape]
    func updateGrape(_ wine: Grape) async throws
    func deleteGrape(_ id: String) async throws
    func createGrape(_ wine: Grape) async throws
}
