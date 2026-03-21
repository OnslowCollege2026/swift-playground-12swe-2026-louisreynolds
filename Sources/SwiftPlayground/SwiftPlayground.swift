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
        print("\n Hit!")
        updatedGuesses[row][col] = "X"
        return updatedGuesses
    } else {
        print("\n Miss!")
        updatedGuesses[row][col] = "0"
        return updatedGuesses
    }
}

/// Parameters:
/// - ocean: The hidden ships grid.
/// - guesses: The player's current guesses grid.
///
/// Returns: How many ships remain unhit.
func shipsRemaining(ocean: [[String]], guesses: [[String]]) -> Int {
    var shipCount = 0
    for row in 0..<ocean.count {
        for col in 0..<ocean[row].count {
            if ocean[row][col] == "S" {
                shipCount += 1
            }
        }
    }

    var hitCount = 0
    for row in 0..<guesses.count {
        for col in 0..<guesses[row].count {
            if guesses[row][col] == "X" {
                hitCount += 1
            }
        }
    }
    return shipCount - hitCount
}

@main
struct SwiftPlayground {
    static func main() {
        let size = 6
        let maximumGuesses = 10
        // subtract 1 from row and column guesses as 2D arrays start at 0
        let turnGuessInto2DArrayCall = 1
        let amountOfShips = 4

        // creates hidden board with the battleships on it
        var ocean = Array(repeating: Array(repeating: "~", count: size), count: size)
        //create board that player is guessing on
        var guesses = Array(repeating: Array(repeating: "~", count: size), count: size)

        //randomly picks the position of the ships
        var shipsPlaced = 0

        while shipsPlaced < amountOfShips {
            let row = Int.random(in: 0...size - 1)
            let col = Int.random(in: 0...size - 1)

            if ocean[row][col] != "S" {
                ocean[row][col] = "S"
                shipsPlaced += 1
            }
        }

        print(
            """
            This is battle ships. You will be asked to guess where the battle ship are on the grid.
            '~' means open sea
            'X' means hit
            '0' means miss
            You have \(maximumGuesses) guesses to find the \(amountOfShips) ships
            Good luck! 

            """)
        printBoard(guesses)

        var progress = 0

        while progress < maximumGuesses {

            print("Please guess a row number 1-\(size)")
            let row = guessValidator(size: size) - turnGuessInto2DArrayCall

            print("Please guess a column number 1-\(size)")
            let column = guessValidator(size: size) - turnGuessInto2DArrayCall

            let oldGeusses = guesses
            let newGuesses = processGuess(row: row, col: column, ocean: ocean, guesses: guesses)

            printBoard(newGuesses)

            //worksout the number of ships left on the grid
            let shipsLeft = shipsRemaining(ocean: ocean, guesses: newGuesses)

            // Only go to the next move if the guesses board was updated (i.e. a valid guess).
            if oldGeusses != newGuesses {
                progress += 1
                guesses = newGuesses
            }

            //checks if player has won the game before using all their guesses
            if shipsRemaining(ocean: ocean, guesses: guesses) == 0 {
                break
            }

            print("There are \(shipsLeft) ships remaining.")
            print("You have \(maximumGuesses - progress) guesses left. \n")
        }

        // worksout if player wins or loses
        if shipsRemaining(ocean: ocean, guesses: guesses) != 0 {
            print(
                """

                You didn't find all the battleships. 
                You lose!
                """)
        } else {
            print(
                """

                You found all the battleships. 
                You win!
                """)
        }
    }
}
