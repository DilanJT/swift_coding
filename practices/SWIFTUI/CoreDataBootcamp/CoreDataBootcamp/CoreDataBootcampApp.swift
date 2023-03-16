//
//  CoreDataBootcampApp.swift
//  CoreDataBootcamp
//
//  Created by Dilan Jayamanne on 2023-03-13.
//

import SwiftUI

@main
struct CoreDataBootcampApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
