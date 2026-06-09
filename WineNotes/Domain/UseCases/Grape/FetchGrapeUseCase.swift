
import Foundation

protocol FetchGrapeUseCase {
    func execute() async throws -> [Grape]
}

final class FetchGrapeUseCaseImpl: FetchGrapeUseCase {
    private let repo: GrapeRepository
    
    init(repo: GrapeRepository) {
        self.repo = repo
    }
    
    func execute() async throws -> [Grape]{
        let grapes = try await repo.fetchGrape()
        return grapes
    }
}
