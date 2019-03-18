//Solution goes in Sources

struct Year {

    // MARK: - Properties

    let calendarYear: Int
    let isLeapYear: Bool

    // MARK: - Init

    init(calendarYear: Int) {
        self.calendarYear = calendarYear

        let isDivisibleByFour = self.calendarYear % 4 == 0
        let isDivisibleByOneHundred = self.calendarYear % 100 == 0
        let isDivisilbeByFourHundred = self.calendarYear % 400 == 0

        self.isLeapYear = isDivisibleByFour && !isDivisibleByOneHundred || isDivisilbeByFourHundred
    }

}
