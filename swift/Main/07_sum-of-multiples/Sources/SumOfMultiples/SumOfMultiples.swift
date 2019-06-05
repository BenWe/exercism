struct SumOfMultiples {

    static func toLimit(_ limit: Int, inMultiples multiples: [Int]) -> Int {
        if limit == 0 {
            return 0
        }

        var localMultiples = multiples
        if let index = localMultiples.index(of: 0) {
            localMultiples.remove(at: index)
        }

        var set = Set<Int>()
        for i in 1 ..< limit {
            for multiple in localMultiples {
                if i % multiple == 0 {
                    set.insert(i)
                }
            }
        }

        return set.reduce(0, +)
    }

}
