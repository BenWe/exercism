//Solution goes in Sources

class DNA {

    // MARK: - Constants

    private static let dnaCharacters: [Character] = ["A", "C", "G", "T"]

	// MARK: - Properties

	private var strand: String

	// MARK: - Init

	init?(strand: String) {
        guard DNA.isAllowedDNA(strand) else {
            return nil
        }

		self.strand = strand
	}

    // MARK: - Public methods

    func count(_ nucleotide: String) -> Int {
        return self.count(character: Character(nucleotide), in: self.strand)
    }

    func counts() -> [String: Int] {
        let allowedCharacters = DNA.dnaCharacters
        let strandRef = self.strand

        var nucleotideCounts = [String: Int]()
        allowedCharacters.forEach { (character) in
            nucleotideCounts[String(character)] = self.count(character: character, in: strandRef)
        }

        return nucleotideCounts
    }

    // MARK: - Private methods

    private func count(character: Character, in string: String) -> Int {
        return string.filter { $0 == character }.count
    }

    private static func isAllowedDNA(_ dna: String) -> Bool {
        if dna.isEmpty {
            return true
        }

        let allowedCharacters = DNA.dnaCharacters
        let result = dna.filter { (character: Character) -> Bool in
            return allowedCharacters.contains(character)
        }.isEmpty == false

        return result
    }

}
