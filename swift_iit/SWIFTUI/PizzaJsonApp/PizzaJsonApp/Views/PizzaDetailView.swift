//
//  PizzaDetailView.swift
//  PizzaJsonApp
//
//  Created by Dilan Jayamanne on 2023-03-30.
//

import SwiftUI

struct PizzaDetailView: View {
    
    let pizza: Pizza
    
    var body: some View {
        VStack {
            Image(pizza.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text(pizza.name)
                .font(.title)
                .padding(.top)
            Text("Ingredients:")
                .font(.headline)
                .multilineTextAlignment(.leading)
                .padding(.top)
            
            ForEach(pizza.ingredients.components(separatedBy: ","), id: \.self) { ingredient in
                Text("• " + ingredient.trimmingCharacters(in: .whitespacesAndNewlines))
                    .padding(.leading)
            }
            Spacer()
        }
        .navigationTitle(pizza.name)
    }
}

struct PizzaDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PizzaDetailView(pizza:
            Pizza(
                name: "Chicken Sizzler",
                ingredients: "Green Chillies, Jalapenos, Red Onions, Chicken",
                imageName: "chicken_sizzler",
                thumbnailName: "thumbnail_chicken_sizzler",
                type: "meat"
            ))
    }
}
