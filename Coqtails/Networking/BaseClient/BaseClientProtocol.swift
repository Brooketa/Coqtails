import Foundation

protocol BaseClientProtocol {

    func execute<ResponseType: Decodable>(
        path: String,
        method: HTTPMethod,
        parameters: [String: String]
    ) async throws -> ResponseType

}
