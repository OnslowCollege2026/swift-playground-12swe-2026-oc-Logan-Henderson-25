import Foundation

/// Parameters:
/// - size: The width and height of the square grid.
/// - shipCount: How many ships to place.
///
/// Returns: A new ocean grid with ships placed.
func randomShipPlacement(size: Int, shipCount: Int) -> [[String]] {
    var grid = Array(repeating: Array(repeating: "~", count: size), count: size)
    var shipsPlaced = 0

    while shipsPlaced < shipCount {
        let row = Int.random(in: 0..<size)
        let col = Int.random(in: 0..<size)

        if grid[row][col] != "S" {
            grid[row][col] = "S"
            shipsPlaced += 1
        }
    }
    return grid
}

@main
struct SwiftPlayground {
    static func main() throws {
        // The maximum number of guesses the user can make.
        let maximumGuesses = 101
        
        // The size of the board (width and height).
        let size = 6
        
        // The board you are playing on.
        var ocean = Array(repeating: Array(repeating: "~", count: size), count: size)
        
        // A record of the guesses that have been made.
        var guesses = Array(repeating: Array(repeating: "~", count: size), count: size)

        // Randomises the placement of the ships
        ocean = randomShipPlacement(size: size, shipCount: 1)

        // Allow the user to make a certain number of guesses.
        var progress = 1
        while progress < maximumGuesses {
            // Print the guesses board.
            printBoard(guesses)
            
            // Ask for the row and column number.
            print("\(progress): Please enter a row number, press Enter, then a column number: ")
            
            // Get the user's input for both the row and column.
            // If the input is not usable, tell them to try again.
            guard let userInput = readLine(),
                    let row = Int(userInput),
                    let userInput2 = readLine(),
                    let col = Int(userInput2) else {
                print("Your guess is invalid. Try again.")
                continue
            }
            
            let oldGuesses = guesses
            
            // By this point in the code, the row and col must be valid integers.
            // Use processGuess to check that they are also valid guesses.
            let newGuesses = processGuess(row: row, col: col, ocean: ocean, guesses: guesses)
            
            // Only go to the next move if the guesses board was updated (i.e. a valid guess).
            if oldGuesses != newGuesses {
                progress = progress + 1
                guesses = newGuesses
            }
            
            // Check how many ships are remaining. If they have sunk all the ships, congratulate them.
            if remainingShips(in: ocean, guesses: guesses) == 0 {
                print("YOU WON!")
                return
            } else {
                
            }
        }
    }
}
/// Parameter:
/// - board: The 2D grid to display.
func printBoard(_ board: [[String]]) {
    var columnLabels = "  "
    for i in 1...board.count {
        columnLabels = columnLabels + "\(i) "
    }
    print(columnLabels)
    
    for (index, row) in board.enumerated() {
        var rowString = "\(index + 1) "
        for cell in row {
            rowString = rowString + cell + " "
        }
        print(rowString)
    }
}

/// Parameters:
/// - row: The row index for the guess.
/// - col: The column index for the guess.
/// - ocean: The hidden ships grid.
/// - guesses: The player's current guesses grid.
///
/// Returns: The updated guesses grid after the guess is applied.
func processGuess(row: Int, col: Int, ocean: [[String]], guesses: [[String]]) -> [[String]] {
    // Make sure the row and column exist. If not, exit this function early.
    guard row >= 1, row <= ocean.count, col >= 1, col <= ocean[0].count else {
        print("Your guess is invalid. Try again.")
        return guesses
    }
    
    // Make sure that the user hasn't already guessed the position.
    // If not, exit this function early.
    guard guesses[row - 1][col - 1] != "O" && guesses[row - 1][col - 1] != "X" else {
        print("You have already guessed that position. Try again.")
        return guesses
    }
    
    // Make sure that the user hasn't missed the battleship.
    // If not, return an updated guesses table including the miss.
    guard ocean[row - 1][col - 1] == "S" else {
        print("MISS!")
        var newGuesses = guesses
        newGuesses[row - 1][col - 1] = "O"
        return newGuesses
    }
    
    // If the code hasn't returned by now, the player must have hit a ship.
    print("You've sunk my battleship!")
    var newGuesses = guesses
    newGuesses[row - 1][col - 1] = "X"
    return newGuesses
}
/// Parameters:
/// - ocean: The hidden ships grid.
/// - guesses: The player's current guesses grid.
///
/// Returns: How many ships remain unhit.
func remainingShips(in ocean: [[String]], guesses: [[String]]) -> Int {
    var shipsCount = 0
    for row in 0...ocean.count-1 {
        for col in 0...row {
            if ocean[row][col] == "S" {
                shipsCount = shipsCount + 1
            }
        }
    }
    
    var hitCount = 0
    for row in 0...guesses.count-1 {
        for col in 0...row {
            if guesses[row][col] == "X" {
                hitCount = hitCount + 1
            }
        }
    }
    
    return shipsCount - hitCount
}
