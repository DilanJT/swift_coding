//
//  ContentView.swift
//  HackerNews
//
//  Created by user223941 on 2/20/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            // For every single post in posts array Iam going to use Text component to pass the title propoerty of each post object
            List(posts) { post in
                Text(post.title)
            }.navigationTitle("Hacker News")
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// Identifiable is a protocol that allow the List to record the order of the Post objects
//struct Post: Identifiable{
    // If we have a protocol called Identifiable we need to have an id inside the structure
//    let id: String
//    let title: String
//}

let posts = [
    Post(id: "1", title: "Hello"),
    Post(id: "2", title: "Bonjour"),
    Post(id: "3", title: "Hola")
]


// https://hn.algolia.com/api
// api -> https://hn.algolia.com/api/v1/search?tags=front_page
