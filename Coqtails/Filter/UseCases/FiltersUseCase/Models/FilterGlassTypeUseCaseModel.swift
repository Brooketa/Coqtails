struct FilterGlassTypeUseCaseModel {

    let filterName: String

    init(from model: FilterGlassTypeClientModel) {
        self.filterName = model.filterName
    }

}
