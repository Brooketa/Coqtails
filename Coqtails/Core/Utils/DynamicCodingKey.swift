struct DynamicCodingKey: CodingKey {

    var intValue: Int?
    var stringValue: String
    
    init?(intValue: Int) {
        self.intValue = intValue
        self.stringValue = ""
    }

    init?(stringValue: String) {
        self.intValue = nil
        self.stringValue = stringValue
    }

}
