enum CollatzError: Error  {
    case generic
}

func steps(_ input: Int) throws -> Int {
    guard input > 0 else {
        throw CollatzError.generic
    }

    var input = input
    var steps = 0
    while (input > 1) {
        if input % 2 == 0 {
            input /= 2
        } else {
            input *= 3
            input += 1
        }
        steps += 1
    }
    return steps
}
