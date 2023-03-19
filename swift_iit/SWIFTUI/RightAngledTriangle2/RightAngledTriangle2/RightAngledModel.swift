//
//  RightAngledModel.swift
//  RightAngledTriangle2
//
//  Created by Dilan Jayamanne on 2023-03-17.
//

import Foundation

class RightAngledModel: ObservableObject {
    
    @Published var base: String = "0.0"
    @Published var altitude: String = "0.0"
    @Published var hypotenuse: String = "0.0"
    @Published var perimeter: String = "0.0"
    @Published var area: String = "0.0"
    
    
    init(a: String, b: String, c: String) {
        self.base = b
        self.altitude = a
        self.hypotenuse = c
    }
    
    func findAltitude(){
        // find a
        
        guard let c = Double(self.hypotenuse) else {return}
        let powC = pow(c, 2)
        guard let b = Double(self.altitude) else {return}
        let powB = pow(b, 2)
        let a = sqrt(powC - powB)
        self.altitude = String(format: "%.2f", a)
        
        
    }
    
    func findBase(){
        // find b
        guard let c = Double(self.hypotenuse) else {return}
        let powC = pow(c, 2)
        guard let a = Double(self.altitude) else {return}
        let powA = pow(a, 2)
        let b = sqrt(powC - powA)
        self.base = String(format: "%.2f", b)
        
    }
    
    func findHypotenuse(){
        // find c
        guard let a = Double(self.altitude) else {return}
        let powA = pow(a, 2)
        guard let b = Double(self.base) else {return}
        let powB = pow(b, 2)
        let c = sqrt(powA - powB)
        
        self.hypotenuse = String(format: "%.2f", c)
    }
    
    func findPerimeter() {
        guard let b = Double(self.base) else {return}
        guard let a = Double(self.altitude) else {return}
        guard let c = Double(self.hypotenuse ) else {return}
        let p = b + a + c
        self.perimeter = String(p)
    }
    
    func findArea() {
        guard let b = Double(self.base) else {return}
        guard let a = Double(self.altitude) else {return}
        let area = (b * a)/2
        self.area = String(area)
    }
}
