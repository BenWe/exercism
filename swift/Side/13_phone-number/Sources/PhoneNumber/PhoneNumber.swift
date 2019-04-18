import Foundation
struct PhoneNumber: CustomStringConvertible {

    // MARK: - Constants

    private static let unallowedCharacters = "() -."
    private static let replacementForInvalidNumber = "0000000000"
    private static let allowedAmountOfCharacters = 10

    // MARK: - Properties

    let number: String

    var areaCode: String {
        return self.getNumberFrom(from: 0, to: 3)
    }

    var exchangeCode: String {
        return self.getNumberFrom(from: 3, to: 6)
    }

    var subscriberNumber: String {
        return self.getNumberFrom(from: 6, to: 10)
    }

    // MARK: - Init

    init(_ number: String) {
        self.number = PhoneNumber.cleanup(number: number)
    }

    // MARK: - Logic

    private static func cleanup(number: String) -> String {
        var cleanupString = number
        cleanupString = PhoneNumber.removeSpecialCharacters(from: cleanupString)
        cleanupString = PhoneNumber.removeFirstOneIfNeccesary(from: cleanupString)

        if cleanupString.count != allowedAmountOfCharacters {
            return replacementForInvalidNumber
        }

        return cleanupString
    }

    private static func removeSpecialCharacters(from string: String) -> String {
        return string.filter { unallowedCharacters.contains($0) == false }
    }

    private static func removeFirstOneIfNeccesary(from string: String) -> String {
        if string.first == "1" {
            return String(string.dropFirst())
        }

        return string
    }

    // MARK: - Helper

    private func getNumberFrom(from: Int, to: Int) -> String {
        let startIndex = self.number.startIndex

        let start = (from == 0) ? startIndex : self.number.index(startIndex, offsetBy: from)
        let end = self.number.index(startIndex, offsetBy: to)

        return String(number[start ..< end])
    }

    // MARK: - CustomStringConvertible Implementation

    var description: String {
        return "(\(self.areaCode)) \(self.exchangeCode)-\(self.subscriberNumber)"
    }

}
