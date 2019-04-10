//Solution goes in Sources

enum Plant: String {
    case grass = "G"
    case clover = "C"
    case radishes = "R"
    case violets = "V"
}

struct Garden {

    // MARK: - Types

    private static let defaultChildren = ["Alice", "Bob", "Charlie", "David", "Eve", "Fred", "Ginny", "Harriet", "Ileana", "Joseph", "Kincaid", "Larry"]

    // MARK: - Properties

    var children: [String]

    private var upperRow: String
    private var lowerRow: String

    // MARK: - Init

    init(_ plants: String, children: [String] = Garden.defaultChildren) {
        self.children = children.sorted()

        let splitPlants = plants.split(separator: "\n")
        self.upperRow = String(splitPlants[0])
        self.lowerRow = String(splitPlants[1])
    }

    // MARK: - Object Logic

    func plantsForChild(_ child: String) -> [Plant] {
        guard let position = self.children.firstIndex(of: child) else {
            return [Plant]()
        }

        return self.plantsForPosition(position)
    }

    private func plantsForPosition(_ position: Int) -> [Plant] {
        let startIndex = String.Index(encodedOffset: (position * 2))
        let endIndex = String.Index(encodedOffset: (position * 2) + 2)

        let upperPlants = String(self.upperRow[startIndex..<endIndex])
        let lowerPlants = String(self.lowerRow[startIndex..<endIndex])

        let asPlants = (upperPlants + lowerPlants).compactMap { Plant(rawValue: String($0)) }

        return asPlants
    }

}
