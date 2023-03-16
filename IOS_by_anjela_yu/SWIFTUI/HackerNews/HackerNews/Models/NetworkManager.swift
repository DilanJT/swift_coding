//
//  NetworkManager.swift
//  HackerNews
//
//  Created by user223941 on 2/23/23.
//

import Foundation

// broadcast one or many object for any interested parties (var
class NetworkManager: ObservableObject{
    
    // Published property rapper is used to publish this variable to any interested parties
    @Published var posts = [Post]() // initialised a new array of posts object
    
    func fetchData() {
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(Results.self, from: safeData)
                            // since the posts are being accessed by other parities the updates needs to be done in the main thread
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                            
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
    
    
}
