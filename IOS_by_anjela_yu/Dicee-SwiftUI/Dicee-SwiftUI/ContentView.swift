//
//  ContentView.swift
//  Dicee-SwiftUI
//
//  Created by user223941 on 2/18/23.
//

import SwiftUI

struct ContentView: View {
    
    // @State allow us to update the variable
    // Without @state any variable inside struct is not mutable (or changed)
    @State var leftDiceNumber = 1
    @State var rightDiceNumber = 1
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all )
            
            VStack {
                Image("diceeLogo")
                Spacer()
                HStack {
                    DiceView( diceNum: leftDiceNumber)
                    
                    DiceView(diceNum: rightDiceNumber)
                    
                    
                }.padding(.horizontal)
                
                Spacer()
                
                Button{
                    // below code generates a random number between 1 and 6 including the boundaries
                    self.leftDiceNumber = Int.random(in: 1...6)
                    self.rightDiceNumber = Int.random(in: 1...6)
                }label: {
                    Text("Roll")
                        .font(.system(size: 50))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                }
                .background(Color.red)
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct DiceView: View {
    var diceNum: Int
    
    var body: some View {
        Image("dice\(diceNum)")
            .resizable()
            .aspectRatio(1, contentMode: .fit)
            .padding()
    }
}
