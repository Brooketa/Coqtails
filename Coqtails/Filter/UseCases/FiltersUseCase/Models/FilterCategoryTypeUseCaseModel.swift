struct FilterCategoryTypeUseCaseModel {

    let filterName: String

}

extension FilterCategoryTypeUseCaseModel {

    init(from model: FilterCategoryTypeClientModel) {
        self.filterName = model.filterName
    }

}
