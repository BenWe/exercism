let hours = 8
let days = 22.0

func dailyRateFrom(hourlyRate: Int) -> Double {
    return Double(hourlyRate * hours)
}

func monthlyRateFrom(hourlyRate: Int, withDiscount discount: Double) -> Double {
    let dailyRate = dailyRateFrom(hourlyRate: hourlyRate)
    let monthlyRate = (dailyRate * days).discounted(by: discount)
    return monthlyRate.rounded()
}

func workdaysIn(budget: Double, hourlyRate: Int, withDiscount discount: Double) -> Double {
    let dailyDiscounted = dailyRateFrom(hourlyRate: hourlyRate).discounted(by: discount)
    return (budget / dailyDiscounted).rounded(.down)
}

extension Double {
    func discounted(by discount: Double) -> Self {
        return self * (1.0 - (discount / 100))
    }
}
