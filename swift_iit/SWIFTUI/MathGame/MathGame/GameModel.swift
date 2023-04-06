//
//  GameModel.swift
//  MathGame
//
//  Created by Dilan Jayamanne on 2023-03-24.
//

import Foundation
import SwiftUI

class GameModel: ObservableObject {
    
    @Published var firstNum: String = ""
    @Published var secondNum: String = ""
    @Published var operand: String = ""
    @Published var answerEntered: String = ""
    @Published var correctAnswer: String = "0"
    @Published var ansCorrect: Bool = false
    @Published var correctCount: Int = 0 // correct count
    @Published var fontSize: Double = 20.0
    @Published var selectedColor: SetColors = .emarald
    @Published var colors: [Color] = [Color("emarald"), Color("ruby"), Color("saphier")]
    
    init() {
        self.firstNum = "\(generateRandom())"
        self.secondNum = "\(generateRandom())"
        self.operand = "\(generateOperand())"
    }
    
    func generateRandom() -> Int{
        let range = 1..<9
        let randomNumber: Int? = range.randomElement()
        return randomNumber!
    }
    
    func generateOperand() -> String{
        let operands = ["+", "-", "/", "*"]
        return operands.randomElement()!
    }
    
    func calculate() {
        // calculate the answer
        // incremenet if the user given asnwer is correct
        guard
            let first = Int(self.firstNum),
            let second = Int(self.secondNum) else {return}
        
        print("first number \(first)")
        print("second number \(second)")
        
        var ans : Int = 0
        if(operand == "+"){
            ans = first  + second
        }else if(operand == "-") {
            ans = first - second
        }else if(operand == "/") {
            ans = first / second
        }else if(operand == "*") {
            ans = first * second
        }
        
        self.correctAnswer = String(ans)
        
        print("Answer \(ans)")
        print("Answer entered \(answerEntered)")
        
        guard
            let ansEntered = Int(answerEntered),
            let correctAnswer = Int(correctAnswer) else {return}
        
        if(ansEntered == correctAnswer) {
            self.ansCorrect = true
            
            self.correctCount += 1
            
        }else {
            self.ansCorrect = false
            self.correctCount -= 1
        }
    }
    
    func reset() {
        self.ansCorrect = false
        self.firstNum = "\(generateRandom())"
        self.secondNum = "\(generateRandom())"
        self.operand = "\(generateOperand())"
        self.answerEntered = ""
        self.correctAnswer = ""
    }
    
    
}


enum SetColors: String, CaseIterable {
    case saphire = "Saphire"
    case ruby = "Ruby"
    case emarald = "Emarald"
}
