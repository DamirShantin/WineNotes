
import Foundation

protocol CreateTastingUseCase {
    func execute(_ tasting: Tasting) async throws
}

final class CreateTastingUseCaseImpl: CreateTastingUseCase {
    private let repo: TastingRepository
    
    init(repo: TastingRepository) {
        self.repo = repo
    }
    
    func execute(_ tasting: Tasting) async throws{
        do {
            try await repo.createTasting(tasting)
        } catch {
            throw TastingError.invalidData
        }
    }
}
