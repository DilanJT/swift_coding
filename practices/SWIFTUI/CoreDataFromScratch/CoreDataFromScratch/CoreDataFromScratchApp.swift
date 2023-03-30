//
//  CoreDataFromScratchApp.swift
//  CoreDataFromScratch
//
//  Created by Dilan Jayamanne on 2023-03-29.
//

import SwiftUI

@main
struct CoreDataFromScratchApp: App {
    
    let persistenceController = PersistenceController.shared
    @Environment(\.scenePhase) var scenePhase
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .onChange(of: scenePhase) { _ in
                    persistenceController.save()
                }
        }
    }
}
