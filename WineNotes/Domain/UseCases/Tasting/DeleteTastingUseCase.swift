
import Foundation

protocol DeleteTastingUseCase {
    func execute(_ id: String) async throws
}

final class DeleteTastingUseCaseImpl: DeleteTastingUseCase {
    private let repo: TastingRepository
    
    init(repo: TastingRepository) {
        self.repo = repo
    }
    
    func execute(_ id: String) async throws {
        do {
            try await repo.deleteTasting(id)
        } catch {
            throw TastingError.invalidData
        }
    }
}
