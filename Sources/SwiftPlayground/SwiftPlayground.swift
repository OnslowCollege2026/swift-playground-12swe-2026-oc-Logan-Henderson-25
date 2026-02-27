// The Swift Programming Language
// https://docs.swift.org/swift-book



@main
struct SwiftPlayground {
    static func main() {        
var status = 0
let statusChecker = 2
var name  = ""

while name == "" {
    print("What name do you want to be selected?")
    let input = readLine()!
    if input == "" {
        print("Please enter a valid name.")
    } else {
        print("You have entered \(input)")
        name = input
    }
}

while status == 0 {
    print("Please enter a number between 1 and 2.")
    if let input = readLine(), let statusInput = Int(input) {
        if statusInput > statusChecker {
            print("Invalid number, please try again.")
        } else {
            print("You have selected \(statusInput)")
            status += statusInput
        }
    }
}

if status == 2 {
    print("\(name) is a smart fella.")
} else {
    print("\(name) is a fart smella.")

}

    }
}