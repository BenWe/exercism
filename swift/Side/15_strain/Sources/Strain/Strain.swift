extension Collection {

    func keep(_ predicate: (Element) -> Bool) -> [Element] {
        return self.mapArray(predicate, shouldAppend: true)
    }

    func discard(_ predicate: (Element) -> Bool) -> [Element] {
        return self.mapArray(predicate, shouldAppend: false)
    }

    private func mapArray(_ predicate: (Element) -> Bool, shouldAppend: Bool) -> [Element] {
        // You could also do this by just looping over self and appending the element into a returnArray
        return self.compactMap {
            return (predicate($0) == shouldAppend) ? $0 : nil
        }
    }

}
