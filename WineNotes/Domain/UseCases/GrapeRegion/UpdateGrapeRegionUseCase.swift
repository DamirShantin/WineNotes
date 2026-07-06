
import Foundation

protocol UpdateGrapeRegionUseCase {
    func execute(_ region: GrapeRegion) async throws
}

final class UpdateGrapeRegionUseCaseImpl: UpdateGrapeRegionUseCase {
    private let repo: GrapeRegionRepository
    
    init(repo: GrapeRegionRepository) {
        self.repo = repo
    }
    
    func execute(_ region: GrapeRegion) async throws{
        do {
            try await repo.updateGrapeRegion(region)
        } catch {
            throw GrapeError.nonFoundRegions
        }
    }
}
