//
//  BookModel.swift
//  PracticeProject1
//
//  Created by Dilan Jayamanne on 2023-03-10.
//

import Foundation


class Book : ObservableObject {
    @Published var name:String
    @Published var author: String
    @Published private var readCount: Int
    
    init(name: String, author: String, readCount: Int) {
        self.name = name
        self.author = author
        self.readCount = readCount
    }
    
    func incrementReadCount(){
        self.readCount += 1
    }
    
    func getReadCount() -> Int {
        return readCount;
    }
}
