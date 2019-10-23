let alphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]

func makeDiamond(letter: String) -> [String] {
    func halfDiamond(from: Int, through: Int, by: Int, index: Int) -> [String] {
        return stride(from: from, through: through, by: by)
            .compactMap { iteration in
                let sideWhiteSpace = String(repeating: " ", count: index - iteration)
                let character = alphabet[iteration]

                if iteration == 0 {
                    return sideWhiteSpace + character + sideWhiteSpace
                } else {
                    let middleWhiteSpace = String(repeating: " ", count: (iteration * 2) - 1)
                    return sideWhiteSpace + character + middleWhiteSpace + character + sideWhiteSpace
                }
        }
    }

    guard let index = alphabet.index(of: letter) else {
        fatalError("Impossible diamond")
    }

    return halfDiamond(from: 0, through: index, by: 1, index: index) + halfDiamond(from: index - 1, through: 0, by: -1, index: index)
}
