import Foundation

//Solution goes in Sources

struct Gigasecond {

    // MARK: - Types

    private static var formatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = Gigasecond.dateFormat
        dateFormatter.timeZone = Gigasecond.timezone

        return dateFormatter
    }()

    // MARK: - Constants

    private static let calender = Calendar.autoupdatingCurrent
    private static let timezone = TimeZone(identifier: "UTC")!
    private static let dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
    private static let gigasecond = 1_000_000_000

    // MARK: - Properties

    var description: String {
        guard let dateWithOneGigasecond = Gigasecond.calender.date(byAdding: .second, value: Gigasecond.gigasecond, to: self.gigasecondDate) else {
            return ""
        }

        return Gigasecond.formatter.string(from: dateWithOneGigasecond)
    }

    private var gigasecondDate: Date

    // MARK: - Init

    init?(from timestamp: String) {
        guard let date = Gigasecond.formatter.date(from: timestamp) else {
            return nil
        }

        self.gigasecondDate = date
    }

}
