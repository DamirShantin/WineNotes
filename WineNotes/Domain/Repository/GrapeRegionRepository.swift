
import Foundation

protocol GrapeRegionRepository {
    func fetchGrapeRegion(country: GrapeCountry) async throws -> [GrapeRegion]
    func updateGrapeRegion(_ region: GrapeRegion) async throws
    func deleteGrapeRegion(_ id: String) async throws
    func createGrapeRegion(_ region: GrapeRegion) async throws
}
