extension Array where Element == String {
    func recite() -> String {
        let length = self.count

        return self
            .enumerated()
            .map { (index, element) in
                let nextIndex = index + 1
                if nextIndex == length {
                    return "And all for the want of a \(self[0])."
                } else {
                    return "For want of a \(element) the \(self[nextIndex]) was lost."
                }
            }
            .joined(separator: "\n")
    }
}
