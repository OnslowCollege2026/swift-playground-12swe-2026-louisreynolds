// The Swift Programming Language
// https://docs.swift.org/swift-book

func menuChoice() {
    print(
        """
            ==== Egg Shop ====
        1. Add eggs
        2. Sell eggs
        3. Show current stock
        4. Show total eggs sold
        5. Exit
        Choose an option:
        """)


}

@main
struct SwiftPlayground {
    static func main() {
menuChoice()
if let input = readLine(), let menuOption = Int(input) {
if menuOption == 1 {
    
}
}

    }
}
