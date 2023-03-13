//
//  ContentView.swift
//  DistanceConverter
//
//  Created by Dilan Jayamanne on 2023-03-13.
//

import SwiftUI

struct ContentView: View {
    
    @State private var textFieldValue: String = ""
    private var unit_type = "unit"
    private var converted_value = "value"
    
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
                Button {
                    
                } label: {
                    Text("Ft")
                }
                
                Button {
                    
                } label: {
                    Text("cm")
                }
                
                Button {
                    
                } label: {
                    Text("Yd")
                }
                
                Button {
                    
                } label: {
                    Text("km")
                }
            }
            
            Text("The distance in \(unit_type) is \(converted_value)")
            
            Image("flower")
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
