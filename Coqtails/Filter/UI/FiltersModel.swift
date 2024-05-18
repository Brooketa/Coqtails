import Foundation

struct FilterModel: Identifiable, Hashable {

    let id = UUID()
    let filterType: FilterType
    let filterNames: [String]

}
