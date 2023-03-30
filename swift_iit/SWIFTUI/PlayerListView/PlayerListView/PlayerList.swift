//
//  PlayerList.swift
//  PlayerListView
//
//  Created by Dilan Jayamanne on 2023-03-30.
//

import Foundation

class PlayerList: ObservableObject {
    
    @Published var playerList: [Player] = []
    
    init() {
        print("player list initialised")
        
        let player1 = Player(name: "John Terry", imageName: "jt", bio: "Career:\n" +
                             "• Main Club - Chelsea  \n" +
                             "• Position - Centre-back\n " +
                             "• England Caps - 58\n")
        
        let player2 = Player(name: "Alan Shearer", imageName: "sheare", bio: "Career:\n" +
                             "• Main Clubs - Southampton, Blackburn Rovers, Newcastle United  \n" +
                             "• Position - Striker\n " +
                             "• England Caps - 63\n")
        
        let player3 = Player(name: "Christiano Ronaldo", imageName: "ronaldo", bio: "Player information to be updated.....")
        
        addPlayer(newPlayer: player1)
        addPlayer(newPlayer: player2)
        addPlayer(newPlayer: player3)
    }
    
    public func addPlayer(newPlayer: Player) {
        playerList.append(newPlayer)
    }
    
    public func getPlayerList() -> [Player] {
        return playerList
    }
}
