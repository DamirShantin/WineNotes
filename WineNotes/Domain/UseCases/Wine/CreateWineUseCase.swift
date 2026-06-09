
import Foundation

protocol CreateWineUseCase {
    func execute(_ wine: Wine) async throws
}

final class CreateWineUseCaseImpl: CreateWineUseCase {
    private let repo: WineRepository
    
    init(repo: WineRepository) {
        self.repo = repo
    }
    
    func execute(_ wine: Wine) async throws{
        do {
            try await repo.createWine(wine)
        } catch {
            throw WineError.invalidData
        }
    }
}
