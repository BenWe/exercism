function isLeapYear(year: number) {
    let isDivisibleByFour = year % 4 == 0
    let isDivisibleByOneHundred = year % 100 == 0
    let isDivisilbeByFourHundred = year % 400 == 0

    return isDivisibleByFour && !isDivisibleByOneHundred || isDivisilbeByFourHundred
}

export default isLeapYear