enum ProteinError: Error {
    case generic
}

let proteinMap = [
    ["AUG"] : "Methionine",
    ["UUU", "UUC"] : "Phenylalanine",
    ["UUA", "UUG"] : "Leucine",
    ["UCU", "UCC", "UCA", "UCG"] : "Serine",
    ["UAU", "UAC"] : "Tyrosine",
    ["UGU", "UGC"] : "Cysteine",
    ["UGG"] : "Tryptophan",
    ["UAA", "UAG", "UGA"] : "STOP"
]

func translationOfCodon(_ codon: String) throws -> String {
    let possibleProtein: String? = proteinMap.compactMap {
        return ($0.key.contains(codon)) ? $0.value : nil
    }.first

    if let protein = possibleProtein {
        return protein
    } else {
        throw ProteinError.generic
    }
}

func translationOfRNA(_ rna: String) throws -> [String] {
    let codons =
        stride(from: 0, to: rna.count, by: 3)
        .compactMap { (index: Int) -> String in
            let startIndex = String.Index(utf16Offset: index, in: rna)
            let endIndex = String.Index(utf16Offset: index + 3, in: rna)
            return String(rna[startIndex ..< endIndex])
        }

    var proteins = [String]()
    for codon in codons {
        let protein = try translationOfCodon(codon)
        if protein == "STOP" {
            break
        }
        proteins.append(protein)
    }

    return proteins
}
