
import Foundation

protocol FetchGrapeUseCase{
    func execute(_ wine: Wine) async throws -> [Grape]
}

final class FetchGrapeUseCaseImpl: FetchGrapeUseCase {
    private let repo: GrapeRepository
    
    init(repo: GrapeRepository) {
        self.repo = repo
    }
    
    func execute(_ wine: Wine) async throws -> [Grape] {
        try await repo.fetchGrape(wine)
    }
}
