// The Swift Programming Language
// https://docs.swift.org/swift-book

// task 1
func average(of temperature: [[Int]], row: Int) -> Double {
    let selectedRow = temperature[row]
    var sum = 0
    for number in selectedRow {
        sum += number
    }
    return Double(sum) / Double(selectedRow.count)

}

// task 3
func columnTotal(in table2: [[Int]], column: Int) {
for number in table2 {
    
}
}

@main
struct SwiftPlayground {
    static func main() {

        // task 1
        let temperature = [
            [56, 12, 60, 12],
            [46, 10, 42, 67],
            [5, 1, 44, 27],
        ]

        print(
            """

            \(temperature[1] [2])
            \(temperature[2] [0])
            \(average(of: temperature, row: 1))

            """)

        // task 2
        let table = [
            [2, 4, 6],
            [8, 10, 12],
            [14, 16, 18],
        ]

        var count = 0

        for row in table {
            for value in row {
                print(value)
                count += 1
            }
        }
        print("\(count) values were printed")

// task 3
let table2 = [
    [3, 5, 7, 9],
    [2, 4],
    [8, 6, 1],
    [10]
]
print("what column do you want to total?")
let columnInput = readLine()
columnTotal(in: table2, column: columnInput)
    }
}
