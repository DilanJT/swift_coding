//
//  ContentView.swift
//  DistanceConverter
//
//  Created by Dilan Jayamanne on 2023-03-13.
//

import SwiftUI

struct ContentView: View {
    
    @State private var textFieldValue: String = ""
    @State private var unit_type = "<<unit>>"
    @State private var converted_value = "<<value>>"
    
    var buttonTexts = ["Ft", "cm", "Yd", "km"]
    var buttonColors = [Color(.red), Color(.green), Color(.blue), Color(.purple)]
    
    var body: some View {
        VStack {
            Text("Distance Converter")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("Enter the distance in meters")
            
            TextField("Distance", text: $textFieldValue)
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.black, style: StrokeStyle(lineWidth: 1.0)))
                .padding()
            /*
                .padding(.all, 10)
                .frame(width: UIScreen.main.bounds.width * 0.9, height: 20)
                .border(.black, width: 2)
                .multilineTextAlignment(.center) */
                
            HStack {
                
                ForEach((0...(buttonTexts.count-1)), id: \.self){ text in
                    ButtonView(
                        buttonText: buttonTexts[text],
                        unitType: $unit_type,
                        converted_value: $converted_value,
                        textFieldValue: textFieldValue,
                        buttonColor: buttonColors[text]
                    )
                }
            }
            
            Text("The distance in \(unit_type) is \(converted_value)")
            
            Image("flower")
            Spacer()
            Button {
                // reset logic
                // reset logic
                self.unit_type = "<<unit>>"
                self.converted_value = "<<value>>"
                self.textFieldValue = ""
            }label: {
                Text("Reset")
            }
            .buttonStyle(.borderedProminent)
            
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
    @Binding var unitType: String
    @Binding var converted_value: String
    var textFieldValue: String
    var buttonColor: Color
    
    var body: some View {
        Button {
            
            if(buttonText == "Ft"){
                // Ft logic
                convert(textFieldValue: textFieldValue, unit_type: "Ft", change: 3.28)
                
            }else if(buttonText == "cm"){
                // cm logic
                convert(textFieldValue: textFieldValue, unit_type: "cm", change: 100)
            }else if(buttonText == "Yd"){
                // yd logic
                convert(textFieldValue: textFieldValue, unit_type: "Yd", change: 1.09)
            }else if(buttonText == "km"){
                // km logic
                convert(textFieldValue: textFieldValue, unit_type: "km", change: 0.001)
            }
            
        } label: {
            Text("\(buttonText)")
        }
        .buttonStyle(.borderedProminent)
        .tint(buttonColor)
    }
    
    func convert(textFieldValue: String, unit_type: String, change: Double) {
        self.unitType = unit_type
        guard let meters = Double(textFieldValue) else {return}
        let value = meters * change
        
        self.converted_value = String(format: "%.2f",value)
    }
}
