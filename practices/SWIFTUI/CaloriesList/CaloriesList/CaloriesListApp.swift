//
//  CaloriesListApp.swift
//  CaloriesList
//
//  Created by Dilan Jayamanne on 2023-03-29.
//

import SwiftUI

@main
struct CaloriesListApp: App {
    @StateObject private var dataController = PersistenceController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
