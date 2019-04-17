struct Queens: CustomStringConvertible {

    // MARK: - Types

    enum InitError: Error {
        case incorrectNumberOfCoordinates
        case invalidCoordinates
        case sameSpace
    }

    // MARK: - Properties

    let white: [Int]
    let black: [Int]

    var canAttack: Bool {
        return self.canAttackHorizontally() || self.canAttackVertically() || self.canAttackDiagonally()
    }

    // MARK: - Init

    init(white: [Int] = [0, 3], black: [Int] = [7, 3]) throws {
        if white.count > 2 || black.count > 2 {
            throw InitError.incorrectNumberOfCoordinates
        }

        for space in white + black {
            if space < 0 || space > 7 {
                throw InitError.invalidCoordinates
            }
        }

        if white == black {
            throw InitError.sameSpace
        }

        self.white = white
        self.black = black
    }

    // MARK: - Logic

    private func canAttackVertically() -> Bool {
        return self.white[0] == self.black[0]
    }

    private func canAttackHorizontally() -> Bool {
        return self.white[1] == self.black[1]
    }

    private func canAttackDiagonally() -> Bool {
        return abs(self.white[0] - self.white[1]) == abs(self.black[0] - self.black[1])
    }

    // MARK: - CustomStringConvertible Implementation

    var description: String {
        return self.calculateDescription()
    }

    private func calculateDescription() -> String {
        var description = ""

        let range = 0 ..< 8

        for i in range {
            for j in range {
                switch ([i, j]) {
                case self.white:
                    description.append("W ")
                case self.black:
                    description.append("B ")
                default:
                    description.append("_ ")
                }
            }
            // Remove space before newline
            description.removeLast(1)
            description.append("\n")
        }

        // Remove last newline
        description.removeLast(1)

        return description
    }

}
