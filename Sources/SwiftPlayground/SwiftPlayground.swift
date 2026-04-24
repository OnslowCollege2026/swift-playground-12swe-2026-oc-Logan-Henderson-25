// The Swift Programming Language
// https://docs.swift.org/swift-book

// Task: Students will develop a Swift program for a roadside kumara stall.

// The stall keeps kumara in a large container, with stock measured in kilograms. Customers pull up to the side of the road, take a bag from a stack available, fill up the bags, then weigh the bags, find out how much to pay, and then put the money into a box or scan it into an EFTPOS machine.

//The owner wants to find out how many kumara people are buying per bag so that they can transition to selling kumara pre-bagged for a set price. To do this, they will use the average data from the sales recorded during the run of the program; the calculation goes kumara weight sold / number of bags used = how much kumara to put in each bag


let kumaraStock = 50.0 /// The amount of kumara in stock.
let kumaraPricePerKg = 3.0 /// The price of kumara per kilogram.
let kumaraweight = 0.1 /// The weight of a single kumara.


@main
struct SwiftPlayground {
    static func main() {

// Prints a message that lets the user enter the weight of the kumara they wish to purchase in kilograms.

    print("Welcome to the roadside kumara stall!")
    print("Please enter the the amount of kumara you wish to purchase:")
    let kumaraPurchased = readLine()

// Prints an error message if the user can't purchase more kumara than is in stock, then asks them to try again.
while true {
if let kumaraPurchased = Double(kumaraPurchased!), kumaraPurchased > kumaraStock {
    print("Sorry, we don't have enough kumara in stock. Please try again.")
    print (readLine())

// something is wrong with the code, it is not allowing the user to enter a new value for kumaraPurchased, it is just asking them to enter a new value but not actually reading it in and updating the variable. I will try to fix this by moving the readLine() inside the while loop and updating the kumaraPurchased variable with the new input.
} else {
while false {
    if let kumaraPurchased = Double(kumaraPurchased!), kumaraPurchased <= kumaraStock {
    print("Thank you for your purchase! Please come again.") } }

            }
        }
    }
}