//Solution goes in Sources

struct House {

    static let things = ["the house that Jack built.", "the malt", "the rat", "the cat", "the dog", "the cow with the crumpled horn", "the maiden all forlorn", "the man all tattered and torn", "the priest all shaven and shorn", "the rooster that crowed in the morn", "the farmer sowing his corn", "the horse and the hound and the horn"]
    static let verbs = ["lay in", "ate", "killed", "worried", "tossed", "milked", "kissed", "married", "woke", "kept", "belonged to"]

    static func recite() -> String {
        var returnString = ""

        let allThings = House.things
        let allVerbs = House.verbs

        for index in stride(from: 0, to: allThings.count, by: 1) {

            for (index, repeatedIndex) in stride(from: index, through: 0, by: -1).enumerated() {
                let thing = allThings[repeatedIndex]

                if index == 0 {
                    returnString.append(reciteLine(beginning: "This is ", thing: thing, verb: nil))
                } else {
                    let verb = allVerbs[repeatedIndex]
                    returnString.append(reciteLine(beginning: "that ", thing: thing, verb: verb))
                }

            }
            returnString.append("\n")
        }

        // Remove the last new lines
        returnString.removeSubrange(Range<String.Index>(uncheckedBounds: (lower: String.Index(encodedOffset: returnString.endIndex.encodedOffset - 2),
                                                                          upper: returnString.endIndex)))

        return returnString
    }

    private static func reciteLine(beginning: String, thing: String, verb: String?) -> String {
        guard let verb = verb else { // Beginning of rhyme
            return "This is \(thing)\n"
        }

        return "that \(verb) \(thing)\n"
    }

}
