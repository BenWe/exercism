//Solution goes in Sources

struct Raindrops {

    let drop: Int

    var sounds: String {
        let pling = (self.drop % 3 == 0) ? "Pling" : ""
        let plang = (self.drop % 5 == 0) ? "Plang" : ""
        let plong = (self.drop % 7 == 0) ? "Plong" : ""

        let joined = [pling, plang, plong].joined()

        if joined.isEmpty {
            return "\(self.drop)"
        } else {
            return joined
        }
    }

    init(_ drop: Int) {
        self.drop = drop
    }

}
