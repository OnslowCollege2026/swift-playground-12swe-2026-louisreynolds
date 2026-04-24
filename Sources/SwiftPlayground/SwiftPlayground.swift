let maxKumara: Double = 50
let kumaraPricePerKG: Double = 3.0
let minSale: Double = 0.1
let maxBags = 5000
let maxWeightInBags: Double = 5.0
let bagPrice: Double = 0.2

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
func intImputValidator() -> Double {
    while true {
        let userImput = readLine()!
        if let userchoice = Double(userImput), userchoice > 0 {
            return userchoice
        } else {
            print("Invald response, please try again")
        }
    }
}
///checks that total stock doesn't exeed 50kg when new stock is added then add the kumara to the current stock
/// parameters
/// kumara in stock
/// amount of kumara user is adding to stock
/// returns new number of kumara in stock or same stock if stock was going to exeed 50kg with the new kumara added

func addKumara(currentStock: Double, amount: Double) -> Double {
    if currentStock + amount <= maxKumara {
        print("success! You now have \(currentStock + amount) kg of kumara")
        return currentStock + amount
    } else {
        print("You can not have more than 50kg of kumara in stock.")
        print(
            "The maximum amount of kumara you can add to the current stock is \(maxKumara-currentStock)kg"
        )
        return currentStock
    }

}

@main
struct SwiftPlayground {
    static func main() {

        var kumaraInStock: Double = 0

        // looks at what user selected from the menu and calls that part of the program
        while true {
            let userChoice = menuChoice()
            switch userChoice {
            case 1:
                print("How many kg of kumara would you like to add?")
                kumaraInStock = addKumara(currentStock: kumaraInStock, amount: intImputValidator())
            case 2:
                print("How much kumara would you like to sell?")
                
            default:
                break

            }

        }
    }
}
