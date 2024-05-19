import Foundation

struct FilterResultCocktailModel: Identifiable, Hashable {

    let id = UUID()
    let remoteID: String?
    let thumbnailURL: URL?
    let name: String
    let instructions: String

    init(from model: FilterResultUseCaseModel) {
        self.remoteID = model.id
        self.thumbnailURL = URL(string: model.thumbnailURL ?? "")
        self.name = model.name
        self.instructions = model.instructions ?? ""
    }

}
