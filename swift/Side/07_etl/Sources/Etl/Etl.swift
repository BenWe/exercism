//Solution goes in Sources

struct ETL {

    // MARK: - Logic

    static func transform(_ old: [Int : [String]]) -> [String : Int] {
        var returnArray = [String : Int]()
        old.forEach { (key: Int, value: [String]) in
            value.forEach { returnArray[$0.lowercased()] = key }
        }

        return returnArray
    }

}
