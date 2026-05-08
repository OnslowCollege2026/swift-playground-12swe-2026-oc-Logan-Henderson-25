// The Swift Programming Language
// https://docs.swift.org/swift-book

// Task: Students will develop a Swift program for a roadside kumara stall.

// The stall keeps kumara in a large container, with stock measured in kilograms. Customers pull up to the side of the road, take a bag from a stack available, fill up the bags, then weigh the bags, find out how much to pay, and then put the money into a box or scan it into an EFTPOS machine.

//The owner wants to find out how many kumara people are buying per bag so that they can transition to selling kumara pre-bagged for a set price. To do this, they will use the average data from the sales recorded during the run of the program; the calculation goes kumara weight sold / number of bags used = how much kumara to put in each bag


let kumaraStock = 50.0 /// The amount of kumara in stock.
let kumaraPricePerKg = 3.0 /// The price of kumara per kilogram.
let kumaraweight = 0.1 /// The weight of a single kumara.
let kumaraAdded = Double(readLine()!) /// Converts the user input into a double

func kumaraBoundaries(kumaraAdded: Double) {
    print("Please enter how may kumara you wish to add to your bag:")
    if kumaraAdded < 0 {print("You cannot add a negative amount of kumara to your bag. Please try again.")}
    if kumaraAdded > 0 && kumaraAdded <= 50 {print("You have added \(kumaraAdded) kumara to your bag.")}
    if kumaraAdded > 50 {print("Sorry, we only have \(kumaraStock) kilograms of kumara in stock. Please try again.")}

func kumaraWeight(kumaraAdded: Double) {
    let kumaraWeight = kumaraAdded * kumaraweight
    print("The weight of the kumara you have added to your bag is \(kumaraWeight * kumaraAdded) kilograms.")
}

func kumaraPrice(kumaraAdded: Double) {
    let kumaraPrice = kumaraAdded * kumaraPricePerKg
    print("The price of the kumara you have added to your bag is $\(kumaraPrice).")
}
@main
struct SwiftPlayground {
    static func main() {

// Prints a message that lets the user enter the weight of the kumara they wish to purchase in kilograms.

    print("Welcome to the roadside kumara stall!")
    print("We have \(kumaraStock) kilograms of kumara in stock, and the price is $\(kumaraPricePerKg) per kilogram.")
    print("Please enter how many kumara you wish to add to your bag")
    print("Then enter the weight of the kumara in kilograms to find out how much you need to pay")
    kumaraBoundaries(kumaraAdded: Double(readLine()!)!)



kumaraWeight(kumaraAdded: Double(readLine()!)!)
print("The weight of the kumara you have added to your bag is \(kumaraWeight(kumaraAdded: Double(readLine()!)!)) kilograms.")

kumaraPrice(kumaraAdded: Double(readLine()!)!)
print("Your total is $\(kumaraPrice(kumaraAdded: Double(readLine()!)!)). Are you sure you want to pay this amount? (yes/no):")
print(readLine()!)
if readLine()! == "yes" {
    print("Thank you for your purchase!")
} else {
if readLine()! == "no" {
    print("Please adjust the weight of the kumara in your bag and try again.")
    print(readLine()!)

} else {
print("Invalid input. Please enter 'yes' or 'no'.")
    print(readLine()!)

                }
            }
        }
    }
}