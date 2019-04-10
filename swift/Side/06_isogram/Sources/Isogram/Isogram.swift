import Foundation

//Solution goes in Sources

struct Isogram {

    // MARK: - Logic

    static func isIsogram(_ string: String) -> Bool {
        var characters = [String]()
        for character in string {
            if !character.isLetter {
                continue
            }

            let lowercased = character.lowercased()
            if characters.contains(lowercased) {
                return false
            }

            characters.append(lowercased)
        }

        return true
    }

}
