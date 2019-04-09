//Solution goes in Sources
import Foundation

class Clock: Equatable, CustomStringConvertible {

    // NARK: - Constants

    private static let minutesInADay = 1_440

    // MARK: - Properties

    private var totalMinutes: Int

    // MARK: - Init

    init(hours: Int, minutes: Int = 0) {
        self.totalMinutes = hours * 60 + minutes
    }

    // MARK: - Logic

    func add(minutes: Int) -> Clock {
        self.totalMinutes += minutes

        return self
    }

    func subtract(minutes: Int) -> Clock {
        self.totalMinutes -= minutes

        return self
    }

    // MARK: - Equatable Implementation

    static func == (lhs: Clock, rhs: Clock) -> Bool {
        return lhs.description == rhs.description
    }

    // MARK: - Custom String Convertible Implementation

    var description: String {
        var timeOfDay = self.totalMinutes % Clock.minutesInADay

        if timeOfDay < 0 {
            timeOfDay += Clock.minutesInADay
        }

        let newHours = timeOfDay / 60
        let newMinutes = timeOfDay % 60
        let string = String(format: "%02d:%02d", newHours, newMinutes)

        return string
    }

}
