
import Foundation

protocol TastingRepository {
    func fetchTasting(wine: Wine) async throws -> [Tasting]
    func updateTasting(_ tasting: Tasting) async throws
    func deleteTasting(_ id: String) async throws
    func createTasting(_ tasting: Tasting) async throws
}
