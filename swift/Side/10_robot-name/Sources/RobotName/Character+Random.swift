extension Character {
    static func randomUppercasedLetter() -> Character {
        let allChars: [Character] = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
        return allChars.randomElement()! // NOTE: We can safely force unwrap here since we are making sure the array is not empty
    }

}
