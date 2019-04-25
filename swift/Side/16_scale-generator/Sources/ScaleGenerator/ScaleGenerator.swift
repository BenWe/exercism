import Foundation

struct ScaleGenerator {

    // MARK: - Types

    private enum Key: Character {
        case minor = "m"
        case major = "M"
        case augmented = "A"

        var step: Int {
            switch self {
            case .minor:
                return 1
            case .major:
                return 2
            case .augmented:
                return 3
            }
        }
    }

    // MARK: - Constants

    private static let sharpScale = ["C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"]
    private static let flatScale = ["C", "Db", "D", "Eb", "E", "F", "Gb", "G", "Ab", "A", "Bb", "B"]
    private static let flatKeys = ["F", "Bb", "Eb", "Ab", "Db", "Gb", "d", "g", "c", "f", "bb", "eb"]

    // MARK: - Properties

    var name: String {
        return self.generateName()
    }

    private let tonic: String
    private let scaleName: String
    private let pattern: String

    // MARK: - Init

    init(tonic: String, scaleName: String, pattern: String = "") {
        self.tonic = tonic
        self.scaleName = scaleName
        self.pattern = pattern
    }

    // MARK: - Logic

    func pitches() -> [String] {
        return self.generateDiatonicScale(from: self.pattern)
    }

    private func generateDiatonicScale(from pattern: String) -> [String] {
        let pitches = self.generateChromaticPattern()

        if self.pattern.isEmpty {
            return pitches
        }

        var index = 0

        return self.pattern.map {
            let pitch = pitches[index]
            index += Key(rawValue: $0)?.step ?? 0

            return pitch
        }
    }

    private func generateChromaticPattern() -> [String] {
        if ScaleGenerator.flatKeys.contains(self.tonic) {
            return self.generateChomaticPattern(pitches: ScaleGenerator.flatScale)
        } else {
            return self.generateChomaticPattern(pitches: ScaleGenerator.sharpScale)
        }
    }

    private func generateChomaticPattern(pitches: [String]) -> [String] {
        let capitalizedTonic = NSString(string: tonic).capitalized

        var returnArray = [String]()
        var pitch = capitalizedTonic

        guard var startIndex = pitches.index(of: capitalizedTonic) else {
            return returnArray
        }

        repeat {
            startIndex = (startIndex == pitches.count - 1) ? 0 : startIndex + 1
            returnArray.append(pitch)
            pitch = pitches[startIndex]
        } while pitch != capitalizedTonic

        return returnArray
    }

    private func generateName() -> String {
        return self.tonic.uppercased() + " " + self.scaleName
    }

}
