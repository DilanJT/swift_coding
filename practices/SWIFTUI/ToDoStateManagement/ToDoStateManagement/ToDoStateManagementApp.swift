//
//  ToDoStateManagementApp.swift
//  ToDoStateManagement
//
//  Created by Dilan Jayamanne on 2023-03-13.
//

import SwiftUI

@main
struct ToDoStateManagementApp: App {
    
    @StateObject var todoManager = ToDoListManager()
    
    var body: some Scene {
        WindowGroup {
            TodoListView(todoManager: todoManager)
        }
    }
}
