//Solution goes in Sources

extension Collection {
    func accumulate<T>(_ input: (Element) -> T) -> [T] {
        var returnArray = [T]()
        for element in self {
            returnArray.append(input(element))
        }
        return returnArray
    }

}
