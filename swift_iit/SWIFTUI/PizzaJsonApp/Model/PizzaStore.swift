//
//  PizzaStore.swift
//  PizzaJsonApp
//
//  Created by Dilan Jayamanne on 2023-03-30.
//

import Foundation
class PizzaStore: ObservableObject {
    @Published var pizzas: [Pizza] = []
    
    init() {
        let userDefaults = UserDefaults.standard
        
        // Try to read the pizzas data from user defaults
        if let pizzasData = userDefaults.data(forKey: "pizzas"),
           let pizzas = try? JSONDecoder().decode([Pizza].self, from: pizzasData) {
            self.pizzas = pizzas
        }
        
        // If pizzas data is not available in userDefaults, load it from the bundled pizzas.json file
        else if let url = Bundle.main.url(forResource: "pizzas", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                self.pizzas = try decoder.decode([Pizza].self, from: data)
                // save the data loaded pizzas data to user defaults
                let pizzasData = try JSONEncoder().encode(self.pizzas)
                userDefaults.set(pizzasData, forKey: "pizzas")
            } catch {
                print("Error decoding pizza data: \(error)")
            }
        }
    }
    
    // Function to save the pizza data to user defaults
    func savePizzasToUserDefaults() {
        let userDefaults = UserDefaults.standard
        do {
            let pizzasData = try JSONEncoder().encode(self.pizzas)
            userDefaults.set(pizzasData, forKey: "pizzas")
        } catch {
            print("Error encoding pizza data: \(error)")
        }
    }
    
    func deletePizza(_ pizza: Pizza) {
        if let index = pizzas.firstIndex(where: {$0.id == pizza.id}) {
            pizzas.remove(at: index)
            savePizzasToUserDefaults()
        }
    }
}
