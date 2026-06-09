
import Foundation

protocol FetchTastingUseCase{
    func execute(_ wine: Wine) async throws -> [Tasting]
}

final class FetchTastingUseCaseImpl: FetchTastingUseCase {
    private let repo: TastingRepository
    
    init(repo: TastingRepository) {
        self.repo = repo
    }
    
    func execute(_ wine: Wine) async throws -> [Tasting] {
        let tastings = try await repo.fetchTasting(wine: wine)
        return tastings
    }
}
