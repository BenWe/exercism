enum Classification {
    case equal
    case sublist
    case superlist
    case unequal
}

func classifier(listOne: [Int], listTwo: [Int]) -> Classification {
    let listOneCount = listOne.count
    let listTwoCount = listTwo.count

    if listOneCount == listTwoCount {
        return (listOne == listTwo) ? .equal : .unequal
    } else if listOne.isEmpty {
        return .sublist
    } else if listTwo.isEmpty {
        return .superlist
    } else if listOneCount < listTwoCount {
        var listTwoSlice = ArraySlice(listTwo)

        while listTwoSlice.isEmpty == false {
            let listTwoStartsWithListOne = listTwoSlice.starts(with: listOne)
            if listTwoStartsWithListOne {
                return .sublist
            } else {
                listTwoSlice = listTwoSlice.dropFirst()
            }
        }
    } else {
        var listOneSlice = ArraySlice(listOne)

        while listOneSlice.isEmpty == false {
            let listOneStartsWithListTwo = listOneSlice.starts(with: listTwo)
            if listOneStartsWithListTwo {
                return .superlist
            } else {
                listOneSlice = listOneSlice.dropFirst()
            }
        }
    }

    return .unequal
}
