export function keep<T>(array: T[], predicate: (element: T) => Boolean): T[] {
    return mapArray(array, predicate, true)
}

export function discard<T>(array: T[], predicate: (element: T) => Boolean): T[] {
    return mapArray(array, predicate, false)
}

function mapArray<T>(array: T[], predicate: (element: T) => Boolean, shouldKeep: Boolean): T[] {
    const returnArray: T[] = []

    for (const arrayElement of array) {
        if (predicate(arrayElement) === shouldKeep) {
            returnArray.push(arrayElement)
        }
    }

    return returnArray
}