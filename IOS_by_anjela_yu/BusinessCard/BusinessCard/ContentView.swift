//
//  ContentView.swift
//  BusinessCard
//
//  Created by user223941 on 2/17/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(red: 0.10, green: 0.74, blue: 0.61)
                .ignoresSafeArea()
            
            VStack {
                Image("dilan")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width * 0.45,
                           height: UIScreen.main.bounds.width * 0.45)
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(Color.white, lineWidth: 5)
                    )
                
                Text("Dilan Jayamanne")
                    .font(Font.custom("Pacifico-Regular", size: 40))
                    .bold()
                    .foregroundColor(.white)
                
                Text("dilanjt")
                    .font(Font.custom("Cinzel-Regular", size: 30))
                
                Divider()
                
                DetailCard(
                    iconName: "phone.fill",
                    detailText: "Tel: +94766109200",
                    textSize: 20,
                    textStyle: "Cinzel-Regular"
                )
                
                DetailCard(iconName: "mail.fill", detailText: "dicmandilan@gmail.com", textSize: 20)
                    
                    
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


