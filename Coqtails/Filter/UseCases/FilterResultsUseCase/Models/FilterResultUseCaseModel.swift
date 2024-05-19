struct FilterResultUseCaseModel {

    let id: String
    let thumbnailURL: String?
    let name: String
    let instructions: String?

    init(from model: FilterResultClientModel) {
        self.id = model.id
        self.thumbnailURL = model.thumbnailURL
        self.name = model.name
        self.instructions = model.instructions
    }

}
