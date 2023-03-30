//
//  CaloriesList.swift
//  CaloriesList
//
//  Created by Dilan Jayamanne on 2023-03-29.
//

import SwiftUI

struct CaloriesList: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Calorie.name, ascending: true)],
        animation: .default)
    private var calories: FetchedResults<Calorie>
    
    var body: some View {
        NavigationView {
            List {
                ForEach(calories) { calorie in
                    NavigationLink(
                        destination: CalorieView(calorie: calorie)
                    ) {
                        Text(calorie.name ?? "")
                    }
                }
                .onDelete(perform: deleteCalorie)
            }
            .navigationTitle("Calories")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(
                        destination: AddCalorieView(),
                        label: {
                            Image(systemName: "plus")
                        })
                }
            }
        }
    }
    
    private func deleteCalorie(offsets: IndexSet) {
        withAnimation {
            offsets.map { calories[$0] }.forEach(viewContext.delete)
            PersistenceController.shared.save()
        }
    }
}

struct CaloriesList_Previews: PreviewProvider {
    static var previews: some View {
        CaloriesList()
    }
}
