struct SecretHandshake {

    // MARK: - Properties

    let commands: [String]

    // MARK: - Init

    init(_ number: Int) {
        var codes = [String]()

        if (number & 0b1 != 0) {
            codes.append("wink")
        }

        if (number & 0b10 != 0) {
            codes.append("double blink")
        }

        if (number & 0b100 != 0) {
            codes.append("close your eyes")
        }

        if (number & 0b1000 != 0) {
            codes.append("jump")
        }

        if (number & 0b10000 != 0) {
            codes.reverse()
        }

        self.commands = codes
    }

}
