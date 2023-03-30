//
//  ContentView.swift
//  PlayerListView
//
//  Created by Dilan Jayamanne on 2023-03-30.
//

import SwiftUI

struct PlayerListView: View {
    
    @State var players: [Player] = playersData
    @EnvironmentObject var playersList: PlayerList
    
    var body: some View {
        VStack {
            NavigationView {
                List() {
                    ForEach(playersList.playerList) { player in
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
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        EditButton()
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            addItemToList(player: Player(name: "Peter Scmichael", imageName: "peter", bio: "random bio"))
                            
                        }label: {
                            Image(systemName: "plus")
                        }
                    }
                    
                }
                
                
            }
            
        }
    }
    
    func addItemToList(player: Player) {
        self.playersList.addPlayer(newPlayer: player)
    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerListView().environmentObject(PlayerList())
    }
}
