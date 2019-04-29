class RotationalCipher {

    // Constants

    private static lowercaseCharacters = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    private static uppercaseCharacters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]

    // Logic

    static rotate(text: string, rotation: number): string {
        let returnString = ""

        for (const character of text) {
            returnString += RotationalCipher.getRotatedCharacter(character, rotation)
        }

        return returnString
    }

    private static getRotatedCharacter(base: string, rotation: number): string {
        let arrayToLookup: string[]

        if (RotationalCipher.lowercaseCharacters.includes(base)) {
            arrayToLookup = RotationalCipher.lowercaseCharacters
        } else if (RotationalCipher.uppercaseCharacters.includes(base)) {
            arrayToLookup = RotationalCipher.uppercaseCharacters
        } else {
            return base
        }

        const indexOfChar = arrayToLookup.indexOf(base)
        const newIndex = (indexOfChar + rotation >= 26) ? (indexOfChar + rotation) - 26 : indexOfChar + rotation
        const rotatedChar = arrayToLookup[newIndex]

        return rotatedChar
    }

}

export default RotationalCipher