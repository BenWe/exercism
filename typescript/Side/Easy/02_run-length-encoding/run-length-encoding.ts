export default class RunLengthEncoding {

    // Logic

    static encode(text: string): string {
        let returnString = ""
        let lastChar = ""
        let currentCount = 1

        for (const character of text) {
            if (character === lastChar) {
                currentCount++
            } else {
                returnString += (currentCount === 1) ? lastChar : (currentCount + lastChar)
                currentCount = 1
            }

            lastChar = character
        }

        returnString += (currentCount === 1) ? lastChar : (currentCount + lastChar)
        return returnString
    }

    static decode(text: string): string {
        let returnString = ""
        let numberString = ""

        for (const character of text) {
            if (!isNaN(parseFloat(character))) {
                numberString = numberString + character
            } else if (numberString !== "") {
                const amountOfTimesToPrint = Number(numberString)
                for (let i = 0; i < amountOfTimesToPrint; i++) {
                    returnString += character
                }
                numberString = ""
            } else {
                returnString += character
            }

        }

        return returnString
    }

}
