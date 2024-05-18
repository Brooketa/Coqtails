import Foundation

class BaseClient: BaseClientProtocol {

    private let urlSession: URLSession
    private let baseURL: String = "https://www.thecocktaildb.com/api/json/v1/1"

    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }

    private func buildQueryItems(parameters: [String: String]) -> [URLQueryItem] {
        parameters.map { key, value in
            URLQueryItem(name: key, value: value)
        }
    }

    private func buildURL(path: String, parameters: [String: String]) -> URL? {
        guard var url = URL(string: "\(baseURL)\(path)?") else { return nil }

        let queryItems = buildQueryItems(parameters: parameters)
        url.append(queryItems: queryItems)

        return url
    }

    private func buildRequest(path: String, method: HTTPMethod, parameters: [String: String]) -> URLRequest? {
        guard let url = buildURL(path: path, parameters: parameters) else { return nil }
        print(url)
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.setValue("application/json", forHTTPHeaderField: "content-type")

        return request
    }

    func execute<ResponseType: Decodable>(
        path: String,
        method: HTTPMethod,
        parameters: [String : String]
    ) async throws -> ResponseType {
        guard
            let request = buildRequest(path: path, method: method, parameters: parameters)
        else { throw APIError.invalidURL }

        do {
            let (data, response) = try await urlSession.data(for: request)

            if
                let httpURLResponse = response as? HTTPURLResponse,
                (200...206).contains(httpURLResponse.statusCode)
            {
                do {
                    return try JSONDecoder.networking.decode(ResponseType.self, from: data)
                } catch {
                    throw error
                }
            } else {
                throw APIError.genericError("Generic error")
            }
        } catch {
            throw error
        }
    }

}
