//
//  ContentView.swift
//  QuadraticSolver
//  Starter project code
//  Created by Philip Trwoga on 09/02/2023.
//

import SwiftUI


struct ContentView: View {
    //state vars for a,b,c,x1, and x2
    @State var a: String = ""
    @State var b: String = ""
    @State var c: String = ""
    
    @State var x1: String = ""
    @State var x2: String = ""
    //data persistence
    var body: some View {
        ScrollView {
            VStack {
                Text("Quadratic Solver")
                Text("The quadratic form is:")
                Image("quadraticForm").resizable().scaledToFit()
                Label("Enter the first term", systemImage: "a.circle.fill")
                TextField("first term", text: $a)
                    .multilineTextAlignment(.center)
                
                Label("Enter the second term", systemImage:
                "b.circle.fill")
                TextField("second term", text: $b)
                    .multilineTextAlignment(.center)
                
                Label("Enter the third term", systemImage:
                "c.circle.fill")
                TextField("third term", text: $c)
                    .multilineTextAlignment(.center)
                
                Button() {
                    solveForX()
                    
                }label: {
                    Text("Solve for x")
                }
                //Image(...)
                //  TextField(...)
                // etc.
                
                // Button(...)
            }.padding()
            Text("x1=\(x1) x2=\(x2)")
        }
        
    }
    func solveForX()
    {
        //  your code here
        guard let aterm = Double(a) else {return}
        guard let bterm = Double(b) else {return}
        guard let cterm = Double(c) else {return}
        
        let squareRoot = sqrt(pow(bterm, 2) - (4 * aterm * cterm))
        
        let x1Value = (-bterm + squareRoot) / 2*aterm
        
        let x2Value = (-bterm - squareRoot) / 2*aterm
        
        self.x1 = String(format: "%.2f",x1Value)
        self.x2 = String(format: "%.2f", x2Value)
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
