enum FilterEndpoint {

    case category
    case glass
    case alcoholic
    case filtering([SelectedFilter])

    var path: String {
        switch self {
        case .category, .glass, .alcoholic:
            "/list.php"
        case .filtering(_):
            "/filter.php"
        }
    }

    var parameters: [String: String] {
        switch self {
        case .category:
            ["c" : "list"]
        case .glass:
            ["g" : "list"]
        case .alcoholic:
            ["a" : "list"]
        case .filtering(let selectedFilters):
            createFilterParameters(for: selectedFilters)
        }
    }

    private func createFilterParameters(for selectedFilters: [SelectedFilter]) -> [String : String] {
        var parameters = [String : String]()
        for filter in selectedFilters {
            switch filter.filterType {
            case .category:
                parameters["c"] = filter.filterName
            case .glass:
                parameters["g"] = filter.filterName
            case .alcoholic:
                parameters["a"] = filter.filterName
            }
        }

        return parameters
    }

}
