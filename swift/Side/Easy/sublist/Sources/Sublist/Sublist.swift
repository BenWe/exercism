enum Classification {
    case equal
    case sublist
    case superlist
    case unequal
}

func classifier(listOne: [Int], listTwo: [Int]) -> Classification {
    if listOne == listTwo {
        return .equal
    }

    guard let oneFirst = listOne.first, let oneLast = listOne.last else {
        return .sublist
    }

    guard let twoFirst = listTwo.first, let twoLast = listTwo.last else {
        return .superlist
    }

    for (index, element) in listOne.enumerated() {
        if element == twoFirst {
            for (_, element) in listTwo.enumerated() {
                
            }
        }
    }


    return .unequal
}
