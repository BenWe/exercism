export default class ArmstrongNumbers {

    // Logic

    static isArmstrongNumber(number: number): boolean {
        let numberAsString = number.toString();
        let lengthOfNumber = numberAsString.length;

        var total = 0;

        for (var character of numberAsString) {
            let characterAsNumber = Number(character)
            total += Math.pow(characterAsNumber, lengthOfNumber);
        }

        return total == number;
    }

}
