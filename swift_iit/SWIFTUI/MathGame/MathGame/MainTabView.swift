//
//  MainTabView.swift
//  Assessment
//
//  Created by Visal Rajapakse on 2023-03-20.
//

import SwiftUI

struct MainTabView: View {
    
    @StateObject var gameModel: GameModel = GameModel()
        
    var body: some View {
        // TabView content
        NavigationStack {
            TabView {
                GameView(
                    gameModel: gameModel
                )
                    .tabItem{
                        Label("Guess", systemImage: "checkmark.circle.badge.questionmark.fill")
                    }
                
                SettingsView(
                    gameModel: gameModel
                )
                    .tabItem{
                        Label("Settings", systemImage: "gear.circle.fill")
                    }
            }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
