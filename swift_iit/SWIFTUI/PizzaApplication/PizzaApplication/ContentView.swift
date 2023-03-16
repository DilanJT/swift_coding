//
//  ContentView.swift
//  PizzaApplication
//
//  Created by Dilan Jayamanne on 2023-03-10.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = PizzaViewModel()
        
        var body: some View {
            TabView{
                PizzaList(viewModel: viewModel).tabItem {
                    Label("Pizza List", systemImage: "list.bullet")
                }
                FavouritePizzaList().tabItem {
                    Label("Favourites", systemImage: "star.fill")
                }
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
