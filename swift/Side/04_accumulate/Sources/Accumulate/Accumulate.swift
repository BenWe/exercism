//Solution goes in Sources

extension Collection {
    func accumulate(_ input: ((Element) -> Element)) -> [Element] {
        var returnArray = [Element]()
        for element in self {
            returnArray.append(input(element))
        }
        return returnArray
    }

    func accumulate(_ input: ((Element) -> [Element])) -> [[Element]] {
        var returnArray = [[Element]]()
        for element in self {
            returnArray.append(input(element))
        }
        return returnArray
    }

}
