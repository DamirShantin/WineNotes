
import Foundation

protocol GrapeCountryRepository {
    func fetchGrapeCountry(grape: Grape) async throws -> [GrapeCountry]
    func updateGrapeCountry(_ wine: GrapeCountry)async throws
    func deleteGrapeCountry(_ id: String) async throws
    func createGrapeCountry(_ wine: GrapeCountry) async throws
}
