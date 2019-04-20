import Foundation

struct IsbnVerifier {

    // MARK: - Constants

    private static let requiredLength: Int = 10
    private static let allowedCharacter: String = "0123456789X"
    private static let checkCharacter: Character = "X"
    private static let multipliers: [Int] = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]

    // MARK: - Logic

    static func isValid(_ string: String) -> Bool {
        let cleanedString = string.filter { IsbnVerifier.allowedCharacter.contains($0) }

        guard cleanedString.count == IsbnVerifier.requiredLength else {
            return false
        }

        let multipliers = IsbnVerifier.multipliers
        var total = 0

        for i in stride(from: 0, to: 10, by: 1) {
            // It is such a joy to work with Strings in Swift 🤓
            let multiplier = multipliers[i]
            let index = String.Index(encodedOffset: i)
            let char = cleanedString[index]
            let asString = String(char)

            // Special case for the check character X
            if i == 9, char == IsbnVerifier.checkCharacter {
                total += 10
                break
            }

            // We filter our any unwanted letters here
            guard let asInt = Int(asString) else {
                return false
            }

            total += asInt * multiplier
        }

        return total % 11 == 0
    }

}
