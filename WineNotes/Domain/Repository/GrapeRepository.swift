
import Foundation

protocol GrapeRepository {
    func fetchGrape() async throws -> [Grape]
    func updateGrape(_ wine: Grape) async throws
    func deleteGrape(_ id: String) async throws
    func createGrape(_ wine: Grape) async throws
}
