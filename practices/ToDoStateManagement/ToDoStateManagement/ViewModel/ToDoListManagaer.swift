//
//  ToDoListManagaer.swift
//  ToDoStateManagement
//
//  Created by Dilan Jayamanne on 2023-03-13.
//

import Foundation

class ToDoListManager: ObservableObject {
    
    @Published var items: [Item] = [Item(id: UUID(), name: "first"), Item(id: UUID(), name: "second"), Item(id: UUID(), name: "third")]
    
    init() {
        // get my data and set to my items array
        
    }
    
    func delete(at indexSet: IndexSet) {
        for index in indexSet {
            items.remove(at: index)
        }
        
    }
    
    func move(indices: IndexSet, newOffset: Int) {
        items.move(fromOffsets: indices, toOffset: newOffset)
    }
    
    func addItem(item: Item){
        items.append(item)
    }
}
