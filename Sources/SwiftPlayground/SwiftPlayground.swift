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

/// This lets the user interact with the menu
    if let input = readLine(), let choice = Int(input) {
        return choice
    }else {
        return 0
    }

    }
}

/// This function lets the user add more eggs to their stock
/// - Parameters
///     - currentStock is how many eggs the user currently has in their stock
///     - amount is how many eggs the user is adding to their stock
/// - This function returns the amount of eggs the user has added to their stock
func addEggs(currentStock: Int, amount: Int) -> Int{
if amount < 1 {
    print("Invalid amount, eggs must be at least 1")
    return currentStock
}

if currentStock + amount > 1000 {
    print("Invalid amount, eggs must be below 1000")
    return currentStock
}

    let newStock = amount + currentStock
    print("You have added \(amount) eggs to your stock.")
    return newStock
}

/// This function lets the user sell eggs from there stock
/// - Parameters
///     - currentStock is how many eggs the user currently has in their stock
///     - amount is the amount of eggs the user is selling
/// - This function returns the amount of eggs the user has sold
func sellEggs(currentStock: Int, amount: Int) -> Int?{
    if amount < 1 {
    print("Invalid amount, you can not sell negative eggs")
    return currentStock
}

if amount > currentStock {
    print("Invalid amount, you can not sell more eggs that you have")
    return currentStock
}

    let newStock = currentStock - amount
    print("You have sold \(amount) eggs from your stock.")
    return newStock
    }

/// This function shows the user how many eggs they have sold in total
/// - Parameters
///     - currentSold is the amount of eggs that the user has sold
///     - amount is the amount of egg that the user is selling
/// - This funtion returns the new amount of eggs that the user has sold
func updateSoldCount(currentSold: Int, amount: Int) -> Int {
    let newSold = currentSold + amount
    return newSold
}

/// This function tells the user how many eggs they have left in their stock
/// - Parameter: stock is the amount of eggs that the user has
/// - This function returns the stock message in a string
func stockMessage(stock: Int) -> String {
    let stockMessage = "You have \(stock) eggs left"
    return stockMessage
}

@main
struct SwiftPlayground {
    static func main() {

    // Tells the user how many eggs they have sold.
    var eggsInStock:Int = 0
    var eggsSold:Int = 0
    // Makes sure the programme runs.
    var running:Bool = true


    while running {
        let userChoice = menuChoice()
    
        switch userChoice {
            // Case 1 lets the user add eggs to their stock
            case 1:
                print("How many eggs would you like to add?")
                if let userInput = readLine(), let eggsBeingAdded = Int(userInput) {
                    eggsInStock = addEggs(currentStock: eggsInStock, amount: eggsBeingAdded)
                }
            // Case 2 lets the user sell eggs from their stock
            case 2:
                print("How many eggs would you like to sell?")
                if let userInput = readLine(), let eggsBeingSold = Int(userInput) {
                    if let newStock = sellEggs(currentStock: eggsInStock, amount: eggsBeingSold) {
                        eggsInStock = newStock
                        eggsSold = updateSoldCount(currentSold: eggsSold, amount: eggsBeingSold)
                    }
                }
            // Case 3 lets the user see how many eggs they have left in their stock
            case 3:
                print(stockMessage(stock: eggsInStock))
            // Case 4 lets the user see how many eggs they have sold
            case 4:
                print(" You have sold a total of \(eggsSold)")
            // Case 5 lets the user end the programme
            case 5:
                running = false
                print("You have sold \(eggsSold) eggs, and have \(eggsInStock) left in your stock, thank you for using the Egg Shop.")
            // default shows the user a error message if they enter anything that isn't 1-5
            default:
                print("Invalid option, please try again")
        }
    }

    }
}
