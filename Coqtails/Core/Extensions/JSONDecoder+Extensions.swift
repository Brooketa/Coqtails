import Foundation

extension JSONDecoder {

    static let networking: JSONDecoder = {
        var decoder = JSONDecoder()
        decoder.setISO8601NoTDateDecodingStrategy()

        return decoder
    }()

    private func setISO8601NoTDateDecodingStrategy() {
        self.dateDecodingStrategy = .formatted(DateFormatter.iso8601NoTDateFormatter)
    }

}
