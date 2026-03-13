// The Swift Programming Language
// https://docs.swift.org/swift-book


/// Parameter:
/// - board: The 2D grid to display.
func printBoard(_ board: [[String]]){
    print(board)
}

@main
struct SwiftPlayground {
    static func main() {
        let size = 6
var ocean = Array(repeating: Array(repeating: "~", count: size), count: size)
var guesses = Array(repeating: Array(repeating: "~", count: size), count: size)

printBoard(ocean)
    }
}
