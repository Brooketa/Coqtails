enum DetailsEndpoint {

    case lookup(String)

    case random

    var path: String {
        switch self {
        case .lookup(_):
            "/lookup.php"
        case .random:
            "/random.php"
        }
    }

    var parameters: [String : String] {
        switch self {
        case .lookup(let cocktailID):
            ["i": cocktailID]
        case .random:
            [:]
        }
    }

}
