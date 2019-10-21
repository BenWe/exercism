struct RomanNumeral: LosslessStringConvertible {

    // MARK: - Properties

    private let year: Int

    // MARK: - Init

    init(_ year: Int) {
        self.year = year
    }

    init?(_ description: String) {
        fatalError("Not implemented")
    }

    // MARK: - LosslessStringConvertible

    var description: String {
        let romans: [(character: String, value: Int)] = [("I", 1), ("IV", 4), ("V", 5), ("IX", 9), ("X", 10), ("XL", 40), ("L", 50), ("XC", 90), ("C", 100), ("CD", 400), ("D", 500), ("CM", 900), ("M", 1000),
        ]
        var numerals = [String]()
        var yearCopy = self.year

        for tuple in romans.reversed() {
            if yearCopy == 0 {
                break
            }
            while yearCopy >= tuple.value {
                numerals.append(tuple.character)
                yearCopy -= tuple.value
            }
        }

        return numerals.joined()
    }

}
