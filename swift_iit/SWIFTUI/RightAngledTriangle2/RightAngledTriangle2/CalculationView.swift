//
//  CalculationView.swift
//  RightAngledTriangle2
//
//  Created by Dilan Jayamanne on 2023-03-17.
//

import SwiftUI

struct CalculationView: View {
    @ObservedObject var rightAngledModel: RightAngledModel
    @State var selection: String = "Base(b)"
    @State var rightAngledSides: [String] = ["Altitude(a)", "Base(b)", "Hypotenuse(c)"]
    
    @State var unknownValues: [String] = ["Altitude(a)", "Hypotenuse(c)"]
    
    @State var firstTextField: String = ""
    @State var secondTextField: String = ""
    
    @State var firstPlaceHolder: String = ""
    @State var secondPlaceHolder: String = ""
    
    @State private var displayMode = false

    var body: some View {

        ScrollView{
            VStack {
                VStack{
                    
                    Text("Right Angled Triangle")
                        .font(.largeTitle)

                    Image("right_triangle")
                        .resizable()
                        .scaledToFit()
                    
                    HStack {
                        
                        Text("Choose the unknown edge")
                        
                        Picker("select", selection: $selection) {
                            ForEach(rightAngledSides, id:\.self) { item in
                                Text("\(item)")
                            }
                            
                        }
                        .pickerStyle(.wheel)
                        .onChange(of: selection) { _ in
                            displayMode = false
                        }
                        
                        
                        
                    }
                    
                    Divider()
                    Text("Enter the known length values")
                    
                    if selection == "Base(b)" {
                        TextField("Base value", text: $firstTextField)
                            
                        TextField("Second value", text: $secondTextField)
                    }else if (selection == "Altitude(a)") {
                        TextField("Base value", text: $firstTextField)
                        TextField("Hypotenuse value", text: $secondTextField)
                    }else {
                        TextField("Altitude value", text: $firstTextField)
                        TextField("Base value", text: $secondTextField)
                    }
                    
                    
//                    TextField("\(unknownValues[0])", text: $firstTextField)
//                        .border(.black)
//
//                    TextField("\(unknownValues[1])", text: $secondTextField)
//                        .border(.black)
                    
                    Button {
                        
                        calculate()
                    } label: {
                        Text("Calculate")
                    }.buttonStyle(.borderedProminent)
                        .tint(Color(.green))
                    
                    Divider()
                    
                }.padding()
                
                if displayMode {
                    VStack {
                        HStack{
                            Text(selection)
                            Spacer()
                            
                            if(selection == "Altitude(a)") {
                                Text("\(rightAngledModel.altitude)")
                                
                            }else if(selection == "Base(b)")  {
                                Text("\(rightAngledModel.base)")
                            }else if(selection == "Hypotenuse(c)") {
                                Text("\(rightAngledModel.hypotenuse)")
                            }
                            
                        }
                        
                        HStack{
                            Text("Area")
                            Spacer()
                            Text("\(rightAngledModel.area)")
                        }
                        
                        HStack{
                            Text("Perimeter")
                            Spacer()
                            Text("\(rightAngledModel.perimeter)")
                        }
                    }.padding()
                }
            }
            
            
            
            
        }
        
    }
    
    func setUnknownValues() {
        
        print("setUnkownValues function is called")
        
        // resetting the values before setting
        var count = 0
        for item in rightAngledSides {
            if (item != selection ) {
                unknownValues[count] = item
                count += 1
            }
            
        }
        
        //setting the textfields
        firstPlaceHolder = unknownValues[0]
        print("first placeholder \(firstPlaceHolder)")
        
        secondPlaceHolder = unknownValues[1]
        print("second placeholder \(secondPlaceHolder)")
        
        print(unknownValues)
    }
    
    func calculate() {
        
        displayMode = true
        
        print("calculate function is called")
        
        if(selection == "Altitude(a)") {
            self.rightAngledModel.base = self.firstTextField
            self.rightAngledModel.hypotenuse = self.secondTextField
            self.rightAngledModel.findAltitude()
            
            
            print("altitude \(self.rightAngledModel.altitude)")
        }else if(selection == "Base(b)")  {
            self.rightAngledModel.altitude = firstTextField
            self.rightAngledModel.hypotenuse = secondTextField
            self.rightAngledModel.findBase()
            print("base \(self.rightAngledModel.base)")
        }else if(selection == "Hypotenuse(c)") {
            self.rightAngledModel.altitude = firstTextField
            self.rightAngledModel.base = secondTextField
            self.rightAngledModel.findHypotenuse()
        }
        
        self.rightAngledModel.findPerimeter()
        self.rightAngledModel.findArea()
    }
}

struct CalculationView_Previews: PreviewProvider {
    static var previews: some View {
        CalculationView(rightAngledModel: RightAngledModel(a: "", b: "", c:""))
    }
}
