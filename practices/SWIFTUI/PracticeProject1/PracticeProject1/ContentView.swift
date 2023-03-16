//
//  ContentView.swift
//  PracticeProject1
//
//  Created by Dilan Jayamanne on 2023-03-10.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var book = Book(
        name: "Treasure Island",
        author: "Anita Desai",
        readCount: 1
    )
    
    var body: some View {
        VStack {
            Text("Book data")
            TextField("Book name", text: $book.name)
            
            TextField("Book author", text: $book.author)
            
            
            Button {
                book.incrementReadCount()
            } label: {
                Label("Increment", systemImage: "plus.circle")
            }
            
            Divider()
            Text("\(book.name)")
            Text("\(book.author)")
            ExtractedView(book: book)
        }
        .padding()
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ExtractedView: View {
    @ObservedObject var book: Book
    var body: some View {
        Text("\(book.getReadCount())")
            .fontWeight(.heavy)
            .font(.largeTitle)
        Text("Below button is triggered from a subview")
        Button {
            self.book.decrementReadCount()
        } label: {
            Label("Decrement", systemImage: "minus.circle")
        }
    }
}
