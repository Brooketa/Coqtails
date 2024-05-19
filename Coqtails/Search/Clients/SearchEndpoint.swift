enum SearchEndpoint {

    case search(String)

    var path: String {
        "/search.php"
    }

    var parameters: [String : String] {
        switch self {
        case .search(let query):
            ["s" : query]

        }
    }

}
