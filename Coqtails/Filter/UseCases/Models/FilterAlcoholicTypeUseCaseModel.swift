struct FilterAlcoholicTypeUseCaseModel {

    let filterName: String

    init(from model: FilterAlcoholicTypeClientModel) {
        self.filterName = model.filterName
    }

}
