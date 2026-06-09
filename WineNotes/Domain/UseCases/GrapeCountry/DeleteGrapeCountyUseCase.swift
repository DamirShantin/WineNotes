
import Foundation

protocol DeleteGrapeCountryUseCase {
    func execute(_ id: String) async throws
}

final class DeleteGrapeCountryUseCaseImpl: DeleteGrapeCountryUseCase {
    private let repo: GrapeCountryRepository
    
    init(repo: GrapeCountryRepository) {
        self.repo = repo
    }
    
    func execute(_ id: String) async throws{
        do {
            try await repo.deleteGrapeCountry(id)
        } catch {
            throw GrapeError.nonFoundCountry
        }
    }
}
