
///prints the main menu and asks for a responce determining the part of the program it goes to next
/// returns a number 1 to 6 
func menuChoice() -> Int {
    print(
        """

        === Kumara shop Shop ===
        1. Add kumara to stock
        2. Sell kumara
        3. Show current stock
        4. Show sales record
        5. Show summary information
        6. Exit
        Choose an option:
        """)

    while true {
        let userInput = readLine()!
        if let userChoice = Int(userInput), (1...6).contains(userChoice) {
            return userChoice
        } else {
            print("You entered: \(userInput). Please enter a number on the menu.")
        }
    }
}

/// validates user imput is a number and is 1 or more 
/// returns that number
func intImputValidator() -> Int {
    while true {
        let userImput = readLine()!
        if let userchoice = Int(userImput), userchoice > 0 {
            return userchoice
        } else {
            print("Invald response, please try again")
        }
    }
}

@main
struct SwiftPlayground {
    static func main() {
        var kumaraInStock = 0

// looks at what user selected from the menu and calls that part of the program 
        while true {
            let userChoice = menuChoice()
            switch userChoice {
                case 1: 

            }

        }
    }
}