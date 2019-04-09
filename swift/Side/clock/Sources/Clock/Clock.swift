//Solution goes in Sources
import Foundation

class Clock: Equatable, CustomStringConvertible {

    // NARK: - Constants

    private static let totalMinutes = 1_440
    private static let totalHours = 24

    // MARK: - Properties

    private var hours: Int
    private var minutes: Int

    // MARK: - Init

    init(hours: Int, minutes: Int = 0) {
        self.hours = hours
        self.minutes = minutes
    }

    // MARK: - Logic

    func add(minutes: Int) -> Clock {
        self.minutes += minutes

        return self
    }

    func subtract(minutes: Int) -> Clock {
        self.minutes -= minutes

        return self
    }

    // MARK: - Equatable Implementation

    static func == (lhs: Clock, rhs: Clock) -> Bool {
        return lhs.description == rhs.description
    }

    // MARK: - Custom String Convertible Implementation

    var description: String {
        let totalMinutes = self.findTotalTimeInMinutesAndRemoveRoundTripOfClock()
        var newTime: Int
        switch self.minutes {
        case Int.min ..< 0:
            newTime = Clock.totalMinutes - totalMinutes
        case 0:
            newTime = 0
        default:
            newTime = totalMinutes
        }


        let newHours = (self.hours % 24) + self.padHoursIfNessecary()
        let newMinutes = self.minutes % 60

        let string = String(format: "%02d:%02d", newHours, newMinutes)
        return string
    }

    private func findTotalTimeInMinutesAndRemoveRoundTripOfClock() -> Int {
        return (self.minutes + (self.hours * 60)) % Clock.totalMinutes
    }

    private func subtractHoursIfNessecary() -> Int {
        return 0
    }

    private func padHoursIfNessecary() -> Int {
        if self.minutes < 59 {
            return 0
        }

        let rounded = Int(Double(self.minutes / 60).rounded(.down))

        return rounded % 24
    }
}
