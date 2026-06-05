import Foundation

// starting parameters
let maxKumara: Double = 50
let kumaraPricePerKG: Double = 3.0
let minKumara: Double = 0.1
let maxBags: Int = 5000
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
func ImputValidator() -> Double {
    while true {
        let userImput = readLine()!
        if let userchoice = Double(userImput), userchoice > 0 {
            return userchoice
        } else {
            print("Invalid response, please try again")
        }
    }
}
///checks that total stock doesn't exeed 50kg when new stock is added then add the kumara to the current stock
/// parameters
///currentStock - kumara in stock
///amount - amount of kumara user is adding to stock
/// returns new number of kumara in stock or same stock if stock was going to exeed 50kg with the new kumara added

func addKumara(currentStock: Double, amount: Double) -> Double {
    if amount < minKumara {
        print("The minimum amount of kumara to add to stock is \(minKumara)Kg")
        return currentStock
    } else if currentStock + amount > maxKumara {
        print("You can not have more than \(maxKumara)kg of kumara in stock.")
        print(
            "The maximum amount of kumara you can add to the current stock is \(maxKumara-currentStock)kg"
        )
        return currentStock
    } else {
        print("success! You now have \(currentStock + amount) kg of kumara")
        return currentStock + amount
    }

}
///ask how much kumara to sell then checks if that amount is in stock then asks how many bags to sell and checks if it is suffient number of bags for the amount of kumara sold. It documents it in sales history then processes order
/// parameters
/// currentStock - kumara in stock
/// salesHistoryKumara - array of all kumara sales
/// salesHistoryBags- array of all bags sales
/// saleHistoryTotal - array of total for all sales
/// returns: updated kumara stock
func sellKumara(
    currentStock: Double, salesHistoryKumara: inout [Double], salesHistoryBags: inout [Int],
    salesHistoryTotal: inout [Double]
) -> Double {

    var amountOfKumaraToSell: Double = 0
    var amountOfBagsToSell: Int = 0

    print(
        """
        How much kumara would you like to sell? 
        The maximum kumara you can sell is \(currentStock)Kg")
        kumara costs $\(kumaraPricePerKG) per Kg
        """)
    while true {
        amountOfKumaraToSell = ImputValidator()
        if amountOfKumaraToSell < minKumara {
            print("The minimum amount of kumara you can sell is \(minKumara)Kg ")
        } else if amountOfKumaraToSell > currentStock {
            print(
                "Insuffienct stock, maximum amount of kumara you can sell is \(currentStock)Kg"
            )
        } else {
            break
        }
    }

    //ask of number of bags to be purchased
    print(
        """
        How many bags would you like to sell? 
        Maximum of \(maxWeightInBags)Kg of kumara per bag
        There are are a maximum of \(maxBags) bags the can be purchased in one transaction. 
        The price of a bag is $\(bagPrice)
        """)

    //gets a responce from user for a amount of bags being sold
    //can't use inputValidator as an Int has to be returned
    while true {
        let bags = readLine()!
        //checks if user has asked for enough bags for the amount of kumara they're buying
        if let bagsInWhileLoop = Int(bags), bagsInWhileLoop > 0, bagsInWhileLoop <= 5000,
            bagsInWhileLoop >= Int((amountOfKumaraToSell / maxWeightInBags).rounded(.up))
        {
            amountOfBagsToSell = bagsInWhileLoop
            break
        } else {
            print("Invalid responce, Please enter the amount of bags you want to sell")
            print(
                "You must sell at least \(Int((amountOfKumaraToSell / maxWeightInBags).rounded(.up))) bags. Maximum amount of bags is \(maxBags)"
            )
        }
    }

    // sales history
    let total = kumaraPricePerKG * amountOfKumaraToSell + bagPrice * Double(amountOfBagsToSell)
    salesHistoryKumara.append(amountOfKumaraToSell)
    salesHistoryBags.append(amountOfBagsToSell)
    salesHistoryTotal.append(total)

    print(
        """
        Success!
        Customer has purchased \(amountOfKumaraToSell)Kg's of kumara at $\(kumaraPricePerKG) per Kg, totaling $\(amountOfKumaraToSell * kumaraPricePerKG)
        Customer has purchased \(amountOfBagsToSell) bags at $\(bagPrice), per bag totaling $\(Double(amountOfBagsToSell) * bagPrice)
        The grand total for this transaction is $\(total)
        """)

    return currentStock - amountOfKumaraToSell

}
///displays the sales records and goes stright back to menu if no sales have been made yet
/// parameters
/// salesHistoryKumara - history of kumara sales
/// salesHistoryBags -history of bag sales
/// saleHistoryTotal - history of total transaction of sales
func showSalesHistory(
    salesHistoryKumara: [Double], salesHistoryBags: [Int], saleHistoryTotal: [Double]
) {
    //returns to menu if theres no sales
    if saleHistoryTotal.isEmpty {
        print("No sales yet")
        return
    } else {
        print("\n Sales histoy")
        //prints out every sale
        for i in 0..<saleHistoryTotal.count {
            print(
                """
                Sale: \(i + 1)
                    Kumara sold: \(salesHistoryKumara[i])Kg
                    bags sold: \(salesHistoryBags[i])
                    total: $\(saleHistoryTotal[i])
                """)
        }
        return
    }
}
/// works out and diplays the summary info
/// parameters
/// - salesHistoryKumara - history of kumara sales
/// - salesHistoryBags -history of bag sales
/// - saleHistoryTotal - history of total transaction of sales
func showSummaryInfo(
    salesHistoryKumara: [Double], salesHistoryBags: [Int], salesHistoryTotal: [Double]
) {
    //returns to menu if theres no sales
    if salesHistoryKumara.isEmpty {
        print("No sales yet")
        return
    } else {
        //totals the kumara from all sales
        var totalKumara: Double = 0
        for kumara in salesHistoryKumara {
            totalKumara += kumara
        }

        // totals the bags from all sales
        var totalbags: Int = 0
        for bags in salesHistoryBags {
            totalbags += bags
        }

        //totals the revenue from all sales
        var totalRevenue: Double = 0
        for revenue in salesHistoryTotal {
            totalRevenue += revenue
        }

        //works out the average of all summary info
        let averageKumaraSold = totalKumara / Double(salesHistoryKumara.count)
        let avergeBagsold = Double(totalbags) / Double(salesHistoryBags.count)
        let averageKumaraPerBag = totalKumara / Double(totalbags)
        let averageCostPerBag = totalRevenue / Double(totalbags)
        let averageCostPerOrder = totalRevenue / Double(salesHistoryTotal.count)

        print(
            """

            === Summary ===

            Total kumara sold: \(totalKumara)Kg
            Total bags sold: \(totalbags)
            Total Revenue generated: $\(totalRevenue)
            Average kumara sold per transaction: \(averageKumaraSold)Kg
            Average Bags sold per transation: \(avergeBagsold)
            Average Kumara per bag: \(averageKumaraPerBag)Kg
            Average Revenue per bag: $\(averageCostPerBag)
            Average Revenue per transaction: $\(averageCostPerOrder)
            """)
        return
    }
}
@main
struct SwiftPlayground {
    static func main() {

        //variable declaration
        var kumaraInStock: Double = 0
        var salesHistoryKumara: [Double] = []
        var salesHistoryBags: [Int] = []
        var salesHistoryTotal: [Double] = []

        // looks at what user selected from the menu and calls that part of the program
        while true {
            let userChoice = menuChoice()
            switch userChoice {
            case 1:
                print("How many kg of kumara would you like to add?")
                kumaraInStock = addKumara(currentStock: kumaraInStock, amount: ImputValidator())
            case 2:
                //can't sell less than 0.1kg of kumara
                if kumaraInStock >= minKumara {
                    kumaraInStock = sellKumara(
                        currentStock: kumaraInStock, salesHistoryKumara: &salesHistoryKumara,
                        salesHistoryBags: &salesHistoryBags, salesHistoryTotal: &salesHistoryTotal)
                } else {
                    print(
                        "Not enough kumara in stock to sell, please add more kumara to stock before selling"
                    )
                }
            case 3:
                print("The current kumara stock is \(kumaraInStock)Kg")
            case 4:
                showSalesHistory(
                    salesHistoryKumara: salesHistoryKumara, salesHistoryBags: salesHistoryBags,
                    saleHistoryTotal: salesHistoryTotal)
            case 5:
                showSummaryInfo(
                    salesHistoryKumara: salesHistoryKumara, salesHistoryBags: salesHistoryBags,
                    salesHistoryTotal: salesHistoryTotal)
            case 6:
                print("Goodbye!")
                return

            default:
                print("Error")
            }

        }
    }
}
