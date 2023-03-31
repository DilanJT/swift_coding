//
//  ContentView.swift
//  PizzaJsonApp
//
//  Created by Dilan Jayamanne on 2023-03-30.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var pizzaStore: PizzaStore
    @State private var isPresentingAddPizzaModel = false
    @State private var newPizza = Pizza(name: "", ingredients: "", imageName: "", thumbnailName: "", type: "")
    
    var body: some View {
        NavigationStack {
            TabView {
                PizzaList(pizzas: pizzaStore.pizzas)
                    .tabItem{
                        Label("All Pizzas", systemImage: "cart")
                    }
                PizzaList(pizzas: pizzaStore.pizzas.filter {$0.type == "meet"})
                    .tabItem {
                        Label("Meet Pizzas", systemImage: "circle")
                    }
                
                PizzaList(pizzas: pizzaStore.pizzas.filter { $0.type == "vegetarian"})
                    .tabItem {
                        Label("Vegetarian Pizzas", systemImage: "leaf")
                    }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isPresentingAddPizzaModel = true
                    }label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $isPresentingAddPizzaModel) {
                AddPizzaView(pizza: $newPizza, isPresented: $isPresentingAddPizzaModel)
                    .environmentObject(pizzaStore)
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
