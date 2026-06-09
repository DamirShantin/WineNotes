
import Foundation

protocol UpdateGrapeCountryUseCase {
    func execute(_ country: GrapeCountry) async throws
}

final class UpdateGrapeCountryUseCaseImpl: UpdateGrapeCountryUseCase {
    private let repo: GrapeCountryRepository
    
    init(repo: GrapeCountryRepository) {
        self.repo = repo
    }
    
    func execute(_ country: GrapeCountry) async throws{
        do {
            try await repo.updateGrapeCountry(country)
        } catch {
            throw GrapeError.nonFoundCountry
        }
    }
}
