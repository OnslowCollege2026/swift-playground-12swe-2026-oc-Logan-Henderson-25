// The Swift Programming Language
// https://docs.swift.org/swift-book

// Task: Students will develop a Swift program for a roadside kumara stall.

// The stall keeps kumara in a large container, with stock measured in kilograms. Customers pull up to the side of the road, take a bag from a stack available, fill up the bags, then weigh the bags, find out how much to pay, and then put the money into a box or scan it into an EFTPOS machine.

//The owner wants to find out how many kumara people are buying per bag so that they can transition to selling kumara pre-bagged for a set price. To do this, they will use the average data from the sales recorded during the run of the program; the calculation goes kumara weight sold / number of bags used = how much kumara to put in each bag


let kumaraStock = 50.0 /// The amount of kumara in stock.
let kumaraPricePerKg = 3.0 /// The price of kumara per kilogram.
let kumaraweight = 0.1 /// The weight of a single kumara.
let kumaraAdded = Double(readLine()!) /// Converts the user input into a double

// This function lets the user select how much kumara they wish to purchase and stops the user from adding more/less kumara than is available in stock and prints appropriate messages based on the input.
func kumaraBoundaries(kumaraAdded: Double) {
    if kumaraAdded < 0 {print("You cannot add a negative amount of kumara to your bag. Please try again.")}
    if kumaraAdded > 0 && kumaraAdded <= 50 {print("You have added \(kumaraAdded) kumara to your bag. Please enter again to calculate the weight and price of the kumara you have added to your bag.")}
    if kumaraAdded > 50 {print("Sorry, we only have \(kumaraStock) kilograms of kumara in stock. Please try again.")}

// This function calculates the weight of users kumara and prints it out to the user.
func kumaraWeight(kumaraAdded: Double) {
    let kumaraWeight = kumaraAdded * kumaraweight
    print("The weight of the kumara you have added to your bag is \(kumaraWeight * kumaraAdded) kilograms.")
}

// This function calculates the price of the users kumara and prints it out to the user.
func kumaraPrice(kumaraAdded: Double) {
    let kumaraPrice = kumaraAdded * kumaraPricePerKg
    print("The price of the kumara you have added to your bag is $\(kumaraPrice).")
}
@main
struct SwiftPlayground {
    static func main() {


// Prints the welcome message, the amount of kumara in stock and the price per kilogram, then tells the user to enter the weight of kumara they wish to purchase.
    print("Welcome to the roadside kumara stall!")
    print("We have \(kumaraStock) kilograms of kumara in stock, and the price is $\(kumaraPricePerKg) per kilogram.")
    print("Please enter the weight of the kumara you wish to purchase:")

// This calls on the functions
let kumaraAdded = Double(readLine()!)!
kumaraBoundaries(kumaraAdded: kumaraAdded)
kumaraWeight(kumaraAdded: kumaraAdded)
kumaraPrice(kumaraAdded: kumaraAdded)

// This prints the thank you message at the end of the program.
print("Thank you for your purchase! Please come again.")

        }
    }
}