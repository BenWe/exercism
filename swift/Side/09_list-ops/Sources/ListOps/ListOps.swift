//Solution goes in Sources

struct ListOps {

    // MARK: - Append / Concat

    static func append<T>(_ input: [T], _ append: [T]) -> [T] {
        return ListOps.concat(input, append)
    }

    static func concat<T>(_ input: [T], _ concat: [T]...) -> [T] {
        var returnArray = input
        for array in concat {
            for element in array {
                returnArray.append(element)
            }
        }

        return returnArray
    }

    // MARK: - Filter

    static func filter<T>(_ input: [T], _ filter: ((T) -> Bool)) -> [T] {
        var returnArray = [T]()
        for element in input {
            if filter(element) {
                returnArray.append(element)
            }
        }

        return returnArray
    }

    // MARK: - Length

    // Note: Is this too simple?
    static func length<T>(_ input: [T]) -> Int {
        return input.count
    }

    // MARK: - Map / Fold Left / Fold Right

    static func map<T>(_ input: [T], _ map: ((T) -> T)) -> [T] {
        var returnArray = [T]()
        for element in input {
            returnArray.append(map(element))
        }

        return returnArray
    }

    static func foldLeft<T>(_ input: [T], accumulated: T, combine: (T, T) -> T) -> T {
        var returnValue = accumulated
        for element in input {
            returnValue = combine(returnValue, element)
        }

        return returnValue
    }

    static func foldRight<T>(_ input: [T], accumulated: T, combine: (T, T) -> T) -> T {
        var returnValue = accumulated
        for element in input.reversed() {
            returnValue = combine(element, returnValue)
        }

        return returnValue
    }

    // MARK: - Reverse

    static func reverse<T>(_ input: [T]) -> [T] {
        var returnArray = [T]()
        for index in stride(from: input.count - 1, through: 0, by: -1) { // Note: Could potentially just call input.reversed()
            let element = input[index]
            returnArray.append(element)
        }

        return returnArray
    }

}
