// The Swift Programming Language
// https://docs.swift.org/swift-book


func printRoomIntro() {

    print("This program calculates room area and volume.")
    print("It also finds the usable space after furniture.")
}

func printDivider() {
    print("--------")
}

func printUnitsNote() {
    print("All measurements are in metres.")
}

func printGoodbye() {
    print("Done. Thanks for using the calculator.")
}

@main
struct SwiftPlayground {
    static func main() {

printRoomIntro()

printDivider()
print("Summary here")
printDivider()

printUnitsNote()

printGoodbye()

    }
}
