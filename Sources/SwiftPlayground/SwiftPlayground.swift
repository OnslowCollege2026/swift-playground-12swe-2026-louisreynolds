// The Swift Programming Language
// https://docs.swift.org/swift-book
///finds the volume of a room
///returns: volume in square meters 
func roomvolume() -> Double {
    6.0 * 4.5 * 4.0
}
///calculates and prints a room area
/// -parameters:
///  - length: of room in meters
///  - width: of room in meters
func printArea(length: Double, width: Double) {
    print(length * width)
}
///calculates a room area
/// -parameters:
///  - length: of room in meters
///  - width: of room in meters
/// - returns room area in square meters 
func area(length: Double, width: Double) -> Double {
    return length * width
}
///calculates a room volume
/// -parameters:
///  - length: of room in meters
///  - width: of room in meters
///  - height of room in meters 
/// - returns room volume in cubic meters 
func volume(length: Double, width: Double, height: Double) -> Double {
    return length * width * height
}
@main
struct SwiftPlayground {
    static func main() {
        printArea(length: 6.0, width: 5.0)
        let Area = area(length: 4.2, width: 6.7)
        print(Area, "m²")
        let volumeReturn = volume(length: 5.5, width: 3.5, height: 6)
        print("volume is \(volumeReturn) m³")
    }
}
