// MARK: - Logic

func compute(_ strandOne: String, against strandTwo: String) -> Int? {
    let length = strandOne.count
    guard length == strandTwo.count else {
        return nil
    }

    return (0 ..< length).filter { index in
        let strandOneIndex = String.Index(utf16Offset: index, in: strandOne)
        let strandTwoIndex = String.Index(utf16Offset: index, in: strandTwo)
        let strandOneChar = strandOne[strandOneIndex]
        let strandTwoChar = strandTwo[strandTwoIndex]
        return strandOneChar != strandTwoChar
    }.count
}
