struct SpaceAge {

    // MARK: - Properties

    let seconds: Double

    var onEarth: Double {
        return self.seconds / 365.25 / 24 / 60 / 60
    }

    var onMercury: Double {
        return self.onEarth / 0.2408467
    }

    var onVenus: Double {
        return self.onEarth / 0.61519726
    }

    var onMars: Double {
        return self.onEarth / 1.8808158
    }

    var onJupiter: Double {
        return self.onEarth / 11.862615
    }

    var onSaturn: Double {
        return self.onEarth / 29.447498
    }

    var onUranus: Double {
        return self.onEarth / 84.016846
    }

    var onNeptune: Double {
        return self.onEarth / 164.79132
    }

    // MARK: - Init

    init(_ age: Double) {
        self.seconds = age
    }
}
