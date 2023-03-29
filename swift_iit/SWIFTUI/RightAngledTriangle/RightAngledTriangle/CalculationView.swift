//
//  CalculationView.swift
//  RightAngledTriangle
//
//  Created by Dilan Jayamanne on 2023-03-19.
//

import SwiftUI

struct CalculationView: View {
    
    @Binding var selectedEdge: Edge
    @Binding var showOutput: Bool
    @ObservedObject var triangleModel: TriangleModel
    
    @AppStorage("Base") private var baseAppStorage = ""
    @AppStorage("Altitude") private var altitudeAppStorage = ""
    @AppStorage("Hypotenuse") private var hypotenuseAppStorage = ""
    
    @AppStorage("Area") private var AppStorageAreaValue = ""
    @AppStorage("Perimeter") private var AppStoragePremiterValue = ""
    
    
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Image("right_triangle")
                    HStack{
                        Text("Choose the unknown edge")
                        Picker("edge_unknown", selection: $selectedEdge) {
                            Text("Altitude").tag(Edge.altitude)
                            Text("Base").tag(Edge.base)
                            Text("Hypotenuse").tag(Edge.hypotenuse)
                        }
                        .pickerStyle(.wheel)
                        .onChange(of: selectedEdge) { _ in
                            print("on change is called")
                            
                            print("unknown value: \(triangleModel.unknownValue)")
                            showOutput = false
                            triangleModel.resetValues()
                            setUnknownValue()
                        }
                    }
                    
                    Text("Enter unknown length values")
                    
                    if(selectedEdge == Edge.altitude) {
                        TextField("Base", text: $triangleModel.base)
                            .textFieldStyle(.roundedBorder)
                        TextField("Hypotenuse", text: $triangleModel.hypotenuse)
                            .textFieldStyle(.roundedBorder)
                    }else if(selectedEdge == Edge.base) {
                        TextField("Altitude", text: $triangleModel.altitude)
                            .textFieldStyle(.roundedBorder)
                        TextField("Hypotenuse", text: $triangleModel.hypotenuse)
                            .textFieldStyle(.roundedBorder)
                    }else {
                        TextField("Altitude", text: $triangleModel.altitude)
                            .textFieldStyle(.roundedBorder)
                        TextField("Base", text: $triangleModel.base)
                            .textFieldStyle(.roundedBorder)
                    }
                    
                    Button {
                        calculate()
                        showOutput = true
                    }label: {
                        Text("Calculate")
                            .font(.title)
                    }
                    .tint(.green)
                    .buttonStyle(.borderedProminent)
                    
                }.padding()
                
                if(showOutput){
                    VStack {
                        HStack {
                            Text("\(triangleModel.unknownValue)")
                            Spacer()
                            if(selectedEdge == Edge.altitude){
                                Text("\(triangleModel.altitude)")
                            }else if(selectedEdge == Edge.base) {
                                Text("\(triangleModel.base)")
                            }else {
                                Text("\(triangleModel.hypotenuse)")
                            }
                        }
                        HStack{
                            Text("Area")
                            Spacer()
                            Text("\(triangleModel.area)")
                        }
                        HStack {
                            Text("Perimeter")
                            Spacer()
                            Text("\(triangleModel.perimeter)")
                        }
                    }.padding()
                }
                
            }
            .navigationTitle(Text("Triangular Solver"))
        }
    }
    
    func calculate() {
        if(selectedEdge == Edge.altitude) {
            print("Finding altitude")
            triangleModel.findAltitude()
        }else if (selectedEdge == Edge.hypotenuse) {
            print("Finding hypotenuse")
            triangleModel.findHypotenuse()
        }else if (selectedEdge == Edge.base) {
            print("finding base")
            triangleModel.findBase()
        }
        
        triangleModel.findArea()
        triangleModel.findPerimeter()
        
        baseAppStorage = triangleModel.base
        altitudeAppStorage = triangleModel.altitude
        hypotenuseAppStorage = triangleModel.hypotenuse
        AppStorageAreaValue = triangleModel.area
        AppStoragePremiterValue = triangleModel.perimeter
        
    }
    
    func setUnknownValue() {
        if(selectedEdge == Edge.altitude) {
            triangleModel.unknownValue = "Altitude"
        }else if (selectedEdge == Edge.hypotenuse) {
            triangleModel.unknownValue = "Hypotenuse"
        }else if (selectedEdge == Edge.base) {
            triangleModel.unknownValue = "Base"
        }
    }
}

struct CalculationView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        let showOutput = Binding<Bool>(get: { false }, set: { _ in })
        let selectedEdge = Binding<Edge>(get: {Edge.altitude}, set: { _ in})
        
        CalculationView(
            selectedEdge: selectedEdge,
            showOutput: showOutput,
            triangleModel: TriangleModel()
        )
    }
}
