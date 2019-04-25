struct Sieve {

    // MARK: - Properties

    private let limit: Int

    var primes: [Int] {
        return self.calculatePrimes()
    }

    // MARK: - Init

    init(_ number: Int) {
        self.limit = number
    }

    // MARK: - Logic

    private func calculatePrimes() -> [Int] {
        var dict = [Int: Bool]()

        for iteration in stride(from: 2, to: self.limit, by: 1) {
            if dict[iteration] == nil {
                dict[iteration] = true
                for j in stride(from: iteration * iteration, to: self.limit, by: iteration) {
                    dict[j] = false
                }
            }
        }

        return dict.compactMap {
            return ($0.value == true) ? $0.key : nil
        }.sorted()
    }

}
