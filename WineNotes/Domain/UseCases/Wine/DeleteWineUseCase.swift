
import Foundation

protocol DeleteWineUseCase {
    func execute(_ id: String) async throws
}

final class DeleteWineUseCaseImpl: DeleteWineUseCase {
    private let repo: WineRepository
    
    init(repo: WineRepository) {
        self.repo = repo
    }
    
    func execute(_ id: String) async throws{
        do {
            try await repo.deleteWine(id)
        } catch {
            throw WineError.invalidData
        }
    }
}
