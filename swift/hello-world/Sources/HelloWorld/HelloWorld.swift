//Solution goes in Sources

struct HelloWorld {

    static func hello(_ string: String? = nil) -> String {
        guard let string = string else {
            return "Hello, world!"
        }

        return "Hello, \(string)"
    }

}
