
import Foundation

protocol FetchAllGrapeUseCase {
    func execute() async throws -> [Grape]
}

final class FetchAllGrapeUseCaseImpl: FetchAllGrapeUseCase {
    private let repo: GrapeRepository
    
    init(repo: GrapeRepository) {
        self.repo = repo
    }
    
    func execute() async throws -> [Grape]{
        let grapes = try await repo.fetchAllGrape()
        return grapes
    }
}
