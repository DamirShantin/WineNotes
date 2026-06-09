
import Foundation

protocol CreateGrapeRegionUseCase {
    func execute(_ region: GrapeRegion) async throws
}

final class CreateGrapeRegionUseCaseImpl: CreateGrapeRegionUseCase {
    private let repo: GrapeRegionRepository
    
    init(repo: GrapeRegionRepository) {
        self.repo = repo
    }
    
    func execute(_ region: GrapeRegion) async throws{
        do {
            try await repo.createGrapeRegion(region)
        } catch {
            throw GrapeError.nonFoundRegion
        }
    }
}
