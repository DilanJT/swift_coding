//
//  TriangleModel.swift
//  RightAngledTriangle
//
//  Created by Dilan Jayamanne on 2023-03-18.
//

import Foundation
class TriangleModel : ObservableObject{
    
    @Published var altitude: String
    @Published var base: String
    @Published var hypotenuse: String
    @Published var area: String
    @Published var perimeter: String
    @Published var unknownValue: String
    
    init() {
        self.altitude = ""
        self.base = ""
        self.hypotenuse = ""
        self.area = ""
        self.perimeter = ""
        self.unknownValue = "Altitude"
    }
    
    func findAltitude() {
        print("---------find altitude is called ----------")
        
        print("Base \(self.base)")
        print("Hyptenuse \(self.hypotenuse)")
        guard
            let b = Double(self.base),
            let c = Double(self.hypotenuse) else {return}
        
        print(b)
        print(c)
        let a = (pow(c, 2) - pow(b, 2)).squareRoot()
        
        
        print("a -< \(a)")
        self.hypotenuse = String(format: "%.2f", a)
        print("Altitude calculated -> \(self.altitude)")
    }
    
    func findBase() {
        print("---------find base is called ----------")
        guard
            let a = Double(self.altitude),
            let c = Double(self.hypotenuse) else {return}
        
        let b = sqrt(pow(c, 2) - pow(a, 2))
        self.base = String(format: "%.2f", b)
        print("Base calculated -> \(self.base)")
    }
    
    func findHypotenuse(){
        print("---------find hypotenuse is called ----------")
        guard
            let a = Double(self.altitude),
            let b = Double(self.base) else {return}
        
        let c = sqrt(pow(a, 2) + pow(b, 2))
        self.hypotenuse = String(format: "%.2f", c)
        print("Hypotenuse calculated -> \(self.hypotenuse)")
    }
    
    func findArea() {
        print("---------find area is called ----------")
        guard
            let height = Double(self.altitude),
            let length = Double(self.base) else {return}
        
        let ans = (height * length) / 2
        print("ans \(ans)")
        self.area = String(format: "%.2f", ans)
        print("Area calculated -> \(self.area)")
    }
    
    func findPerimeter() {
        print("---------find perimeter is called ----------")
        guard
            let a = Double(self.altitude),
            let b = Double(self.base),
            let c = Double(self.hypotenuse) else {return}
        
        let ans = a + b + c
        print("ans \(ans)")
        self.perimeter = String(format: "%.2f", ans)
        print("Perimter calculated -> \(self.perimeter)")
    }
    
    func resetValues() {
        print("---------reset values is called ----------")
        self.area = ""
        self.base = ""
        self.altitude = ""
        self.hypotenuse = ""
        self.perimeter = ""
        self.unknownValue = ""
        print("checking values if resetted base:\(self.base), altitude:\(self.altitude), hypotenuse:\(self.base), area:\(self.area), perimeter:\(self.perimeter)")
    }
}

enum Edge: String, CaseIterable, Identifiable {
    case altitude, base, hypotenuse
    var id: Self { self }
}
