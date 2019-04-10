//Solution goes in Sources

enum TriangleKind: String {
    case equilateral = "Equilateral"
    case isosceles = "Isosceles"
    case scalene = "Scalene"
    case errorKind = "ErrorKind"
    case degenerate = "Degenerate"
}

struct Triangle {

    // MARK: - Properties

    private let a: Double
    private let b: Double
    private let c: Double

    var kind: String {
        // NOTE: To make this easier to read I decided against using self
        switch (a, b, c) {
        case _ where (a <= 0) || (b <= 0) || (c <= 0):
            return TriangleKind.errorKind.rawValue
        case _ where (a + b < c) || (c + b < a) || (a + c < b):
            return TriangleKind.errorKind.rawValue

        case _ where (a + b == c) || (c + b == a) || (a + c == b):
            return TriangleKind.degenerate.rawValue

        case _ where (a == b) && (a == c):
            return TriangleKind.equilateral.rawValue

        case _ where (a == b) || (a == c) || (b == c) :
            return TriangleKind.isosceles.rawValue

        case _ where (a != b) && (a != c):
            return TriangleKind.scalene.rawValue

        default:
            return TriangleKind.errorKind.rawValue
        }
    }

    // MARK: - Init

    init(_ a: Double, _ b: Double, _ c: Double) {
        self.a = a
        self.b = b
        self.c = c
    }

}
