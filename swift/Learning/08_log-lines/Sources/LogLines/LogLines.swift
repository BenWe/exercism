enum LogLevel: Int {
    case trace = 0
    case debug = 1
    case info = 4
    case warning = 5
    case error = 6
    case fatal = 7
    case unknown = 42

    init(_ string: String) {
        switch string[string.startIndex ... string.index(string.startIndex, offsetBy: 4)] {
            case "[TRC]":
                self = .trace
            case "[DBG]":
                self = .debug
            case "[INF]":
                self = .info
            case "[WRN]":
                self = .warning
            case "[ERR]":
                self = .error
            case "[FTL]":
                self = .fatal
            default:
                self = .unknown
        }
    }

    func shortFormat(message: String) -> String {
        return "\(rawValue):\(message)"
    }
}
