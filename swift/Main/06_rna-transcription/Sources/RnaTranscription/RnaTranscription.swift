struct RnaTranscription {
    enum TranscriptionError: Error {
        case invalidNucleotide(String)
    }
}

struct Nucleotide {

    // MARK: - Types

    private enum Nucleotide: String {
        case C
        case G
        case T
        case A

        var dnaComplement: String {
            switch self {
            case .C:
                return "G"
            case .G:
                return "C"
            case .T:
                return "A"
            case .A:
                return "U"
            }
        }
    }

    // MARK: - Properties

    private let rna: String

    // MARK: - Init

    init(_ rna: String) {
        self.rna = rna
    }

    // MARK: - Logic

    func complementOfDNA() throws -> String {
        return try self.rna.reduce("", { (result: String, char: Character) -> String in
            guard let nucleotide = Nucleotide(rawValue: String(char)) else {
                throw RnaTranscription.TranscriptionError.invalidNucleotide("\(char) is not a valid Nucleotide")
            }

            return result + nucleotide.dnaComplement
        })
    }

}
