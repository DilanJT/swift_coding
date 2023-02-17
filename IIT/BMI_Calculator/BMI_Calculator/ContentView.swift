//
//  ContentView.swift
//  BMI_Calculator
//
//  Created by user223941 on 2/10/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var weightTextField: String = ""
    @State private var heightTextField: String = ""
    @State private var bmi: String = "0.0"
    
    @State private var showTitle: Bool = false
    @State private var alertTitle: String = ""
    @State private var alertMsg: String = ""
    @State private var alertBtn: String = ""
    
    
    
    
    
    var body: some View {
        ZStack {
            Color.cyan
                .ignoresSafeArea()
            VStack {
                Text("BMI Calculator")
                    .multilineTextAlignment(.center)
                
                HStack(spacing: 20.0) {
                    Text("Weight")
                    TextField("Enter your weight", text: $weightTextField)
                        .multilineTextAlignment(.center)
                    
                }
                

                
                HStack(spacing: 20.0) {
                    Text("Height")
                    TextField("Enter your height", text: $heightTextField)
                        .multilineTextAlignment(.center)
                }
                
                
                
                
                Button {
                    
                    guard let weight = Double(weightTextField), let height = Double(heightTextField) else {
                        return
                    }
                    
                   
                    let bmi = weight / pow(height, 2)
                    self.bmi = String(format:"%2.f", bmi)
                    
                    if bmi  > 30 {
                        alertMsg = "Your bmi value is \(self.bmi) You are considered to be obese"
                        
                    }else if (bmi > 25){
                        alertMsg = "Your BMI value is \(self.bmi) You are considered to be overweight"
                    }else {
                        alertMsg = "Your BMI value is \(self.bmi) You are healthy"
                    }
                    
                    alertTitle = "Your BMI"
                    alertBtnTitle = "Got it"
                    showAlert = true
                    
                    print(bmi)
                    
                } label: {
                    Text("Calculate BMI")
                        .foregroundColor(Color.white)
                        .background(Color.cyan)
                        .padding()
                        .cornerRadius(20)
                }
                
                Text("Your BMI: \(bmi)")
                    .font(.largeTitle)
                
                Spacer()
            }
            .padding()
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


