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
        if isOnlyWhitespace {
            return beThatWay
        }

        let isUppercase = self.isUppercase(input)
        if isUppercase {
            return chillout
        }

        let hasQuestionmark = input.hasSuffix("?")
        if hasQuestionmark {
            return sure
        }

        return whatever
    }

    private static func isUppercase(_ input: String) -> Bool {
        let filtered = input.components(separatedBy: CharacterSet.letters.inverted).joined()
        if filtered == "" {
            return false
        }

        return filtered == filtered.uppercased()
    }
}
