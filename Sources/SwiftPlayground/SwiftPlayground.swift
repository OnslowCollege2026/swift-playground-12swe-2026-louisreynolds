// The Swift Programming Language
// https://docs.swift.org/swift-book


func print(board: [[String]]) {
board.forEach { line in
print("\(line[0]) | \(line[1]) | \(line[2])")
print("--+---+---")
}
print()
}

func askForPosition(board: [[String]]) -> [Int] {
    while true {
    print("Please enter the row number 1-3: ")
    let userImput = readLine()!
    let rowNumber = Int(userImput)! - 1

    print("Please enter the colum number 1-3: ")
    let userImput2 = readLine()!
    let columNumber = Int(userImput2)! - 1

    if board[rowNumber][columNumber] == "." {
        return [rowNumber, columNumber]
    }
}
}

@main
struct SwiftPlayground {
    static func main() {
var board = [
    [".", ".", "."], // row 0
    [".", ".", "."], // row 1
    [".", ".", "."] // row 2
]
print(board: board)

while true {
    //ask for user imput
    let position = askForPosition(board: board)
    board[position[0]][position[1]] = player
}

// // First move O in middle.
// board[1][1] = "O"
// print(board:board)

// // Second move X in top left
// board[0][0] = "X"
// print(board:board)

// // Third move O in top right
// board[0][2] = "O"
// print(board:board)

// // Forth move X in bottom left
// board[2][0] = "X"
// print(board:board)

// // Fifth move O in middle left
// board[1][0] = "O"
// print(board:board)

// // Sixth move X in middle right
// board[1][2] = "X"
// print(board:board)

// // Seventh move O in bottom middle
// board[2][1] = "O"
// print(board:board)

// // eighth move X in bottom right
// board[2][2] = "X"
// print(board:board)

// // Second move O in top middle
// board[0][1] = "O"
// print(board:board)
//     }
// }
    }
}