func remainingMinutesInOven(elapsedMinutes: Int, expectedMinutesInOven: Int = 40) -> Int {
    return expectedMinutesInOven - elapsedMinutes
}

func preparationTimeInMinutes(layers: String...) -> Int {
    return layers.count * 2
}

func quantities(layers: String...) -> (noodles: Int, sauce: Double) {
    return (noodles: layers.filter { $0 == "noodles" }.count * 3,
            sauce: Double(layers.filter { $0 == "sauce" }.count) * 0.2)
}

func toOz(_ amount: inout (noodles: Int, sauce: Double)) {
    amount.sauce *= 33.814
}

func redWine(layers: String...) -> Bool {
    return layers.filter({ ["sauce", "meat"].contains($0) }).count >
           layers.filter({ ["mozzarella", "ricotta", "béchamel"].contains($0) }).count
}
