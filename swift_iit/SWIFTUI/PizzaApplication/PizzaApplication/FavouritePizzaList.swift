//
//  Favourites.swift
//  PizzaApplication
//
//  Created by Dilan Jayamanne on 2023-03-10.
//

import SwiftUI

struct FavouritePizzaList: View {
    
    @ObservedObject var viewModel = PizzaViewModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.filterFavouritePizzas()) { pizza in
                    
                    HStack {
                        Image("\(pizza.imageName ?? "")")
                            .resizable()
                            .frame(width: 100, height: 100)
                        
                        Text("\(pizza.name ?? "")")
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Favourite Person")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct Favourites_Previews: PreviewProvider {
    static var previews: some View {
        FavouritePizzaList(viewModel: PizzaViewModel())
    }
}
