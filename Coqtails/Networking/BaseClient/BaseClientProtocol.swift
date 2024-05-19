import Foundation

protocol BaseClientProtocol {

    func execute<ResponseType: Decodable>(
        path: String,
        method: HTTPMethod,
        parameters: [String: String]
    ) async throws -> ResponseType

}

extension BaseClientProtocol {

    func execute<ResponseType: Decodable>(path: String, method: HTTPMethod) async throws -> ResponseType {
        try await execute(path: path, method: method, parameters: [:])
    }

}
