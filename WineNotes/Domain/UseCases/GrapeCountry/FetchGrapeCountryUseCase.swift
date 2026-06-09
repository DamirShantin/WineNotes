
import Foundation

protocol FetchGrapeCountryUseCase {
    func execute(_ grape: Grape) async throws -> [GrapeCountry]
}

final class FetchGrapeCountryUseCaseImpl: FetchGrapeCountryUseCase {
    private let repo: GrapeCountryRepository
    
    init(repo: GrapeCountryRepository) {
        self.repo = repo
    }
    
    func execute(_ grape: Grape) async throws -> [GrapeCountry]{
        let countries = try await repo.fetchGrapeCountry(grape: grape)
        return countries
    }
}
