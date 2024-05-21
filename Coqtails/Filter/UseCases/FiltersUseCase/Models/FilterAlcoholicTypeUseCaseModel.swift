struct FilterAlcoholicTypeUseCaseModel {

    let filterName: String

}

extension FilterAlcoholicTypeUseCaseModel {

    init(from model: FilterAlcoholicTypeClientModel) {
        self.filterName = model.filterName
    }

}
