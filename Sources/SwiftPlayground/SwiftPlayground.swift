let maxEggs = 999

// The Swift Programming Language
// https://docs.swift.org/swift-book
///prints menu and asks for a resonse
/// returns a number 1 to 5
func menuChoice() -> Int {
    print(
        """
        \n
            ==== Egg Shop ====
        1. Add eggs
        2. Sell eggs
        3. Show current stock
        4. Show total eggs sold
        5. Exit
        Choose an option:
        """)

    while true {
        let userInput = readLine()!
        if let userChoice = Int(userInput), (1...5).contains(userChoice) {
            return userChoice
        } else {
            print("You entered: \(userInput). Please enter a number on the menue.")
        }
    }
}
/// validates user imput is a number
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
///checks that eggs added is less than 1000 then adds eggs to the stock count
/// parameters
/// amount of eggs in stock
/// amount of eggs user is adding to stock
/// returns new number of eggs in stock
func addEggs(currentStock: Int, amount: Int) -> Int {
    if currentStock + amount <= maxEggs {
        print("success! You now have \(currentStock + amount) eggs")
        return currentStock + amount
    } else {
        print("You can not have more than 999 eggs in stock.")
        print("The maximum eggs you can add to the current stock is \(maxEggs-currentStock)")
        return currentStock
    }

}

func sellEggs(currentStock: Int, amount: Int) -> Int {
    if currentStock - amount < 0 {
        print("you can not sell more eggs that you have in stock")
        print("you can currently sell a maximum of \(currentStock) eggs")
        return currentStock
    } else {
        print("success! You have just sold \(amount) eggs")
        print("You now have \(currentStock - amount) eggs remaining")
        return currentStock - amount
    }
}

@main
struct SwiftPlayground {
    static func main() {

        var eggsInStock = 0
        var eggsSold = 0
        while true {
            //switch calls specific func based on what number is selected in menu
            let userChoice = menuChoice()
            switch userChoice {
            case 1:
                print("How many eggs would you like to add?")
                eggsInStock = addEggs(currentStock: eggsInStock, amount: intImputValidator())

            case 2:
                print("How many eggs would you like to sell?")
                eggsInStock = sellEggs(currentStock: eggsInStock, amount: intImputValidator())

            case 3:
                print("You currently have \(eggsInStock) eggs in stock.")

            default:
                print()

            }

        }
    }
}
