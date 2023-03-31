//
//  PizzaJsonAppApp.swift
//  PizzaJsonApp
//
//  Created by Dilan Jayamanne on 2023-03-30.
//

import SwiftUI

@main
struct PizzaJsonAppApp: App {
    @StateObject var pizzaStore = PizzaStore()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(PizzaStore())
        }
    }
}
