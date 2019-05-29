func flattenArray<T>(_ array: [Any?]) -> [T] {
    var returnArray = [T]()

    for element in array {
        if let isArray = element as? [Any?] {
            returnArray += flattenArray(isArray)
        } else if let asT = element as? T {
            returnArray.append(asT)
        }
    }

    return returnArray
}
