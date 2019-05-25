final class Squares {

    // MARK: - Properties

    private let number: Int

    lazy var squareOfSum: Int = {
        let reducedSum = (0 ... self.number).reduce(0, +)
        return reducedSum * reducedSum
    }()

    lazy var sumOfSquares: Int = {
        return (0 ... self.number).reduce(0, { $0 + $1 * $1 })
    }()

    lazy var differenceOfSquares: Int = {
        return self.squareOfSum - self.sumOfSquares
    }()

    // MARK: - Init

    init(_ side: Int) {
        self.number = side
    }

}
