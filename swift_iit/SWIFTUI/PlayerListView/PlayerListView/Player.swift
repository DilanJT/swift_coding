//
//  Player.swift
//  PlayerListView
//
//  Created by Dilan Jayamanne on 2023-03-30.
//

import Foundation

struct Player: Identifiable {
    var id = UUID()
    var name: String
    var imageName: String
    var bio: String
}


let playersData = [

    Player(name: "John Terry", imageName: "jt", bio: "Career:\n" +
           "• Main Club - Chelsea  \n" +
           "• Position - Centre-back\n " +
           "• England Caps - 58\n"),
    Player(name: "Alan Shearer", imageName: "sheare", bio: "Career:\n" +
           "• Main Clubs - Southampton, Blackburn Rovers, Newcastle United  \n" +
           "• Position - Striker\n " +
           "• England Caps - 63\n"),

    Player(name: "Cristiano Ronaldo", imageName: "ronaldo", bio: "Career:\n" +
           "• Main Club - Man Utd, Real Madrid  \n" +
           "• Position - Striker\n " +
           "• Portugal Caps - 132\n"),
    Player(name: "Paul Scoles", imageName: "scholes", bio: "Career:\n" +
           "• Main Club - Man Utd  \n" +
           "• Position - Cetral midfield\n " +
           "• England Caps - 66\n"),
    Player(name: "Rio Ferdinand", imageName: "rio", bio: "Career:\n" +
           "• Main Clubs - West Ham, Leeds Utd, Man Utd  \n" +
           "• Position - Centre-back\n " +
           "• England Caps - 81\n" ),
    Player(name: "Thiery Henry", imageName: "henry", bio: "Career:\n" +
           "• Main Clubs - Monaco, Arsenal, Barcelona  \n" +
           "• Position - Stiker\n " +
           "• France Caps - 123\n"),
    Player(name: "Ryan Giggs", imageName: "giggs", bio: "Career:\n" +
           "• Main Club - Man Utd \n" +
           "• Position - Winger\n " +
           "• Wales Caps - 64\n"),
    Player(name: "Gary Neville", imageName: "gary", bio: "Career:\n" +
           "• Main Club - Man Utd  \n" +
           "• Position - Right-back\n " +
           "• England Caps - 85\n"),
    Player(name: "Ashley Cole", imageName: "ashley", bio: "Career:\n" +
           "• Main Clubs - Arsenal, Chelsea  \n" +
           "• Position - Left-back\n " +
           "• England Caps - 107\n"),
    Player(name: "Peter Scmichael", imageName: "peter", bio: "Career:\n" +
           "• Main Club - Man Utd  \n" +
           "• Position - Goalkeeper \n " +
           "• Denmark Caps - 129\n"),
]
