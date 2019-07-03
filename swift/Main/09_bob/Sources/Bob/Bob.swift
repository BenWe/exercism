import Foundation

struct Bob {

    // MARK: - Constants

    private static let beThatWay = "Fine. Be that way!"
    private static let sure = "Sure."
    private static let chillout = "Whoa, chill out!"
    private static let whatever = "Whatever."

    // MARK: - Logic

    static func hey(_ input: String) -> String {
        let isOnlyWhitespace = input.trimmingCharacters(in: .whitespacesAndNewlines).count == 0
        let isUppercase = self.isUppercase(input)
        let hasQuestionmark = input.hasSuffix("?")

        if isOnlyWhitespace {
            return beThatWay
        } else if isUppercase {
            return chillout
        } else if hasQuestionmark {
            return sure
        } else {
            return whatever
        }
    }

    private static func isUppercase(_ input: String) -> Bool {
        let filtered = input.components(separatedBy: CharacterSet.letters.inverted).joined()
        if filtered == "" {
            return false
        }

        return filtered == filtered.uppercased()
    }
}
