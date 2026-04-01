// The Swift Programming Language
// https://docs.swift.org/swift-book


import Foundation


@main
struct SwiftPlayground12 {
    static func main() {
        let vocabulary: [[String]] = [
            ["Hello",       "Hola", "Me llamo", "Gracias", "Adios", "Si"],
            ["My name is",  "Me llamo", "Hola", "Gracias", "Adios", "Si"],
            ["Thank you",   "Gracias", "Hola", "Me llamo", "Adios", "Si"],
            ["Goodbye",     "Adios", "Hola", "Me llamo", "Gracias", "Si"],
            ["Yes",         "Si", "Hola", "Me llamo", "Gracias", "Adios"]
        ]
        
        var counter = 0
        var score = 0
        var incorrectAnswerIndices: [Int] = []
        
        while counter < vocabulary.count {
            let englishWord = vocabulary[counter][0]
            let correctWord = vocabulary[counter][1]
            let allAnswers = vocabulary[counter].dropFirst().shuffled()
            
            print("Please translate \(englishWord)")
            allAnswers.forEach { answer in
                print("- \(answer)")
            }
            
            if let userInput = readLine(), userInput.lowercased() == correctWord.lowercased() {
                score = score + 1
                print("Yes, \(correctWord) is correct!")
            } else {
                incorrectAnswerIndices.append(counter)
                print("Sorry! The correct answer is \(correctWord).")
            }
            
            counter = counter + 1
        }
        
        while incorrectAnswerIndices.count > 0 {
            let index = incorrectAnswerIndices[0]
            
            let englishWord = vocabulary[index][0]
            let correctWord = vocabulary[index][1]
            let allAnswers = vocabulary[index].dropFirst().shuffled()
            
            print("Please translate \(englishWord)")
            allAnswers.forEach { answer in
                print("- \(answer)")
            }
            
            if let userInput = readLine(), userInput.lowercased() == correctWord.lowercased() {
                incorrectAnswerIndices.removeFirst()
                print("Yes, \(correctWord) is correct!")
            } else {
                print("Sorry! The correct answer is \(correctWord).")
            }
        }
        
        print("You have a score of \(score)/\(vocabulary.count)")
        if Double(score) >= Double(vocabulary.count / 2) {
            print("Congratulations!")
        } else {
            print("Try again next time.")
        }
    }
}
