//Solution goes in Sources

class GradeSchool {

    // MARK: - Types

    typealias Name = String
    typealias Grade = Int

    // MARK: - Properties

    var roster: [Grade: [Name]] {
        return self._roster
    }

    var sortedRoster: [Grade: [Name]] {
        return self.roster.mapValues { $0.sorted() }
    }

    private var _roster: [Grade: [Name]]

    // MARK: - Init

    init() {
        self._roster = [Grade: [Name]]()
    }

    // MARK: - Object Logic

    func addStudent(_ name: Name, grade: Grade) {
        if self._roster[grade] == nil {
            self._roster[grade] = [Name]()
        }
        
        self._roster[grade]?.append(name)
    }

    func studentsInGrade(_ grade: Grade) -> [Name] {
        return self._roster[grade] ?? [Name]()
    }

}
