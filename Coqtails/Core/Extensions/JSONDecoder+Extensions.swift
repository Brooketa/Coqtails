import Foundation

extension JSONDecoder {

    static let networking: JSONDecoder = {
        var decoder = JSONDecoder()
        decoder.setISO8601NoTDateDecodingStrategy()

        return decoder
    }()

    private func setISO8601NoTDateDecodingStrategy() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"

        self.dateDecodingStrategy = .formatted(dateFormatter)
    }

}
