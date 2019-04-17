struct Scrabble {

    // MARK: - Types

    private static let scoreTable: [String: Int] = [
        "a": 1, "e": 1, "i": 1, "o": 1, "u": 1, "l": 1, "n": 1, "r": 1, "s": 1, "t": 1,
        "d": 2, "g": 2,
        "b": 3, "c": 3, "m": 3, "p": 3,
        "f": 4, "h": 4, "v": 4, "w": 4, "y": 4,
        "k": 5,
        "j": 8, "x": 8,
        "q": 10, "z": 10,
    ]

    // MARK: - Properties

    var string: String?

    var score: Int {
        return self.calculateScore(from: self.string)
    }

    // MARK: - Init

    init(_ string: String?) {
        self.string = string
    }

    // MARK: - Logic

    func calculateScore(from string: String?) -> Int {
        guard let string = string else {
            return 0
        }

        let scoreTable = Scrabble.scoreTable
        var score = 0
        for character in string {
            if !character.isLetter {
                continue
            }

            if let scoreFound = scoreTable[character.lowercased()] {
                score += scoreFound
            }
        }

        return score
    }

    static func score(_ string: String) -> Int {
        return Scrabble(string).score
    }

}
