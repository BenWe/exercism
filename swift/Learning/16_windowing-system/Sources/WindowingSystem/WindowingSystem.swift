struct Position {
    var x = 0
    var y = 0

    var description: String {
        return "(\(x), \(y))"
    }

    mutating func moveTo(newX: Int, newY: Int) {
        x = newX
        y = newY
    }
}

struct Size {
    var width = 80
    var height = 60

    var description: String {
        return "(\(width) x \(height))"
    }

    mutating func resize(newWidth: Int, newHeight: Int) {
        width = newWidth
        height = newHeight
    }
}

class Window {
    var title = "New Window"
    var contents: String?

    let screenSize = Size(width: 800, height: 600)
    var size = Size()

    var position = Position()

    init() { }

    init(size: Size, position: Position, title: String, contents: String?) {
        self.resize(to: size)
        self.move(to: position)
        self.update(title: title)
        self.update(text: contents)
    }

    func resize(to: Size) {
        let newWidth = max(to.width, 1)
        let newHeight = max(to.height, 1)
        
        size.resize(newWidth: newWidth > screenSize.width ? abs(screenSize.width - position.x) : newWidth,
                    newHeight: newHeight > screenSize.height ? abs(screenSize.height - position.y) : newHeight)
    }

    func move(to: Position) {
        let newX = max(to.x, 0)
        let newY = max(to.y, 0)

        position.moveTo(newX: newX + size.width > screenSize.width ? abs(screenSize.width - size.width) : newX,
                        newY: newY + size.height > screenSize.height ? abs(screenSize.height - size.height) : newY)
    }

    func update(title: String) {
        self.title = title
    }

    func update(text: String?) {
        contents = text
    }

    func display() -> String {
        return "\(title)\nPosition: \(position.description), Size: \(size.description)\n\(contents ?? "[This window intentionally left blank]")\n"
    }
}

let mainWindow = Window(size: Size(width: 400, height: 300), position: Position(x: 100, y: 100), title: "Main Window", contents: "This is the main window")
