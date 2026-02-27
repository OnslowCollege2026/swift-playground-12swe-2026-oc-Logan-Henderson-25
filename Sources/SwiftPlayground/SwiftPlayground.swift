// The Swift Programming Language
// https://docs.swift.org/swift-book

///This function lets the user interact with the menu
/// - The function returns what the user chose
func menuChoice() -> Int {
    while true {
        print("""
        ==== Egg Shop ====
        1. Add eggs
        2. Sell eggs
        3. Show current stock
        4. Show total eggs sold
        5. Exit
        Choose an option:
        """)


    if let input = readLine(), let choice = Int(input) {
        return choice
    }else {
        return 0
    }

    }
}

func addEggs(currentStock: Int, amount: Int) -> Int{
if amount < 1, amount + currentStock > 1000 {
    print("Invalid amount, eggs must be between 1 and 1000")
    return currentStock
}
    let newStock = amount + currentStock
    print("You have added \(amount) eggs to your stock.")
    return newStock
}



@main
struct SwiftPlayground {
    static func main() {


    }
}
