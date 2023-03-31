//
//  Pizza.swift
//  PizzaJsonApp
//
//  Created by Dilan Jayamanne on 2023-03-30.
//

import Foundation

struct Pizza: Identifiable, Decodable, Encodable {
    var id = UUID()
    var name: String
    var ingredients: String
    var imageName: String
    var thumbnailName: String
    var type: String
}
