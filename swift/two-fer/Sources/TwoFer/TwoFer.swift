//Solution goes in Sources

struct TwoFer {

    static func twoFer(name: String? = nil) -> String {
    	guard let string = name else {
    		return "One for you, one for me."
    	}

    	return "One for \(string), one for me."
    }

}
