// The Swift Programming Language
// https://docs.swift.org/swift-book

@main
struct SwiftPlayground {
    static func main() {
        print("enter room length")
        if let userInput = readLine(), let roomlength = Double(userInput) {
print("enter room width")
        if let userInput = readLine(), let roomwidth = Double(userInput) {

        let roomlength = 6.0
        let roomwidth = 4.5
        let roomheight = 2.7

        let roomarea = roomlength * roomwidth

        print("Room Area: \(roomarea) m²")
    }
}
