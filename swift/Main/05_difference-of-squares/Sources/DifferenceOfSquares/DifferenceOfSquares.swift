struct Squares {

    // MARK: - Properties

    let squareOfSum: Int
    let sumOfSquares: Int
    let differenceOfSquares: Int

    // MARK: - Init

    init(_ side: Int) {
        let reducedSum = (0 ... side).reduce(0, +)
        let sumOfSquares = (0 ... side).reduce(0, { $0 + $1 * $1 })
        let squareOfSum = reducedSum * reducedSum

        self.squareOfSum = squareOfSum
        self.sumOfSquares = sumOfSquares
        self.differenceOfSquares = squareOfSum - sumOfSquares
    }

}
