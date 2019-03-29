//Solution goes in Sources

struct ListOps {

    static func append<T>(_ input: [T], _ append: [T]) -> [T] {
        var returnArray = input
        for element in append {
            returnArray.append(element)
        }
        return returnArray
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

    static func filter<T>(_ input: [T], _ filter: ((T) -> Bool)) -> [T] {
        var returnArray = [T]()
        for element in input {
            if filter(element) {
                returnArray.append(element)
            }
        }

        return returnArray
    }

    static func length<T>(_ input: [T]) -> Int {
        return input.count
    }

    static func map<T>(_ input: [T], _ map: ((T) -> T)) -> [T] {
        var returnArray = [T]()
        for element in input {
            returnArray.append(map(element))
        }

        return returnArray
    }

    static func foldLeft<T>(_ input: [T], accumulated: T, combine: (T, T) -> T) -> T {
        return accumulated
    }

    static func foldRight<T>(_ input: [T], accumulated: T, combine: (T, T) -> T) -> T {
        return accumulated
    }

    static func reverse<T>(_ input: [T]) -> [T] {
        var returnArray = [T]()
        for element in input.reversed() {
            returnArray.append(element)
        }

        return returnArray
    }

}
