struct FilterGlassTypeUseCaseModel {

    let filterName: String

}

extension FilterGlassTypeUseCaseModel {

    init(from model: FilterGlassTypeClientModel) {
        self.filterName = model.filterName
    }

}
