//
//  ContentView.swift
//  DistanceConverter
//
//  Created by Dilan Jayamanne on 2023-03-13.
//

import SwiftUI

struct ContentView: View {
    
    @State private var textFieldValue: String = ""
    @State private var unit_type = "unit"
    @State private var converted_value = "value"
    
    var buttonTexts = ["Ft", "cm", "Yd", "km"]
    
    var body: some View {
        VStack {
            Text("Distance Converter")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            TextField("Distance", text: $textFieldValue)
                .frame(width: UIScreen.main.bounds.width * 0.9, height: 20)
                .font(.headline)
                .border(.black)
                .multilineTextAlignment(.center)
                
            HStack {
                
                ForEach((buttonTexts), id: \.self){ text in
                    ButtonView(
                        buttonText: text
                    )
                }
            }
            
            Text("The distance in \(unit_type) is \(converted_value)")
            
            Image("flower")
            Button {
                
            }label: {
                Text("Reset")
            }
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ButtonView: View {
    
    var buttonText: String
    
    var body: some View {
        Button {
            
            if(buttonText == "Ft"){
                // Ft logic
            }else if(buttonText == "cm"){
                // cm logic
            }else if(buttonText == "Yd"){
                // yd logic
            }else if(buttonText == "km"){
                // km logic
            }else if(buttonText == "reset"){
                // reset logic
            }
            
        } label: {
            Text("\(buttonText)")
        }
    }
}
