//
//  ContentView.swift
//  Assessment
//
//  Created by Visal Rajapakse on 2023-03-13.
//

import SwiftUI

/// Add `enum` cases with `rawValues`  below.



/// Conform `Operator` to `CaseIterable`

struct GameView: View {
    
    // Variables
    
    @ObservedObject var gameModel: GameModel
    @State var submitPressed: Bool = false
    @AppStorage("points") var points: Int = 0
    
    

    var body: some View {
        VStack(spacing: 10) {
            Text("Guess the number!")
                .foregroundColor(.blue)
                .fontWeight(.bold)
            Text("What is \(gameModel.firstNum) \(gameModel.operand) \(gameModel.secondNum)?")
                .fontWeight(.bold)
            HStack{
                TextField("Answer", text: $gameModel.answerEntered)
                    .textFieldStyle(.roundedBorder)
                    
                
                Button {
                    // submit the answer
                    // calculate
                    gameModel.calculate()
                    submitPressed = true
                    points = gameModel.correctCount
                }label: {
                    Text("Submit")
                }
                .foregroundColor(.blue)
                .buttonStyle(.borderedProminent)
                .tint(.blue.opacity(0.2))
                .disabled(submitPressed)
                
            }
            
//            Label("CORRECT ANSWER! WELL DONE", systemImage: "cross.circle.fill")
            if(submitPressed){
                if(gameModel.ansCorrect) {
                    Label("CORRECT ANSWER! WELL DONE", systemImage: "checkmark.circle.fill")
                }else if(!gameModel.ansCorrect) {
                    Label("Incorrect answer! correct answer is \(gameModel.correctAnswer)", systemImage: "xmark.circle.fill")
                }
            }
            
            Text("\(gameModel.correctCount)")
                .font(.largeTitle)
            Text("Instructions").font(.system(size: gameModel.fontSize))
            Text("Submit the correct answer and gain one point. Submit a wrong answer or press on NEXT and you will loose 1 point")
                .multilineTextAlignment(.center)
                .font(.system(size: gameModel.fontSize))
            Button {
                gameModel.reset()
                submitPressed = false
            } label: {
                Text("Next")
            }
            .buttonStyle(.borderedProminent)
            .tint(.green)
        }
        .padding()
    }
    
    // functionality is a moved to an observable class called GameModel
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(gameModel: GameModel())
    }
}
