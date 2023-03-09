//
//  ContentView.swift
//  WeatherApp
//
//  Created by user223941 on 2/17/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView(selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Selection@*/.constant(1)/*@END_MENU_TOKEN@*/) {
            HomeView().tabItem {
                Label("Home", systemImage: "house")
            }
            
            SearchView().tabItem {
                Label("Search", systemImage: "magnifyingglass")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
