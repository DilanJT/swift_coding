//
//  PizzaList.swift
//  PizzaJsonApp
//
//  Created by Dilan Jayamanne on 2023-03-30.
//

import SwiftUI

struct PizzaList: View {
    
    let pizzas: [Pizza]
    
    var body: some View {
        NavigationView {
            List(pizzas) {pizza in
                NavigationLink(destination: PizzaDetailView(pizza: pizza)) {
                    HStack {
                        Image(pizza.thumbnailName)
                            .resizable()
                            .frame(width: 50, height: 50)
                        
                        Text(pizza.name)
                    }
                }
            }
            .navigationTitle("Pizza Menu")
        }
    }
}

struct PizzaList_Previews: PreviewProvider {
    static var previews: some View {
        PizzaList(pizzas: [
            Pizza(
                name: "Chicken Sizzler",
                ingredients: "Green Chillies, Jalapenos, Red Onions, Chicken",
                imageName: "chicken_sizzler",
                thumbnailName: "thumbnail_chicken_sizzler",
                type: "meat"
            )
        ])
    }
}
