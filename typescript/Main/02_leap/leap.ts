function isLeapYear(year: number) {
    const isDivisibleByFour = year % 4 === 0
    const isDivisibleByOneHundred = year % 100 === 0
    const isDivisilbeByFourHundred = year % 400 === 0

    return isDivisibleByFour && !isDivisibleByOneHundred || isDivisilbeByFourHundred
}

export default isLeapYear