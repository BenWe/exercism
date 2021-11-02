func canIBuy(vehicle: String, price: Double, monthlyBudget: Double) -> String {
    let monthlyPrice = (price / 12.0 / 5.0).rounded()
    switch monthlyPrice {
        case 0 ..< monthlyBudget:
            return "Yes! I'm getting a \(vehicle)"
        case monthlyBudget ..< monthlyBudget + 10:
            return "I'll have to be frugal if I want a \(vehicle)"
        default:
            return "Darn! No \(vehicle) for me"
    }
}

func licenseType(numberOfWheels wheels: Int) -> String {
    switch wheels {
        case 2 ... 3:
            return "You will need a motorcycle license for your vehicle"
        case 4 ... 6:
            return "You will need an automobile license for your vehicle"
        case 18:
            return "You will need a commercial trucking license for your vehicle"
        default:
            return "We do not issue licenses for those types of vehicles"
    }
}

func registrationFee(msrp: Int, yearsOld: Int) -> Int {
    guard yearsOld < 10 else {
        return 25
    }

    let price = max(msrp, 25_000)
    return (price - (price / 10) * yearsOld) / 100
}
