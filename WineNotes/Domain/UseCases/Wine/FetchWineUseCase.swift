
import Foundation

protocol FetchWineUseCase {
    func execute() async throws -> [Wine]
}

final class FetchWineUseCaseImpl: FetchWineUseCase {
    private let repo: WineRepository
    
    init(repo: WineRepository) {
        self.repo = repo
    }
    
    func execute() async throws -> [Wine] {
        let wines = try await repo.fetchWine()
        return wines
    }
}
