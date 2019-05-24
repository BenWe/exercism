function accumulate<T, R>(array: T[], accumulator: (element: T) => R): R[] {
    const returnArray = []

    for (const arrayElement of array) {
        returnArray.push(accumulator(arrayElement))
    }

    return returnArray
}

export default accumulate