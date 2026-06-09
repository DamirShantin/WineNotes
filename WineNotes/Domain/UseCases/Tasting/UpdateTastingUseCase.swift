
import Foundation

protocol UpdateTastingUseCase {
    func execute(_ tasting: Tasting) async throws
}

final class UpdateTastingUseCaseImpl: UpdateTastingUseCase {
    private let repo: TastingRepository
    
    init(repo: TastingRepository) {
        self.repo = repo
    }
    
    func execute(_ tasting: Tasting) async throws{
        do {
            try await repo.updateTasting(tasting)
        } catch {
            throw TastingError.invalidData
        }
    }
}
