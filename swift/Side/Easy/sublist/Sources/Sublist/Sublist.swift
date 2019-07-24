enum Classification {
    case equal
    case sublist
    case superlist
    case unequal
}

func classifier(listOne: [Int], listTwo: [Int]) -> Classification {
    func getAllElements(from: [Int], in another: [Int]) -> [Int] {
        return from.compactMap { return another.contains($0) ? $0 : nil }
    }

    func isSublist(one: [Int], two: [Int]) -> Bool {
        for pair in  {

        }

        return true
    }

    if listOne == listTwo {
        return .equal
    }

    let filteredOne = getAllElements(from: listOne, in: listTwo)
    let filteredTwo = getAllElements(from: listTwo, in: listOne)

    let zipper = zip(filteredOne, filteredTwo)
    for pair in zipper {
        if pair.0 != pair.1 {
            return .unequal
        }
    }

    return .sublist
}
