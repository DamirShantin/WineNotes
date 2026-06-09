
import Foundation

protocol DeleteGrapeRegionUseCase {
    func execute(_ id: String) async throws
}

final class DeleteGrapeRegionUseCaseImpl: DeleteGrapeRegionUseCase {
    private let repo: GrapeRegionRepository
    
    init(repo: GrapeRegionRepository) {
        self.repo = repo
    }
    
    func execute(_ id: String) async throws{
        do {
            try await repo.deleteGrapeRegion(id)
        } catch {
            throw GrapeError.nonFoundRegion
        }
    }
}
