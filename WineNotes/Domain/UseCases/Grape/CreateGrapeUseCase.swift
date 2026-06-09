
import Foundation

protocol CreateGrapeUseCase {
    func execute(_ grape: Grape) async throws
}

final class CreateGrapeUseCaseImpl: CreateGrapeUseCase {
    private let repo: GrapeRepository
    
    init(repo: GrapeRepository) {
        self.repo = repo
    }
    
    func execute(_ grape: Grape) async throws{
        do {
            try await repo.createGrape(grape)
        } catch {
            throw GrapeError.invalidData
        }
    }
}
