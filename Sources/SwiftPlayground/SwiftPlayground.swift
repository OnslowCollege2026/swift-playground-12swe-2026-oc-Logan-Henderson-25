@main
struct SwiftPlayground {
    static func main() {
        let vocabulary = [
            ["Hello",       "Hola", "Me llamo", "Gracias", "Adios", "Si"],
            ["My name is",  "Me llamo", "Hola", "Gracias", "Adios", "Si"],
            ["Thank you",   "Gracias", "Hola", "Me llamo", "Adios", "Si"],
            ["Goodbye",     "Adios", "Hola", "Me llamo", "Gracias", "Si"],
            ["Yes",         "Si", "Hola", "Me llamo", "Gracias", "Adios"]
        ]

        var incorrectIndices: [Int] = []
        var incorrectCount = 0
        var correctCount = 0
        var score = 0

        while correctCount < vocabulary.count {
            let correctAnswer = vocabulary[correctCount][1]
            let options = Array(vocabulary[correctCount][1...5]).shuffled()
            
            print("What is the Spanish word for \(vocabulary[correctCount][0])?")
            for (index, option) in options.enumerated() {
                print("\(index + 1). \(option)")
            }
            print("Enter your answer: ")
            
            if let userInput = readLine() {
                if let userAnswer = Int(userInput), userAnswer > 0, userAnswer <= 5 {
                    if options[userAnswer - 1] == correctAnswer {
                        print("That is correct!")
                        correctCount += 1
                        score += 1
                        print("Your score is \(score)")
                    } else {
                        print("That is incorrect. The correct answer is \(correctAnswer).")
                        incorrectIndices.append(correctCount)
                        incorrectCount += 1
                        correctCount += 1
                        print("Your score is \(score)")


                    }
                } else {
                    print("Invalid input. Please enter your answers number.")
                }
            }
        }
    }
}