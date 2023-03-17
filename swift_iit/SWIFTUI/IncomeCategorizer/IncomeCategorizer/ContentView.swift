//
//  ContentView.swift
//  IncomeCategorizer
//
//  Created by Dilan Jayamanne on 2023-03-16.
//

import SwiftUI

struct ContentView: View {
    
    @State private var incomeValue: String = ""
    
    private var currencies: [String] = ["LKR", "USD", "AED", "YEN"]
    
    private var categories: [String] = ["Expenses", "Bank Savings", "Investment", "Emergency", "Other"]
    
    @State private var currecyPicked: String = ""
    
    @State private var categoryPicked: String = ""
    
    @State private var divIncomeValue: String = ""
    
    var body: some View {
        VStack {
            HStack{
                TextField("income", text: $incomeValue)
                
                Picker("currenct", selection: $currecyPicked) {
                                ForEach(currencies, id: \.self) {
                                    Text($0)
                                }
                            }
                            .pickerStyle(.menu)
            }
            Text("Divide you income with the categories")
            
            Divider()
            
            HStack {
                TextField("value division", text: $divIncomeValue)
                
                Picker("category", selection: $categoryPicked) {
                                ForEach(categories, id: \.self) {
                                    Text($0)
                                }
                            }
                            .pickerStyle(.menu)
            }
            
//            Button {
//
//            } label: {
//                Text
//            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
