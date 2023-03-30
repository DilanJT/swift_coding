//
//  ContentView.swift
//  PlayerListView
//
//  Created by Dilan Jayamanne on 2023-03-30.
//

import SwiftUI

struct PlayerListView: View {
    
    @State var players: [Player] = playersData
    
    var body: some View {
        VStack {
            NavigationView {
                List() {
                    ForEach(players) { player in
                        NavigationLink(destination: PlayerDetailView(player: player)) {
                            
                            HStack {
                                Image(player.imageName)
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .clipShape(Circle())
                                
                                Text("\(player.name)")
                            }
                        }
                    }
                    .onDelete{ indexSet in
                        players.remove(atOffsets: indexSet)
                    }
                    
                }
                .navigationTitle("Top EPL Players")
                
                
            }
            
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerListView()
    }
}
