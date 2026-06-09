
import Foundation

protocol DeleteGrapeUseCase {
    func execute(_ id: String) async throws
}

final class DeleteGrapeUseCaseImpl: DeleteGrapeUseCase {
    private let repo: GrapeRepository
    
    init(repo: GrapeRepository) {
        self.repo = repo
    }
    
    func execute(_ id: String) async throws{
        do {
            try await repo.deleteGrape(id)
        } catch {
            throw GrapeError.invalidData
        }
    }
}
