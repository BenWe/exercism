class Robot {

    // MARK: - Properties

    var name: String

    // MARK: - Init

    init() {
        self.name = Robot.calculateName()
    }

    // MARK: - Logic

    func resetName() {
        self.name = Robot.calculateName()
    }

    private static func calculateName() -> String {
        let range = (0 ... 9)

        let first = Character.randomUppercasedLetter()
        let second = Character.randomUppercasedLetter()
        let third = Int.random(in: range)
        let fourth = Int.random(in: range)
        let fifth = Int.random(in: range)

        return "\(first)\(second)\(third)\(fourth)\(fifth)"
    }

}
