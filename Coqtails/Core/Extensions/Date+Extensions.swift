import Foundation

extension Date {

    func timeAgo() -> String {
        let difference = abs(self.timeIntervalSinceNow)
        let secondsInDay = 86400

        let differenceInDays = Int(difference) / secondsInDay

        switch difference {
        case 0..<2:
            return "Today"
        case 2...30:
            return "This month"
        case 31...365:
            return "This year"
        default:
            let formatter = RelativeDateTimeFormatter()
            let timeAgo = formatter.localizedString(for: self, relativeTo: Date.now)

            return timeAgo
        }
    }

}
