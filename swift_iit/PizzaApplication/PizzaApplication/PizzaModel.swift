//
//  PizzaModel.swift
//  PizzaApplication
//
//  Created by Dilan Jayamanne on 2023-03-10.
//

import Foundation

struct PizzaModel: Identifiable {
    let id = UUID()
    let name: String
    let ingredients : String
    let imgName : String
    let thumbnail : String
    let pizzaType : String
}
