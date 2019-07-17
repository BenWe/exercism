// MARK: - Logic

func compute(_ strandOne: String, against strandTwo: String) -> Int? {
    guard strandOne.count == strandTwo.count else {
        return nil
    }

    return zip(strandOne, strandTwo)
        .filter { $0 != $1 }
        .count
}
