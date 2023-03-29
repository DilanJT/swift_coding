//
//  ContentView.swift
//  RightAngledTriangle
//
//  Created by Dilan Jayamanne on 2023-03-18.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var triangleModel: TriangleModel = TriangleModel()
    @State var selectedEdge: Edge = Edge.altitude
    @State var showOutput: Bool = false
    
    
    
    
    var body: some View {
        TabView {
            CalculationView(
                selectedEdge: $selectedEdge, showOutput: $showOutput, triangleModel: triangleModel
            )
            .tabItem {
                Label("Calculator", systemImage: "sum")
            }
            
            
            
            HistoryView()
                .tabItem{
                    Label("History", systemImage: "list.dash")
                }
            
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
