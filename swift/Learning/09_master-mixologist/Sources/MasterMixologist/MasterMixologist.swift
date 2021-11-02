func timeToPrepare(drinks: [String]) -> Double {
    return drinks.reduce(0) { $0 + convertDrinkToPreparationTime($1) }
}

private func convertDrinkToPreparationTime(_ drink: String) -> Double {
    switch drink {
        case "beer", "soda", "water":
            return 0.5
        case "shot":
            return 1.0
        case "mixed drink":
            return 1.5
        case "fancy drink":
            return 2.5
        case "frozen drink":
            return 3.0
        default:
            return 0
    }
}

func makeWedges(needed: Int, limes: [String]) -> Int {
    var result = 0, slices = 0
    for lime in limes {
        if slices >= needed {
            break
        } else {
            result += 1
            switch lime {
                case "small":
                    slices += 6
                case "medium":
                    slices += 8
                case "large":
                    slices += 10
                default:
                    slices += 0
            }
        }
    }
    return result
}

func finishShift(minutesLeft: Int, remainingOrders: [[String]]) -> [[String]] {
    var orders = remainingOrders
    var minutes = Double(minutesLeft)
    while !orders.isEmpty {
        minutes -= timeToPrepare(drinks: orders.removeFirst())
        if minutes <= 0 { break }
    }
    return orders
}

func orderTracker(orders: [(drink: String, time: String)]) -> (
  beer: (first: String, last: String, total: Int)?, soda: (first: String, last: String, total: Int)?
) {
    var firstBeer = "", lastBeer = "", firstSoda = "", lastSoda = ""
    var totalBeers = 0, totalSodas = 0
    for order in orders {
        if order.drink == "beer" {
            totalBeers += 1
            lastBeer = order.time
            if firstBeer == "" { firstBeer = order.time }
        } else if order.drink == "soda" {
            totalSodas += 1
            lastSoda = order.time
            if firstSoda == "" { firstSoda = order.time }
        } else {
            continue
        }
    }
    return (beer: totalBeers != 0 ? (first: firstBeer, last: lastBeer, total: totalBeers) : nil,
           soda: totalSodas != 0 ? (first: firstSoda, last: lastSoda, total: totalSodas) : nil)
}
