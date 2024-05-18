import Foundation

struct SearchCocktailModel: Identifiable, Hashable {

    let id = UUID()
    let highlightText: String
    let remoteID: String?
    let thumbnailURL: URL?
    let name: String
    let instructions: String

    init(searchText: String, remoteID: String?, thumbnailURL: URL?, name: String, instructions: String) {
        self.highlightText = searchText
        self.remoteID = remoteID
        self.thumbnailURL = thumbnailURL
        self.name = name
        self.instructions = instructions
    }

    init(for searchText: String, from model: SearchCoctailUseCaseModel) {
        self.highlightText = searchText
        self.remoteID = model.id
        self.thumbnailURL = URL(string: model.thumbnailURL ?? "")
        self.name = model.name ?? ""
        self.instructions = model.instructions ?? ""
    }

}