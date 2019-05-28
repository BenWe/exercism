enum BinarySearchError: Error {
    case unsorted
}

struct BinarySearch {

    // MARK: - Properties

    var list: [Int]

    var middle: Int {
        return self.list.count / 2
    }

    // MARK: - Init

    init(_ array: [Int]) throws {
        let sorted = array.sorted()

        if sorted != array {
            throw BinarySearchError.unsorted
        }

        self.list = sorted
    }

    // MARK: - Logic

    func searchFor(_ target: Int) -> Int? {
        let array = self.list
        var lhs = 0
        var rhs = self.list.count - 1

        while lhs <= rhs {
            let middleElement = (lhs + rhs) / 2

            if array[middleElement] < target {
                lhs = middleElement + 1
            } else if array[middleElement] > target {
                rhs = middleElement - 1
            } else {
                return middleElement
            }
        }

        return nil
    }

}
