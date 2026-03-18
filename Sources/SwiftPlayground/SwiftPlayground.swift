// The Swift Programming Language
// https://docs.swift.org/swift-book

/// - board: The 2D grid to display.
func printBoard(_ board: [[String]]) {
    for line in board {
        print(line.joined(separator: " | "))
    }
}
/// tests to see that the row or column number put in is valid 
/// parameter:
/// size - size of the grid
/// returns the valid row or column number
func guessValidator(size: Int) -> Int {
    while true {
        let userImput = readLine()!
        if let userGuess = Int(userImput), userGuess >= 1, userGuess <= size {
            return userGuess
        } else {
            print("Please try enter a valid number between 1 and \(size)")
        }
    }

}

/// Parameters:
/// - row: The row index for the guess.
/// - col: The column index for the guess.
/// - ocean: The hidden ships grid.
/// - guesses: The player's current guesses grid.
///
/// Returns: The updated guesses grid after the guess is applied.
func processGuess(row: Int, col: Int, ocean: [[String]], guesses: [[String]]) -> [[String]] {
    var updatedGuesses = guesses 

    if guesses[row][col] != "~" {
        print("You have already guesses that spot. Please guess a different spot.")
        return updatedGuesses
    }

    if ocean[row][col] == "S" {
        print("Hit!")
        updatedGuesses[row][col] = "X"
        return updatedGuesses
    } else {
        print("Miss!")
        updatedGuesses[row][col] = "0"
        return updatedGuesses
    }
    }
    

@main
struct SwiftPlayground {
    static func main() {
        let size = 6
        let maximumGuesses = 5
        // subtract 1 from row and column guesses as 2D arrays start at 0
        let turnGuessInto2DArrayCall = 1

        // creates hidden board with the battleships on it 
        var ocean = Array(repeating: Array(repeating: "~", count: size), count: size)
        //create board that player is guessing on
        var guesses = Array(repeating: Array(repeating: "~", count: size), count: size)

        ocean[1][3] = "S"
        ocean[2][3] = "S"
        ocean[4][0] = "S"
        ocean[5][4] = "S"

        print(
            """
            This is battle ships. You will be asked to guess where the battle ship are on the grid.
            '~' means open sea
            'X' means hit
            '0' means miss. 
            Good luck! 
            """)
        printBoard(guesses)

var progress = 1

        while progress < maximumGuesses {
            print("Please guess a row number 1-\(size)")
            let row = guessValidator(size: size) - turnGuessInto2DArrayCall 

            print("Please guess a column number 1-\(size)")
            let column = guessValidator(size: size) - turnGuessInto2DArrayCall

            guesses = processGuess(row: row, col: column, ocean: ocean, guesses: guesses)

            printBoard(guesses)
            progress += 1
        }
    }
}

