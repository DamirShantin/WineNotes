
import Foundation

protocol UpdateWineUseCase {
    func execute(_ wine: Wine) async throws
}

final class UpdateWineUseCaseImpl: UpdateWineUseCase {
    private let repo: WineRepository
    
    init(repo: WineRepository) {
        self.repo = repo
    }
    
    func execute(_ wine: Wine) async throws{
        do {
            try await repo.updateWine(wine)
        } catch {
            throw WineError.invalidData
        }
    }
}
