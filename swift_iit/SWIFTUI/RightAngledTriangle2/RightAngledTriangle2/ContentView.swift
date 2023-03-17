//
//  ContentView.swift
//  RightAngledTriangle2
//
//  Created by Dilan Jayamanne on 2023-03-17.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var rightAngledModel: RightAngledModel = RightAngledModel(a: "", b: "", c:"")
    
    @State var tabSelection: Int = 0
    
    var body: some View {
        VStack {
            TabView(selection: $tabSelection) {
                CalculationView(
                    rightAngledModel: rightAngledModel
                )
                    .tabItem{
                        Label("Calculation",
                              systemImage: "sum")
                    }
                HistoryView()
                    .tabItem{
                        Label("History",
                              systemImage: "list.dash")
                    }
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
