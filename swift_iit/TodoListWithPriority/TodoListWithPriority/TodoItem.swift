//
//  TodoItem.swift
//  TodoListWithPriority
//
//  Created by Dilan Jayamanne on 2023-03-15.
//

import Foundation


struct TodoItem: Identifiable {
    var id: UUID
    var taskName: String
    var taskDescription: String
    var priorityLevel: Double
    
    init(name: String, description: String, priority: Double) {
        self.id = UUID()
        self.taskName = name
        self.taskDescription = description
        self.priorityLevel = priority
    }
    
    
}
