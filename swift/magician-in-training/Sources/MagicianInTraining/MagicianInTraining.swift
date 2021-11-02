func getCard(at index: Int, from stack: [Int]) -> Int {
    return stack[index]
}

func setCard(at index: Int, in stack: [Int], to newCard: Int) -> [Int] {
    return setRemovableCard(at: index, in: stack, to: newCard)
}

private func setRemovableCard(at index: Int, in stack: [Int], to newCard: Int?) -> [Int] {
    var returnValue = stack
    if (index > 0) && (index < stack.count) {
        if let card = newCard {
            returnValue[index] = card
        } else {
            returnValue.remove(at: index)
        }
    }
    return returnValue
}

func insert(_ newCard: Int, atTopOf stack: [Int]) -> [Int] {
    return stack + [newCard]
}

func removeCard(at index: Int, from stack: [Int]) -> [Int] {
    return setRemovableCard(at: index, in: stack, to: nil)
}

func removeTopCard(_ stack: [Int]) -> [Int] {
    return Array(stack.dropLast())
}

func insert(_ newCard: Int, atBottomOf stack: [Int]) -> [Int] {
    return [newCard] + stack
}

func removeBottomCard(_ stack: [Int]) -> [Int] {
    return Array(stack.dropFirst())
}

func checkSizeOfStack(_ stack: [Int], _ size: Int) -> Bool {
    return stack.count == size
}

func evenCardCount(_ stack: [Int]) -> Int {
    return stack.reduce(0) { $0 + ($1 % 2 != 0 ? 0 : 1) }
}
