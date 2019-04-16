export default class RunLengthEncoding {

    // Logic

    static encode(string: string): string {
        if (string.length == 0) {
            return ""; 
        }

        var returnString = "";
        var lastChar = "";
        var currentCount = 1;

        for (var character of string) {
            console.log(`Checking char at: ${character}`);
            if (lastChar == "") {
                console.log(`Last char is empty. setting to ${character}`);
                lastChar = character;
                continue;
            }

            if (character == lastChar) {
                console.log(`char and lastChar are the same. Increasing iteration count.`);
                lastChar = character,
                currentCount++;
            } else {
                console.log(`char and lastChar are different.`);
                if (currentCount == 1) {
                    returnString.concat(lastChar); 
                } else {
                    returnString.concat(currentCount + lastChar)
                }

                console.log(`End of iteration. ReturnString: ${returnString}`);
                lastChar = character;
                currentCount = 1;
            }
        }

        return returnString;
    }

    static decode(string: string): string {
        if (string.length == 0) {
            return ""; 
        }

        return string
    }

}
