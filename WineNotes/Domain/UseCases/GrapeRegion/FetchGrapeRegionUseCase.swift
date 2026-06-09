
import Foundation

protocol FetchGrapeRegionUseCase {
    func execute(_ country: GrapeCountry) async throws -> [GrapeRegion]
}

final class FetchGrapeRegionUseCaseImpl: FetchGrapeRegionUseCase {
    private let repo: GrapeRegionRepository
    
    init(repo: GrapeRegionRepository) {
        self.repo = repo
    }
    
    func execute(_ country: GrapeCountry) async throws -> [GrapeRegion]{
        let regions = try await repo.fetchGrapeRegion(country: country)
        return regions
    }
}
