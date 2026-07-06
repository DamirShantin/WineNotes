
import Foundation

protocol FetchInfoGrapeRegionUseCase{
    func execute(name: String) async throws -> String
}

final class FetchInfoGrapeRegionImpl: FetchInfoGrapeRegionUseCase {
    private let repo: GrapeRegionRepository
    
    init(repo: GrapeRegionRepository) {
        self.repo = repo
    }
    
    func execute(name: String) async throws -> String {
        let info = try await repo.fetchInfoGrapeRegion(name: name)
        guard !info.isEmpty else { throw GrapeError.nonFoundRegionInfo }
        return info
    }
}
