// The Swift Programming Language
// https://docs.swift.org/swift-book
func roomArea(length: Double, width: Double ) -> Double {
return length * width
}
func printDivider() {

}
@main
struct SwiftPlayground {
    static func main() {
        
    let area = roomArea(length: 5.0, width: 8.0)
    print(area)
    }
}