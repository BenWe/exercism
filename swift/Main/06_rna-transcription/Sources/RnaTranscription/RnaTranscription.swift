struct RnaTranscription {
    enum TranscriptionError: Error {
        case invalidNucleotide(String)
    }
}

struct Nucleotide {

    // MARK: - Constants

    private static let nucleotides = [
        "C": "G",
        "G": "C",
        "T": "A",
        "A": "U",
    ]

    // MARK: - Properties

    private let rna: String

    // MARK: - Init

    init(_ rna: String) {
        self.rna = rna
    }

    // MARK: - Logic

    func complementOfDNA() throws -> String {
        return try self.rna.reduce("", { (result: String, char: Character) -> String in
            guard let nucleotide = Nucleotide.nucleotides[String(char)] else {
                throw RnaTranscription.TranscriptionError.invalidNucleotide("\(char) is not a valid Nucleotide")
            }

            return result + nucleotide
        })
    }

}
