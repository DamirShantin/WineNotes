
import Foundation

protocol UpdateGrapeUseCase {
    func execute(_ grape: Grape) async throws
}

final class UpdateGrapeUseCaseImpl: UpdateGrapeUseCase {
    private let repo: GrapeRepository
    
    init(repo: GrapeRepository) {
        self.repo = repo
    }
    
    func execute(_ grape: Grape) async throws{
        do {
            try await repo.updateGrape(grape)
        } catch {
            throw GrapeError.invalidData
        }
    }
}
