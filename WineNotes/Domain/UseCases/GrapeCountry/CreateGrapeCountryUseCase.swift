
import Foundation

protocol CreateGrapeCountryUseCase {
    func execute(_ country: GrapeCountry) async throws
}

final class CreateGrapeCountryUseCaseImpl: CreateGrapeCountryUseCase {
    private let repo: GrapeCountryRepository
    
    init(repo: GrapeCountryRepository) {
        self.repo = repo
    }
    
    func execute(_ country: GrapeCountry) async throws{
        do {
            try await repo.createGrapeCountry(country)
        } catch {
            throw GrapeError.nonFoundCountry
        }
    }
}
