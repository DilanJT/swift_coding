//
//  PlayerDetailView.swift
//  PlayerListView
//
//  Created by Dilan Jayamanne on 2023-03-30.
//

import SwiftUI

struct PlayerDetailView: View {
    var player: Player
    var body: some View {
        VStack {
            HStack {
                Image(player.imageName)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                Text("\(player.name)")
                Text("\(player.bio)")
            }
            
            Image("epl")
                .resizable()
                .scaledToFit()
        }
    }
}

struct PlayerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerDetailView(player: Player(name: "Christiano Ronaldo", imageName: "ronaldo", bio: "good player"))
    }
}
