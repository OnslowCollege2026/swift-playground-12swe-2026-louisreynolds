// The Swift Programming Language
// https://docs.swift.org/swift-book


/// - board: The 2D grid to display.
func printBoard(_ board: [[String]]){
    for line in board {
print(line.joined(separator: " | " ))
    }
}

func guessValidator()

@main
struct SwiftPlayground {
    static func main() {
        let size = 6
var ocean = Array(repeating: Array(repeating: "~", count: size), count: size) 

var guesses = Array(repeating: Array(repeating: "~", count: size), count: size) 


ocean[1][3] = "S"
ocean[2][3] = "S"
ocean[4][0] = "S"
ocean[5][4] = "S"

print("""
This is battle ships. You will be asked to guess where the battle ship are on the grid.
'~' means open sea
'X' means hit
'0' means miss. 
Good luck! 
""")
printBoard(guesses)


    }
}
    
    