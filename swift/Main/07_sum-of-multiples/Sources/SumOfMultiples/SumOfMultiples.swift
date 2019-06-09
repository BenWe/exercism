func toLimit(_ limit: Int, inMultiples multiples: [Int]) -> Int {
    guard limit != 0 else {
        return 0
    }

    let filteredMultiples = multiples.filter { $0 != 0 }
    return (1 ..< limit).compactMap { index in
        for multiple in filteredMultiples {
            if index.isMultiple(of: multiple) {
                return index
            }
        }
        return nil
    }.reduce(0, +)
}
