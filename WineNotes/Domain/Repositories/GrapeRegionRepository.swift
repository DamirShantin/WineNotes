
import Foundation

protocol GrapeRegionRepository {
    func fetchGrapeRegion(country: GrapeCountry) async throws -> [GrapeRegion]
    func fetchInfoGrapeRegion(name: String) async throws -> String
    func updateGrapeRegion(_ region: GrapeRegion) async throws
    func deleteGrapeRegion(_ id: String) async throws
    func createGrapeRegion(_ region: GrapeRegion) async throws
}
