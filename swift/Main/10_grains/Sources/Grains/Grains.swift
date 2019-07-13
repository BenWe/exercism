
// MARK: - Types

enum GrainsError: Error {
    case inputTooHigh(String)
    case inputTooLow(String)

    static func errorMessage(input: Int) -> String {
        return "Input[\(input)] invalid. Input should be between \(Grains.minimum) and \(Grains.maximum) (inclusive)"
    }
}

// MARK: - Constants

private let minimum = 1
private let maximum = 64

// MARK: - Logic

var total: UInt64 {
    return UInt64.max
}

func square(_ input: Int) throws -> UInt64 {
    if input < Grains.minimum {
        throw GrainsError.inputTooLow(GrainsError.errorMessage(input: input))
    }

    if input > Grains.maximum {
        throw GrainsError.inputTooHigh(GrainsError.errorMessage(input: input))
    }

    return UInt64(1) << (input - 1)
}
