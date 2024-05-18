struct FilterCategoryTypeUseCaseModel {

    let filterName: String

    init(from model: FilterCategoryTypeClientModel) {
        self.filterName = model.filterName
    }

}
