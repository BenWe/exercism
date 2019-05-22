struct NumberClassifier {

    // MARK: - Types

    enum classification {
        case perfect
        case deficient
        case abundant
    }

    // MARK: - Properties

    let classification: NumberClassifier.classification

    // MARK: - Init

    init(number: Int) {
        let divisors = (1 ..< number ).filter { number % $0 == 0 }
        let aliquotSum = divisors.reduce(0, +)

        switch aliquotSum {
        case _ where aliquotSum > number:
            self.classification = .abundant
        case _ where aliquotSum < number:
            self.classification = .deficient
        default:
            self.classification = .perfect
        }
    }

}
