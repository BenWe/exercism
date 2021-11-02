func sliceSize(diameter: Double?, slices: Int?) -> Double? {
    guard let diameter = diameter, let slices = slices else { return nil }
    guard diameter >= 0, slices > 1 else { return nil }

    let radius = diameter / 2
    return Double.pi * (radius * radius) / Double(slices)
}

func biggestSlice(
  diameterA: String, slicesA: String,
  diameterB: String, slicesB: String
) -> String {
    let areaA = sliceSize(diameter: Double(diameterA), slices: Int(slicesA))
    let areaB = sliceSize(diameter: Double(diameterB), slices: Int(slicesB))

    switch (areaA, areaB) {
        case (.none, .some(_)):
            return "Slice B is bigger"
        case (.some(_), .none):
            return "Slice A is bigger"
        case (.none, .none):
            return "Neither slice is bigger"
        case (.some(let areaA), .some(let areaB)):
            if areaA == areaB { return "Neither slice is bigger" }
            return areaA > areaB ? "Slice A is bigger" : "Slice B is bigger"
    }
}
