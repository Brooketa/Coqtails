protocol SearchUseCaseProtocol {

    func searchCoctails(query: String) async throws -> [SearchCoctailUseCaseModel]

}
